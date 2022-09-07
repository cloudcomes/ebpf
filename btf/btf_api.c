/* SPDX-License-Identifier: GPL-2.0 */
/* Copyright (c) 2018 Facebook */
#include <linux/bpf.h>
#include <linux/err.h>
#include <linux/kernel.h>
#include <linux/filter.h>
#include <linux/unistd.h>
#include <bpf/bpf.h>
#include <sys/resource.h>
#include <libelf.h>
#include <gelf.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <stdarg.h>
#include <unistd.h>
#include <fcntl.h>
#include <errno.h>
#include <assert.h>
#include <bpf/libbpf.h>

#include <uapi/linux/btf.h>
#include <btf.h>

//#include "bpf_rlimit.h"
//#include "bpf_util.h"
#include "test_btf.h"
#include "test_progs.h"


#define MAX_INSNS	512
#define MAX_SUBPROGS	16


static bool always_log;



#define BTF_END_RAW 0xdeadbeef
#define NAME_TBD 0xdeadb33f

#define NAME_NTH(N) (0xfffe0000 | N)
#define IS_NAME_NTH(X) ((X & 0xffff0000) == 0xfffe0000)
#define GET_NAME_NTH_IDX(X) (X & 0x0000ffff)

#define MAX_NR_RAW_U32 1024

#define BTF_LOG_BUF_SIZE 65535


static char btf_log_buf[BTF_LOG_BUF_SIZE];

/* defined in test_progs.h */
struct test_env env = {};

struct prog_test_def {
	const char *test_name;
	int test_num;
	void (*run_test)(void);
	void (*run_serial_test)(void);
	bool force_log;
	int error_cnt;
	int skip_cnt;
	int sub_succ_cnt;
	bool should_run;
	bool tested;
	bool need_cgroup_cleanup;

	char *subtest_name;
	int subtest_num;

	/* store counts before subtest started */
	int old_error_cnt;
};


extern void test__skip(void);
extern void test__fail(void);


void test__skip(void)
{
	env.test->skip_cnt++;
}

void test__fail(void)
{
	env.test->error_cnt++;
}

static char btf_log_buf[BTF_LOG_BUF_SIZE];

static struct btf_header hdr_tmpl = {
	.magic = BTF_MAGIC,
	.version = BTF_VERSION,
	.hdr_len = sizeof(struct btf_header),
};

/* several different mapv kinds(types) supported by pprint */
enum pprint_mapv_kind_t {
	PPRINT_MAPV_KIND_BASIC = 0,
	PPRINT_MAPV_KIND_INT128,
};

struct btf_raw_test {
	const char *descr;
	const char *str_sec;
	const char *map_name;
	const char *err_str;
	__u32 raw_types[MAX_NR_RAW_U32];
	__u32 str_sec_size;
	enum bpf_map_type map_type;
	__u32 key_size;
	__u32 value_size;
	__u32 key_type_id;
	__u32 value_type_id;
	__u32 max_entries;
	bool btf_load_err;
	bool map_create_err;
	bool ordered_map;
	bool lossless_map;
	bool percpu_map;
	int hdr_len_delta;
	int type_off_delta;
	int str_off_delta;
	int str_len_delta;
	enum pprint_mapv_kind_t mapv_kind;
};


static struct btf_raw_test raw_tests[] = {
/* enum E {
 *     E0,
 *     E1,
 * };
 *
 * struct A {
 *	unsigned long long m;
 *	int n;
 *	char o;
 *	[3 bytes hole]
 *	int p[8];
 *	int q[4][8];
 *	enum E r;
 * };
 */
{
	.descr = "struct test #1",
	.raw_types = {
		/* int */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),	/* [1] */
		/* unsigned long long */
		BTF_TYPE_INT_ENC(0, 0, 0, 64, 8),		/* [2] */
		/* char */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 8, 1),	/* [3] */
		/* int[8] */
		BTF_TYPE_ARRAY_ENC(1, 1, 8),			/* [4] */
		/* struct A { */				/* [5] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 6), 180),
		BTF_MEMBER_ENC(NAME_TBD, 2, 0),	/* unsigned long long m;*/
		BTF_MEMBER_ENC(NAME_TBD, 1, 64),/* int n;		*/
		BTF_MEMBER_ENC(NAME_TBD, 3, 96),/* char o;		*/
		BTF_MEMBER_ENC(NAME_TBD, 4, 128),/* int p[8]		*/
		BTF_MEMBER_ENC(NAME_TBD, 6, 384),/* int q[4][8]		*/
		BTF_MEMBER_ENC(NAME_TBD, 7, 1408), /* enum E r		*/
		/* } */
		/* int[4][8] */
		BTF_TYPE_ARRAY_ENC(4, 1, 4),			/* [6] */
		/* enum E */					/* [7] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_ENUM, 0, 2), sizeof(int)),
		BTF_ENUM_ENC(NAME_TBD, 0),
		BTF_ENUM_ENC(NAME_TBD, 1),
		BTF_END_RAW,
	},
	.str_sec = "\0A\0m\0n\0o\0p\0q\0r\0E\0E0\0E1",
	.str_sec_size = sizeof("\0A\0m\0n\0o\0p\0q\0r\0E\0E0\0E1"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "struct_test1_map",
	.key_size = sizeof(int),
	.value_size = 180,
	.key_type_id = 1,
	.value_type_id = 5,
	.max_entries = 4,
},

}; /* struct btf_raw_test raw_tests[] */

static const char *get_next_str(const char *start, const char *end)
{
	return start < end - 1 ? start + 1 : NULL;
}

static int get_raw_sec_size(const __u32 *raw_types)
{
	int i;

	for (i = MAX_NR_RAW_U32 - 1;
	     i >= 0 && raw_types[i] != BTF_END_RAW;
	     i--)
		;

	return i < 0 ? i : i * sizeof(raw_types[0]);
}

static void *btf_raw_create(const struct btf_header *hdr,
			    const __u32 *raw_types,
			    const char *str,
			    unsigned int str_sec_size,
			    unsigned int *btf_size,
			    const char **ret_next_str)
{
	const char *next_str = str, *end_str = str + str_sec_size;
	const char **strs_idx = NULL, **tmp_strs_idx;
	int strs_cap = 0, strs_cnt = 0, next_str_idx = 0;
	unsigned int size_needed, offset;
	struct btf_header *ret_hdr;
	int i, type_sec_size, err = 0;
	uint32_t *ret_types;
	void *raw_btf = NULL;

	type_sec_size = get_raw_sec_size(raw_types);


	size_needed = sizeof(*hdr) + type_sec_size + str_sec_size;
	raw_btf = malloc(size_needed);


	/* Copy header */
	memcpy(raw_btf, hdr, sizeof(*hdr));
	offset = sizeof(*hdr);

	/* Index strings */
	while ((next_str = get_next_str(next_str, end_str))) {
		if (strs_cnt == strs_cap) {
			strs_cap += max(16, strs_cap / 2);
			tmp_strs_idx = realloc(strs_idx,
					       sizeof(*strs_idx) * strs_cap);
			strs_idx = tmp_strs_idx;
		}
		strs_idx[strs_cnt++] = next_str;
		next_str += strlen(next_str);
	}

	/* Copy type section */
	ret_types = raw_btf + offset;
	for (i = 0; i < type_sec_size / sizeof(raw_types[0]); i++) {
		if (raw_types[i] == NAME_TBD) {
			ret_types[i] = strs_idx[next_str_idx++] - str;
		} else if (IS_NAME_NTH(raw_types[i])) {
			int idx = GET_NAME_NTH_IDX(raw_types[i]);

			ret_types[i] = strs_idx[idx-1] - str;
		} else {
			ret_types[i] = raw_types[i];
		}
	}
	offset += type_sec_size;

	/* Copy string section */
	memcpy(raw_btf + offset, str, str_sec_size);

	ret_hdr = (struct btf_header *)raw_btf;
	ret_hdr->type_len = type_sec_size;
	ret_hdr->str_off = type_sec_size;
	ret_hdr->str_len = str_sec_size;

	*btf_size = size_needed;
	if (ret_next_str)
		*ret_next_str =
			next_str_idx < strs_cnt ? strs_idx[next_str_idx] : NULL;


	free(strs_idx);
	if (err) {
		free(raw_btf);
		return NULL;
	}
	return raw_btf;
}

static int load_raw_btf(const void *raw_data, size_t raw_size)
{
	LIBBPF_OPTS(bpf_btf_load_opts, opts);
	int btf_fd;

	if (always_log) {
		opts.log_buf = btf_log_buf,
		opts.log_size = BTF_LOG_BUF_SIZE,
		opts.log_level = 1;
	}

	btf_fd = bpf_btf_load(raw_data, raw_size, &opts);
	if (btf_fd < 0 && !always_log) {
		opts.log_buf = btf_log_buf,
		opts.log_size = BTF_LOG_BUF_SIZE,
		opts.log_level = 1;
		btf_fd = bpf_btf_load(raw_data, raw_size, &opts);
	}

	return btf_fd;
}


static int test_btf_id(unsigned int test_num)
{
	const struct btf_raw_test *test = &raw_tests[test_num - 1];
	
	uint8_t *raw_btf = NULL, *user_btf[2] = {};
	int btf_fd[2] = {-1, -1};
	
	struct bpf_btf_info info = {};
	unsigned int raw_btf_size;
	uint32_t info_len;
	int err,i;

	raw_btf = btf_raw_create(&hdr_tmpl,
				 test->raw_types,
				 test->str_sec,
				 test->str_sec_size,
				 &raw_btf_size, NULL);

	if (!raw_btf)
		return -1;

	*btf_log_buf = '\0';

	
	user_btf[0] = malloc(raw_btf_size);
	info.btf = ptr_to_u64(user_btf[0]);
	info.btf_size = raw_btf_size;
	

	btf_fd[0] = load_raw_btf(raw_btf, raw_btf_size);
	printf("btf_fd: %d\n", btf_fd[0]);

	/* Test BPF_OBJ_GET_INFO_BY_ID on btf_id */
    /*
     struct bpf_btf_info {
	__u64 btf;
	__u32 btf_size;
	__u32 id;
    };
	*/

	info_len = sizeof(info);
	err = bpf_obj_get_info_by_fd(btf_fd[0], &info, &info_len);
	printf("info->btf: %llu\n", info.btf);
	printf("info->btf_size: %d\n", info.btf_size);
	printf("info->id: %d\n", info.id);
	printf("info->name: %llu\n", info.name);
  
	btf_fd[1] = bpf_btf_get_fd_by_id(info.id);

    printf("btf_fd: %d\n", btf_fd[1]);

	fprintf(stderr, "OK");


	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);

	free(raw_btf);

	for (i = 0; i < 2; i++) {
		free(user_btf[i]);
		if (btf_fd[i] >= 0)
			close(btf_fd[i]);
	}

	return err;
}

static int probe_module_btf(void)
{
	static const char strs[] = "\0int";
	__u32 types[] = {
		/* int */
		BTF_TYPE_INT_ENC(1, BTF_INT_SIGNED, 0, 32, 4),
	};

	struct bpf_btf_info info;
	__u32 len = sizeof(info);
	char name[16];
	int fd, err;
	int btf_fd;
	struct btf *btf = NULL;

	fd = libbpf__load_raw_btf((char *)types, sizeof(types), strs, sizeof(strs));
	if (fd < 0)
		return 0; /* BTF not supported at all */
    
	memset(&info, 0, sizeof(info));

	/* check that BPF_OBJ_GET_INFO_BY_FD supports specifying name pointer;
	 * kernel's module BTF support coincides with support for
	 * name/name_len fields in struct bpf_btf_info.
	 */
	err = bpf_obj_get_info_by_fd(fd, &info, &len);
	//printf("info->name: %llu\n", info.name);
	//printf("info->btf: %llu\n", info.btf);
	//printf("info->btf_size: %d\n", info.btf_size);
	//printf("info->id: %d\n", info.id);
	//printf("info->name_len: %d\n", info.name_len);
    
    btf_fd = bpf_btf_get_fd_by_id(info.id);
	printf("btf_fd: %d\n", btf_fd);

  /*
  struct btf_type {
	__u32 name_off;
	/* "info" bits arrangement
	 * bits  0-15: vlen (e.g. # of struct's members)
	 * bits 16-23: unused
	 * bits 24-27: kind (e.g. int, ptr, array...etc)
	 * bits 28-30: unused
	 * bit     31: kind_flag, currently used by
	 *             struct, union and fwd
	 */
	 /*
	__u32 info;
	/* "size" is used by INT, ENUM, STRUCT, UNION and DATASEC.
	 * "size" tells the size of the type it is describing.
	 *
	 * "type" is used by PTR, TYPEDEF, VOLATILE, CONST, RESTRICT,
	 * FUNC, FUNC_PROTO and VAR.
	 * "type" is a type_id referring to another type.
	 */
	 /*
	union {
		__u32 size;
		__u32 type;
	};
  };
  */


    const struct btf_type *t;
	const char *fname;
	__u16 kind;
	
	btf = btf__load_from_kernel_by_id(info.id);
	t = btf__type_by_id(btf, 1);

    kind = btf_kind(t);
    __u16 vlen = btf_vlen(t);

   
    printf("kind is: %u\n", kind);
	printf("vlen is: %d\n", vlen);
    printf("size is: %d\n", t->size);

	fname = btf__name_by_offset(btf, t->name_off);
	printf("name is: %s\n", fname);

	close(fd);
	return !err;
}

int main(void)
{
	int i;

	for (i = 1; i <= ARRAY_SIZE(raw_tests); i++)
		test_btf_id(i);
		//probe_module_btf();

	return 0;
}
