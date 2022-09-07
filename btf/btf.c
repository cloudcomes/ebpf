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

static int duration = 0;
static bool always_log;

#undef CHECK
#define CHECK(condition, format...) _CHECK(condition, "check", duration, format)

#define BTF_END_RAW 0xdeadbeef
#define NAME_TBD 0xdeadb33f

#define NAME_NTH(N) (0xfffe0000 | N)
#define IS_NAME_NTH(X) ((X & 0xffff0000) == 0xfffe0000)
#define GET_NAME_NTH_IDX(X) (X & 0x0000ffff)

#define MAX_NR_RAW_U32 1024
#define BTF_LOG_BUF_SIZE 65535


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

#define BTF_STR_SEC(str) \
	.str_sec = str, .str_sec_size = sizeof(str)

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


/* typedef struct b Struct_B;
 *
 * struct A {
 *     int m;
 *     struct b n[4];
 *     const Struct_B o[4];
 * };
 *
 * struct B {
 *     int m;
 *     int n;
 * };
 */
{
	.descr = "struct test #2",
	.raw_types = {
		/* int */					/* [1] */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),
		/* struct b [4] */				/* [2] */
		BTF_TYPE_ARRAY_ENC(4, 1, 4),

		/* struct A { */				/* [3] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 3), 68),
		BTF_MEMBER_ENC(NAME_TBD, 1, 0),	/* int m;		*/
		BTF_MEMBER_ENC(NAME_TBD, 2, 32),/* struct B n[4]	*/
		BTF_MEMBER_ENC(NAME_TBD, 8, 288),/* const Struct_B o[4];*/
		/* } */

		/* struct B { */				/* [4] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 2), 8),
		BTF_MEMBER_ENC(NAME_TBD, 1, 0),	/* int m; */
		BTF_MEMBER_ENC(NAME_TBD, 1, 32),/* int n; */
		/* } */

		/* const int */					/* [5] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_CONST, 0, 0), 1),
		/* typedef struct b Struct_B */	/* [6] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_TYPEDEF, 0, 0), 4),
		/* const Struct_B */				/* [7] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_CONST, 0, 0), 6),
		/* const Struct_B [4] */			/* [8] */
		BTF_TYPE_ARRAY_ENC(7, 1, 4),
		BTF_END_RAW,
	},
	.str_sec = "\0A\0m\0n\0o\0B\0m\0n\0Struct_B",
	.str_sec_size = sizeof("\0A\0m\0n\0o\0B\0m\0n\0Struct_B"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "struct_test2_map",
	.key_size = sizeof(int),
	.value_size = 68,
	.key_type_id = 1,
	.value_type_id = 3,
	.max_entries = 4,
},

{
	.descr = "global data test #3",
	.raw_types = {
		/* int */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),	/* [1] */
		/* static int t */
		BTF_VAR_ENC(NAME_TBD, 1, 0),			/* [2] */
		/* .bss section */				/* [3] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_DATASEC, 0, 1), 4),
		BTF_VAR_SECINFO_ENC(2, 0, 4),
		BTF_END_RAW,
	},
	.str_sec = "\0t\0.bss",
	.str_sec_size = sizeof("\0t\0.bss"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = ".bss",
	.key_size = sizeof(int),
	.value_size = 4,
	.key_type_id = 0,
	.value_type_id = 3,
	.max_entries = 1,
},

/* struct A {
 *     const void m;
 * };
 */
{
	.descr = "void test #2",
	.raw_types = {
		/* int */		/* [1] */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),
		/* const void */	/* [2] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_CONST, 0, 0), 0),
		/* struct A { */	/* [3] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 1), 8),
		/* const void m; */
		BTF_MEMBER_ENC(NAME_TBD, 2, 0),
		/* } */
		BTF_END_RAW,
	},
	.str_sec = "\0A\0m",
	.str_sec_size = sizeof("\0A\0m"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "void_test2_map",
	.key_size = sizeof(int),
	.value_size = sizeof(void *),
	.key_type_id = 1,
	.value_type_id = 3,
	.max_entries = 4,
	.btf_load_err = true,
	.err_str = "Invalid member",
},
{
	.descr = "struct member (name_off = 0)",
	.raw_types = {
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),		/* [1] */
		BTF_TYPE_ENC(0,
			     BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 1), 4),	/* [2] */
		BTF_MEMBER_ENC(NAME_TBD, 1, 0),
		BTF_END_RAW,
	},
	.str_sec = "\0A",
	.str_sec_size = sizeof("\0A"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "struct_type_check_btf",
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.key_type_id = 1,
	.value_type_id = 1,
	.max_entries = 4,
},
{
	.descr = "enum type (name_off = 0)",
	.raw_types = {
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),		/* [1] */
		BTF_TYPE_ENC(0,
			     BTF_INFO_ENC(BTF_KIND_ENUM, 0, 1),
			     sizeof(int)),				/* [2] */
		BTF_ENUM_ENC(NAME_TBD, 0),
		BTF_END_RAW,
	},
	.str_sec = "\0A\0B",
	.str_sec_size = sizeof("\0A\0B"),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "enum_type_check_btf",
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.key_type_id = 1,
	.value_type_id = 1,
	.max_entries = 4,
},
{
	.descr = "func proto (int (*)(int, unsigned int))",
	.raw_types = {
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4), /* [1] */
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),		/* [2] */
		/* int (*)(int, unsigned int) */
		BTF_FUNC_PROTO_ENC(1, 2),			/* [3] */
			BTF_FUNC_PROTO_ARG_ENC(0, 1),
			BTF_FUNC_PROTO_ARG_ENC(0, 2),
		BTF_END_RAW,
	},
	.str_sec = "",
	.str_sec_size = sizeof(""),
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "func_proto_type_check_btf",
	.key_size = sizeof(int),
	.value_size = sizeof(int),
	.key_type_id = 1,
	.value_type_id = 1,
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
	if (CHECK(type_sec_size < 0, "Cannot get nr_raw_types"))
		return NULL;

	size_needed = sizeof(*hdr) + type_sec_size + str_sec_size;
	raw_btf = malloc(size_needed);
	if (CHECK(!raw_btf, "Cannot allocate memory for raw_btf"))
		return NULL;

	/* Copy header */
	memcpy(raw_btf, hdr, sizeof(*hdr));
	offset = sizeof(*hdr);

	/* Index strings */
	while ((next_str = get_next_str(next_str, end_str))) {
		if (strs_cnt == strs_cap) {
			strs_cap += max(16, strs_cap / 2);
			tmp_strs_idx = realloc(strs_idx,
					       sizeof(*strs_idx) * strs_cap);
			if (CHECK(!tmp_strs_idx,
				  "Cannot allocate memory for strs_idx")) {
				err = -1;
				goto done;
			}
			strs_idx = tmp_strs_idx;
		}
		strs_idx[strs_cnt++] = next_str;
		next_str += strlen(next_str);
	}

	/* Copy type section */
	ret_types = raw_btf + offset;
	for (i = 0; i < type_sec_size / sizeof(raw_types[0]); i++) {
		if (raw_types[i] == NAME_TBD) {
			if (CHECK(next_str_idx == strs_cnt,
				  "Error in getting next_str #%d",
				  next_str_idx)) {
				err = -1;
				goto done;
			}
			ret_types[i] = strs_idx[next_str_idx++] - str;
		} else if (IS_NAME_NTH(raw_types[i])) {
			int idx = GET_NAME_NTH_IDX(raw_types[i]);

			if (CHECK(idx <= 0 || idx > strs_cnt,
				  "Error getting string #%d, strs_cnt:%d",
				  idx, strs_cnt)) {
				err = -1;
				goto done;
			}
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

done:
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

static void do_test_raw(unsigned int test_num)
{
	struct btf_raw_test *test = &raw_tests[test_num - 1];
	LIBBPF_OPTS(bpf_map_create_opts, opts);
	int map_fd = -1, btf_fd = -1;
	unsigned int raw_btf_size;
	struct btf_header *hdr;
	void *raw_btf;
	int err;


	raw_btf = btf_raw_create(&hdr_tmpl,
				 test->raw_types,
				 test->str_sec,
				 test->str_sec_size,
				 &raw_btf_size, NULL);
	if (!raw_btf)
		return;

	hdr = raw_btf;

	hdr->hdr_len = (int)hdr->hdr_len + test->hdr_len_delta;
	hdr->type_off = (int)hdr->type_off + test->type_off_delta;
	hdr->str_off = (int)hdr->str_off + test->str_off_delta;
	hdr->str_len = (int)hdr->str_len + test->str_len_delta;

	*btf_log_buf = '\0';
	btf_fd = load_raw_btf(raw_btf, raw_btf_size);
	free(raw_btf);

	err = ((btf_fd < 0) != test->btf_load_err);
	if (CHECK(err, "btf_fd:%d test->btf_load_err:%u",
		  btf_fd, test->btf_load_err) ||
	    CHECK(test->err_str && !strstr(btf_log_buf, test->err_str),
		  "expected err_str:%s\n", test->err_str)) {
		err = -1;
		goto done;
	}

	if (err || btf_fd < 0)
		goto done;

	opts.btf_fd = btf_fd;
	opts.btf_key_type_id = test->key_type_id;
	opts.btf_value_type_id = test->value_type_id;
	map_fd = bpf_map_create(test->map_type, test->map_name,
				test->key_size, test->value_size, test->max_entries, &opts);

	err = ((map_fd < 0) != test->map_create_err);
	CHECK(err, "map_fd:%d test->map_create_err:%u",
	      map_fd, test->map_create_err);

done:
	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);
	if (btf_fd >= 0)
		close(btf_fd);
	if (map_fd >= 0)
		close(map_fd);
}

struct btf_get_info_test {
	const char *descr;
	const char *str_sec;
	__u32 raw_types[MAX_NR_RAW_U32];
	__u32 str_sec_size;
	int btf_size_delta;
	int (*special_test)(unsigned int test_num);
};

static int test_btf_id(unsigned int test_num);

const struct btf_get_info_test get_info_tests[] = {
{
	.descr = "== raw_btf_size+1",
	.raw_types = {
		/* int */				/* [1] */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),
		BTF_END_RAW,
	},
	.str_sec = "",
	.str_sec_size = sizeof(""),
	.btf_size_delta = 1,
},
{
	.descr = "== raw_btf_size-3",
	.raw_types = {
		/* int */				/* [1] */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),
		BTF_END_RAW,
	},
	.str_sec = "",
	.str_sec_size = sizeof(""),
	.btf_size_delta = -3,
},
{
	.descr = "BTF ID",
	.raw_types = {
		/* int */				/* [1] */
		BTF_TYPE_INT_ENC(0, BTF_INT_SIGNED, 0, 32, 4),
		/* unsigned int */			/* [2] */
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),
		BTF_END_RAW,
	},
	.str_sec = "",
	.str_sec_size = sizeof(""),
	.special_test = test_btf_id,
},
};


static int test_btf_id(unsigned int test_num)
{
	const struct btf_get_info_test *test = &get_info_tests[test_num - 1];
	LIBBPF_OPTS(bpf_map_create_opts, opts);
	uint8_t *raw_btf = NULL, *user_btf[2] = {};
	int btf_fd[2] = {-1, -1}, map_fd = -1;
	struct bpf_map_info map_info = {};
	struct bpf_btf_info info[2] = {};
	unsigned int raw_btf_size;
	uint32_t info_len;
	int err, i, ret;

	raw_btf = btf_raw_create(&hdr_tmpl,
				 test->raw_types,
				 test->str_sec,
				 test->str_sec_size,
				 &raw_btf_size, NULL);

	if (!raw_btf)
		return -1;

	*btf_log_buf = '\0';

	for (i = 0; i < 2; i++) {
		user_btf[i] = malloc(raw_btf_size);
		if (CHECK(!user_btf[i], "!user_btf[%d]", i)) {
			err = -1;
			goto done;
		}
		info[i].btf = ptr_to_u64(user_btf[i]);
		info[i].btf_size = raw_btf_size;
	}

	btf_fd[0] = load_raw_btf(raw_btf, raw_btf_size);
	if (CHECK(btf_fd[0] < 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	/* Test BPF_OBJ_GET_INFO_BY_ID on btf_id */
	info_len = sizeof(info[0]);
	err = bpf_obj_get_info_by_fd(btf_fd[0], &info[0], &info_len);
	if (CHECK(err, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	btf_fd[1] = bpf_btf_get_fd_by_id(info[0].id);
	if (CHECK(btf_fd[1] < 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	ret = 0;
	err = bpf_obj_get_info_by_fd(btf_fd[1], &info[1], &info_len);
	if (CHECK(err || info[0].id != info[1].id ||
		  info[0].btf_size != info[1].btf_size ||
		  (ret = memcmp(user_btf[0], user_btf[1], info[0].btf_size)),
		  "err:%d errno:%d id0:%u id1:%u btf_size0:%u btf_size1:%u memcmp:%d",
		  err, errno, info[0].id, info[1].id,
		  info[0].btf_size, info[1].btf_size, ret)) {
		err = -1;
		goto done;
	}

	/* Test btf members in struct bpf_map_info */
	opts.btf_fd = btf_fd[0];
	opts.btf_key_type_id = 1;
	opts.btf_value_type_id = 2;
	map_fd = bpf_map_create(BPF_MAP_TYPE_ARRAY, "test_btf_id",
				sizeof(int), sizeof(int), 4, &opts);
	if (CHECK(map_fd < 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	info_len = sizeof(map_info);
	err = bpf_obj_get_info_by_fd(map_fd, &map_info, &info_len);
	if (CHECK(err || map_info.btf_id != info[0].id ||
		  map_info.btf_key_type_id != 1 || map_info.btf_value_type_id != 2,
		  "err:%d errno:%d info.id:%u btf_id:%u btf_key_type_id:%u btf_value_type_id:%u",
		  err, errno, info[0].id, map_info.btf_id, map_info.btf_key_type_id,
		  map_info.btf_value_type_id)) {
		err = -1;
		goto done;
	}

	for (i = 0; i < 2; i++) {
		close(btf_fd[i]);
		btf_fd[i] = -1;
	}

	/* Test BTF ID is removed from the kernel */
	btf_fd[0] = bpf_btf_get_fd_by_id(map_info.btf_id);
	if (CHECK(btf_fd[0] < 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}
	close(btf_fd[0]);
	btf_fd[0] = -1;

	/* The map holds the last ref to BTF and its btf_id */
	close(map_fd);
	map_fd = -1;
	btf_fd[0] = bpf_btf_get_fd_by_id(map_info.btf_id);
	if (CHECK(btf_fd[0] >= 0, "BTF lingers")) {
		err = -1;
		goto done;
	}

	fprintf(stderr, "OK");

done:
	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);

	free(raw_btf);
	if (map_fd >= 0)
		close(map_fd);
	for (i = 0; i < 2; i++) {
		free(user_btf[i]);
		if (btf_fd[i] >= 0)
			close(btf_fd[i]);
	}

	return err;
}

static void do_test_get_info(unsigned int test_num)
{
	const struct btf_get_info_test *test = &get_info_tests[test_num - 1];
	unsigned int raw_btf_size, user_btf_size, expected_nbytes;
	uint8_t *raw_btf = NULL, *user_btf = NULL;
	struct bpf_btf_info info = {};
	int btf_fd = -1, err, ret;
	uint32_t info_len;


	raw_btf = btf_raw_create(&hdr_tmpl,
				 test->raw_types,
				 test->str_sec,
				 test->str_sec_size,
				 &raw_btf_size, NULL);

	if (!raw_btf)
		return;

	*btf_log_buf = '\0';

	user_btf = malloc(raw_btf_size);
	if (CHECK(!user_btf, "!user_btf")) {
		err = -1;
		goto done;
	}

	btf_fd = load_raw_btf(raw_btf, raw_btf_size);
	if (CHECK(btf_fd <= 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	user_btf_size = (int)raw_btf_size + test->btf_size_delta;
	expected_nbytes = min(raw_btf_size, user_btf_size);
	if (raw_btf_size > expected_nbytes)
		memset(user_btf + expected_nbytes, 0xff,
		       raw_btf_size - expected_nbytes);

	info_len = sizeof(info);
	info.btf = ptr_to_u64(user_btf);
	info.btf_size = user_btf_size;

	ret = 0;
	err = bpf_obj_get_info_by_fd(btf_fd, &info, &info_len);
	if (CHECK(err || !info.id || info_len != sizeof(info) ||
		  info.btf_size != raw_btf_size ||
		  (ret = memcmp(raw_btf, user_btf, expected_nbytes)),
		  "err:%d errno:%d info.id:%u info_len:%u sizeof(info):%zu raw_btf_size:%u info.btf_size:%u expected_nbytes:%u memcmp:%d",
		  err, errno, info.id, info_len, sizeof(info),
		  raw_btf_size, info.btf_size, expected_nbytes, ret)) {
		err = -1;
		goto done;
	}

	while (expected_nbytes < raw_btf_size) {
		fprintf(stderr, "%u...", expected_nbytes);
		if (CHECK(user_btf[expected_nbytes++] != 0xff,
			  "user_btf[%u]:%x != 0xff", expected_nbytes - 1,
			  user_btf[expected_nbytes - 1])) {
			err = -1;
			goto done;
		}
	}

	fprintf(stderr, "OK");

done:
	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);

	free(raw_btf);
	free(user_btf);

	if (btf_fd >= 0)
		close(btf_fd);
}

struct btf_file_test {
	const char *file;
	bool btf_kv_notfound;
};

const char *pprint_enum_str[] = {
	"ENUM_ZERO",
	"ENUM_ONE",
	"ENUM_TWO",
	"ENUM_THREE",
};

struct pprint_mapv {
	uint32_t ui32;
	uint16_t ui16;
	/* 2 bytes hole */
	int32_t si32;
	uint32_t unused_bits2a:2,
		bits28:28,
		unused_bits2b:2;
	union {
		uint64_t ui64;
		uint8_t ui8a[8];
	};
	enum {
		ENUM_ZERO,
		ENUM_ONE,
		ENUM_TWO,
		ENUM_THREE,
	} aenum;
	uint32_t ui32b;
	uint32_t bits2c:2;
	uint8_t si8_4[2][2];
};

#ifdef __SIZEOF_INT128__
struct pprint_mapv_int128 {
	__int128 si128a;
	__int128 si128b;
	unsigned __int128 bits3:3;
	unsigned __int128 bits80:80;
	unsigned __int128 ui128;
};
#endif

static struct btf_raw_test pprint_test_template[] = {
{
	.raw_types = {
		/* unsighed char */			/* [1] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 8, 1),
		/* unsigned short */			/* [2] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 16, 2),
		/* unsigned int */			/* [3] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 32, 4),
		/* int */				/* [4] */
		BTF_TYPE_INT_ENC(NAME_TBD, BTF_INT_SIGNED, 0, 32, 4),
		/* unsigned long long */		/* [5] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 64, 8),
		/* 2 bits */				/* [6] */
		BTF_TYPE_INT_ENC(0, 0, 0, 2, 2),
		/* 28 bits */				/* [7] */
		BTF_TYPE_INT_ENC(0, 0, 0, 28, 4),
		/* uint8_t[8] */			/* [8] */
		BTF_TYPE_ARRAY_ENC(9, 1, 8),
		/* typedef unsigned char uint8_t */	/* [9] */
		BTF_TYPEDEF_ENC(NAME_TBD, 1),
		/* typedef unsigned short uint16_t */	/* [10] */
		BTF_TYPEDEF_ENC(NAME_TBD, 2),
		/* typedef unsigned int uint32_t */	/* [11] */
		BTF_TYPEDEF_ENC(NAME_TBD, 3),
		/* typedef int int32_t */		/* [12] */
		BTF_TYPEDEF_ENC(NAME_TBD, 4),
		/* typedef unsigned long long uint64_t *//* [13] */
		BTF_TYPEDEF_ENC(NAME_TBD, 5),
		/* union (anon) */			/* [14] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_UNION, 0, 2), 8),
		BTF_MEMBER_ENC(NAME_TBD, 13, 0),/* uint64_t ui64; */
		BTF_MEMBER_ENC(NAME_TBD, 8, 0),	/* uint8_t ui8a[8]; */
		/* enum (anon) */			/* [15] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_ENUM, 0, 4), 4),
		BTF_ENUM_ENC(NAME_TBD, 0),
		BTF_ENUM_ENC(NAME_TBD, 1),
		BTF_ENUM_ENC(NAME_TBD, 2),
		BTF_ENUM_ENC(NAME_TBD, 3),
		/* struct pprint_mapv */		/* [16] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 0, 11), 40),
		BTF_MEMBER_ENC(NAME_TBD, 11, 0),	/* uint32_t ui32 */
		BTF_MEMBER_ENC(NAME_TBD, 10, 32),	/* uint16_t ui16 */
		BTF_MEMBER_ENC(NAME_TBD, 12, 64),	/* int32_t si32 */
		BTF_MEMBER_ENC(NAME_TBD, 6, 96),	/* unused_bits2a */
		BTF_MEMBER_ENC(NAME_TBD, 7, 98),	/* bits28 */
		BTF_MEMBER_ENC(NAME_TBD, 6, 126),	/* unused_bits2b */
		BTF_MEMBER_ENC(0, 14, 128),		/* union (anon) */
		BTF_MEMBER_ENC(NAME_TBD, 15, 192),	/* aenum */
		BTF_MEMBER_ENC(NAME_TBD, 11, 224),	/* uint32_t ui32b */
		BTF_MEMBER_ENC(NAME_TBD, 6, 256),	/* bits2c */
		BTF_MEMBER_ENC(NAME_TBD, 17, 264),	/* si8_4 */
		BTF_TYPE_ARRAY_ENC(18, 1, 2),		/* [17] */
		BTF_TYPE_ARRAY_ENC(1, 1, 2),		/* [18] */
		BTF_END_RAW,
	},
	BTF_STR_SEC("\0unsigned char\0unsigned short\0unsigned int\0int\0unsigned long long\0uint8_t\0uint16_t\0uint32_t\0int32_t\0uint64_t\0ui64\0ui8a\0ENUM_ZERO\0ENUM_ONE\0ENUM_TWO\0ENUM_THREE\0pprint_mapv\0ui32\0ui16\0si32\0unused_bits2a\0bits28\0unused_bits2b\0aenum\0ui32b\0bits2c\0si8_4"),
	.key_size = sizeof(unsigned int),
	.value_size = sizeof(struct pprint_mapv),
	.key_type_id = 3,	/* unsigned int */
	.value_type_id = 16,	/* struct pprint_mapv */
	.max_entries = 128,
},
{
	/* this type will have the same type as the
	 * first .raw_types definition, but struct type will
	 * be encoded with kind_flag set.
	 */
	.raw_types = {
		/* unsighed char */			/* [1] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 8, 1),
		/* unsigned short */			/* [2] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 16, 2),
		/* unsigned int */			/* [3] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 32, 4),
		/* int */				/* [4] */
		BTF_TYPE_INT_ENC(NAME_TBD, BTF_INT_SIGNED, 0, 32, 4),
		/* unsigned long long */		/* [5] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 64, 8),
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),	/* [6] */
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),	/* [7] */
		/* uint8_t[8] */			/* [8] */
		BTF_TYPE_ARRAY_ENC(9, 1, 8),
		/* typedef unsigned char uint8_t */	/* [9] */
		BTF_TYPEDEF_ENC(NAME_TBD, 1),
		/* typedef unsigned short uint16_t */	/* [10] */
		BTF_TYPEDEF_ENC(NAME_TBD, 2),
		/* typedef unsigned int uint32_t */	/* [11] */
		BTF_TYPEDEF_ENC(NAME_TBD, 3),
		/* typedef int int32_t */		/* [12] */
		BTF_TYPEDEF_ENC(NAME_TBD, 4),
		/* typedef unsigned long long uint64_t *//* [13] */
		BTF_TYPEDEF_ENC(NAME_TBD, 5),
		/* union (anon) */			/* [14] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_UNION, 0, 2), 8),
		BTF_MEMBER_ENC(NAME_TBD, 13, 0),/* uint64_t ui64; */
		BTF_MEMBER_ENC(NAME_TBD, 8, 0),	/* uint8_t ui8a[8]; */
		/* enum (anon) */			/* [15] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_ENUM, 0, 4), 4),
		BTF_ENUM_ENC(NAME_TBD, 0),
		BTF_ENUM_ENC(NAME_TBD, 1),
		BTF_ENUM_ENC(NAME_TBD, 2),
		BTF_ENUM_ENC(NAME_TBD, 3),
		/* struct pprint_mapv */		/* [16] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 1, 11), 40),
		BTF_MEMBER_ENC(NAME_TBD, 11, BTF_MEMBER_OFFSET(0, 0)),	/* uint32_t ui32 */
		BTF_MEMBER_ENC(NAME_TBD, 10, BTF_MEMBER_OFFSET(0, 32)),	/* uint16_t ui16 */
		BTF_MEMBER_ENC(NAME_TBD, 12, BTF_MEMBER_OFFSET(0, 64)),	/* int32_t si32 */
		BTF_MEMBER_ENC(NAME_TBD, 6, BTF_MEMBER_OFFSET(2, 96)),	/* unused_bits2a */
		BTF_MEMBER_ENC(NAME_TBD, 7, BTF_MEMBER_OFFSET(28, 98)),	/* bits28 */
		BTF_MEMBER_ENC(NAME_TBD, 6, BTF_MEMBER_OFFSET(2, 126)),	/* unused_bits2b */
		BTF_MEMBER_ENC(0, 14, BTF_MEMBER_OFFSET(0, 128)),	/* union (anon) */
		BTF_MEMBER_ENC(NAME_TBD, 15, BTF_MEMBER_OFFSET(0, 192)),	/* aenum */
		BTF_MEMBER_ENC(NAME_TBD, 11, BTF_MEMBER_OFFSET(0, 224)),	/* uint32_t ui32b */
		BTF_MEMBER_ENC(NAME_TBD, 6, BTF_MEMBER_OFFSET(2, 256)),	/* bits2c */
		BTF_MEMBER_ENC(NAME_TBD, 17, 264),	/* si8_4 */
		BTF_TYPE_ARRAY_ENC(18, 1, 2),		/* [17] */
		BTF_TYPE_ARRAY_ENC(1, 1, 2),		/* [18] */
		BTF_END_RAW,
	},
	BTF_STR_SEC("\0unsigned char\0unsigned short\0unsigned int\0int\0unsigned long long\0uint8_t\0uint16_t\0uint32_t\0int32_t\0uint64_t\0ui64\0ui8a\0ENUM_ZERO\0ENUM_ONE\0ENUM_TWO\0ENUM_THREE\0pprint_mapv\0ui32\0ui16\0si32\0unused_bits2a\0bits28\0unused_bits2b\0aenum\0ui32b\0bits2c\0si8_4"),
	.key_size = sizeof(unsigned int),
	.value_size = sizeof(struct pprint_mapv),
	.key_type_id = 3,	/* unsigned int */
	.value_type_id = 16,	/* struct pprint_mapv */
	.max_entries = 128,
},
{
	/* this type will have the same layout as the
	 * first .raw_types definition. The struct type will
	 * be encoded with kind_flag set, bitfield members
	 * are added typedef/const/volatile, and bitfield members
	 * will have both int and enum types.
	 */
	.raw_types = {
		/* unsighed char */			/* [1] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 8, 1),
		/* unsigned short */			/* [2] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 16, 2),
		/* unsigned int */			/* [3] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 32, 4),
		/* int */				/* [4] */
		BTF_TYPE_INT_ENC(NAME_TBD, BTF_INT_SIGNED, 0, 32, 4),
		/* unsigned long long */		/* [5] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 64, 8),
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),	/* [6] */
		BTF_TYPE_INT_ENC(0, 0, 0, 32, 4),	/* [7] */
		/* uint8_t[8] */			/* [8] */
		BTF_TYPE_ARRAY_ENC(9, 1, 8),
		/* typedef unsigned char uint8_t */	/* [9] */
		BTF_TYPEDEF_ENC(NAME_TBD, 1),
		/* typedef unsigned short uint16_t */	/* [10] */
		BTF_TYPEDEF_ENC(NAME_TBD, 2),
		/* typedef unsigned int uint32_t */	/* [11] */
		BTF_TYPEDEF_ENC(NAME_TBD, 3),
		/* typedef int int32_t */		/* [12] */
		BTF_TYPEDEF_ENC(NAME_TBD, 4),
		/* typedef unsigned long long uint64_t *//* [13] */
		BTF_TYPEDEF_ENC(NAME_TBD, 5),
		/* union (anon) */			/* [14] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_UNION, 0, 2), 8),
		BTF_MEMBER_ENC(NAME_TBD, 13, 0),/* uint64_t ui64; */
		BTF_MEMBER_ENC(NAME_TBD, 8, 0),	/* uint8_t ui8a[8]; */
		/* enum (anon) */			/* [15] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_ENUM, 0, 4), 4),
		BTF_ENUM_ENC(NAME_TBD, 0),
		BTF_ENUM_ENC(NAME_TBD, 1),
		BTF_ENUM_ENC(NAME_TBD, 2),
		BTF_ENUM_ENC(NAME_TBD, 3),
		/* struct pprint_mapv */		/* [16] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 1, 11), 40),
		BTF_MEMBER_ENC(NAME_TBD, 11, BTF_MEMBER_OFFSET(0, 0)),	/* uint32_t ui32 */
		BTF_MEMBER_ENC(NAME_TBD, 10, BTF_MEMBER_OFFSET(0, 32)),	/* uint16_t ui16 */
		BTF_MEMBER_ENC(NAME_TBD, 12, BTF_MEMBER_OFFSET(0, 64)),	/* int32_t si32 */
		BTF_MEMBER_ENC(NAME_TBD, 17, BTF_MEMBER_OFFSET(2, 96)),	/* unused_bits2a */
		BTF_MEMBER_ENC(NAME_TBD, 7, BTF_MEMBER_OFFSET(28, 98)),	/* bits28 */
		BTF_MEMBER_ENC(NAME_TBD, 19, BTF_MEMBER_OFFSET(2, 126)),/* unused_bits2b */
		BTF_MEMBER_ENC(0, 14, BTF_MEMBER_OFFSET(0, 128)),	/* union (anon) */
		BTF_MEMBER_ENC(NAME_TBD, 15, BTF_MEMBER_OFFSET(0, 192)),	/* aenum */
		BTF_MEMBER_ENC(NAME_TBD, 11, BTF_MEMBER_OFFSET(0, 224)),	/* uint32_t ui32b */
		BTF_MEMBER_ENC(NAME_TBD, 17, BTF_MEMBER_OFFSET(2, 256)),	/* bits2c */
		BTF_MEMBER_ENC(NAME_TBD, 20, BTF_MEMBER_OFFSET(0, 264)),	/* si8_4 */
		/* typedef unsigned int ___int */	/* [17] */
		BTF_TYPEDEF_ENC(NAME_TBD, 18),
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_VOLATILE, 0, 0), 6),	/* [18] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_CONST, 0, 0), 15),	/* [19] */
		BTF_TYPE_ARRAY_ENC(21, 1, 2),					/* [20] */
		BTF_TYPE_ARRAY_ENC(1, 1, 2),					/* [21] */
		BTF_END_RAW,
	},
	BTF_STR_SEC("\0unsigned char\0unsigned short\0unsigned int\0int\0unsigned long long\0uint8_t\0uint16_t\0uint32_t\0int32_t\0uint64_t\0ui64\0ui8a\0ENUM_ZERO\0ENUM_ONE\0ENUM_TWO\0ENUM_THREE\0pprint_mapv\0ui32\0ui16\0si32\0unused_bits2a\0bits28\0unused_bits2b\0aenum\0ui32b\0bits2c\0___int\0si8_4"),
	.key_size = sizeof(unsigned int),
	.value_size = sizeof(struct pprint_mapv),
	.key_type_id = 3,	/* unsigned int */
	.value_type_id = 16,	/* struct pprint_mapv */
	.max_entries = 128,
},

#ifdef __SIZEOF_INT128__
{
	/* test int128 */
	.raw_types = {
		/* unsigned int */				/* [1] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 32, 4),
		/* __int128 */					/* [2] */
		BTF_TYPE_INT_ENC(NAME_TBD, BTF_INT_SIGNED, 0, 128, 16),
		/* unsigned __int128 */				/* [3] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 128, 16),
		/* struct pprint_mapv_int128 */			/* [4] */
		BTF_TYPE_ENC(NAME_TBD, BTF_INFO_ENC(BTF_KIND_STRUCT, 1, 5), 64),
		BTF_MEMBER_ENC(NAME_TBD, 2, BTF_MEMBER_OFFSET(0, 0)),		/* si128a */
		BTF_MEMBER_ENC(NAME_TBD, 2, BTF_MEMBER_OFFSET(0, 128)),		/* si128b */
		BTF_MEMBER_ENC(NAME_TBD, 3, BTF_MEMBER_OFFSET(3, 256)),		/* bits3 */
		BTF_MEMBER_ENC(NAME_TBD, 3, BTF_MEMBER_OFFSET(80, 259)),	/* bits80 */
		BTF_MEMBER_ENC(NAME_TBD, 3, BTF_MEMBER_OFFSET(0, 384)),		/* ui128 */
		BTF_END_RAW,
	},
	BTF_STR_SEC("\0unsigned int\0__int128\0unsigned __int128\0pprint_mapv_int128\0si128a\0si128b\0bits3\0bits80\0ui128"),
	.key_size = sizeof(unsigned int),
	.value_size = sizeof(struct pprint_mapv_int128),
	.key_type_id = 1,
	.value_type_id = 4,
	.max_entries = 128,
	.mapv_kind = PPRINT_MAPV_KIND_INT128,
},
#endif

};

static struct btf_pprint_test_meta {
	const char *descr;
	enum bpf_map_type map_type;
	const char *map_name;
	bool ordered_map;
	bool lossless_map;
	bool percpu_map;
} pprint_tests_meta[] = {
{
	.descr = "BTF pretty print array",
	.map_type = BPF_MAP_TYPE_ARRAY,
	.map_name = "pprint_test_array",
	.ordered_map = true,
	.lossless_map = true,
	.percpu_map = false,
},
{
	.descr = "BTF pretty print hash",
	.map_type = BPF_MAP_TYPE_HASH,
	.map_name = "pprint_test_hash",
	.ordered_map = false,
	.lossless_map = true,
	.percpu_map = false,
},
{
	.descr = "BTF pretty print lru hash",
	.map_type = BPF_MAP_TYPE_LRU_HASH,
	.map_name = "pprint_test_lru_hash",
	.ordered_map = false,
	.lossless_map = false,
	.percpu_map = false,
},
{
	.descr = "BTF pretty print percpu array",
	.map_type = BPF_MAP_TYPE_PERCPU_ARRAY,
	.map_name = "pprint_test_percpu_array",
	.ordered_map = true,
	.lossless_map = true,
	.percpu_map = true,
},
{
	.descr = "BTF pretty print percpu hash",
	.map_type = BPF_MAP_TYPE_PERCPU_HASH,
	.map_name = "pprint_test_percpu_hash",
	.ordered_map = false,
	.lossless_map = true,
	.percpu_map = true,
},
{
	.descr = "BTF pretty print lru percpu hash",
	.map_type = BPF_MAP_TYPE_LRU_PERCPU_HASH,
	.map_name = "pprint_test_lru_percpu_hash",
	.ordered_map = false,
	.lossless_map = false,
	.percpu_map = true,
},
};

static size_t get_pprint_mapv_size(enum pprint_mapv_kind_t mapv_kind)
{
	if (mapv_kind == PPRINT_MAPV_KIND_BASIC)
		return sizeof(struct pprint_mapv);

#ifdef __SIZEOF_INT128__
	if (mapv_kind == PPRINT_MAPV_KIND_INT128)
		return sizeof(struct pprint_mapv_int128);
#endif

	assert(0);
}

static void set_pprint_mapv(enum pprint_mapv_kind_t mapv_kind,
			    void *mapv, uint32_t i,
			    int num_cpus, int rounded_value_size)
{
	int cpu;

	if (mapv_kind == PPRINT_MAPV_KIND_BASIC) {
		struct pprint_mapv *v = mapv;

		for (cpu = 0; cpu < num_cpus; cpu++) {
			v->ui32 = i + cpu;
			v->si32 = -i;
			v->unused_bits2a = 3;
			v->bits28 = i;
			v->unused_bits2b = 3;
			v->ui64 = i;
			v->aenum = i & 0x03;
			v->ui32b = 4;
			v->bits2c = 1;
			v->si8_4[0][0] = (cpu + i) & 0xff;
			v->si8_4[0][1] = (cpu + i + 1) & 0xff;
			v->si8_4[1][0] = (cpu + i + 2) & 0xff;
			v->si8_4[1][1] = (cpu + i + 3) & 0xff;
			v = (void *)v + rounded_value_size;
		}
	}

#ifdef __SIZEOF_INT128__
	if (mapv_kind == PPRINT_MAPV_KIND_INT128) {
		struct pprint_mapv_int128 *v = mapv;

		for (cpu = 0; cpu < num_cpus; cpu++) {
			v->si128a = i;
			v->si128b = -i;
			v->bits3 = i & 0x07;
			v->bits80 = (((unsigned __int128)1) << 64) + i;
			v->ui128 = (((unsigned __int128)2) << 64) + i;
			v = (void *)v + rounded_value_size;
		}
	}
#endif
}

static ssize_t get_pprint_expected_line(enum pprint_mapv_kind_t mapv_kind,
				 char *expected_line, ssize_t line_size,
				 bool percpu_map, unsigned int next_key,
				 int cpu, void *mapv)
{
	ssize_t nexpected_line = -1;

	if (mapv_kind == PPRINT_MAPV_KIND_BASIC) {
		struct pprint_mapv *v = mapv;

		nexpected_line = snprintf(expected_line, line_size,
					  "%s%u: {%u,0,%d,0x%x,0x%x,0x%x,"
					  "{%llu|[%u,%u,%u,%u,%u,%u,%u,%u]},%s,"
					  "%u,0x%x,[[%d,%d],[%d,%d]]}\n",
					  percpu_map ? "\tcpu" : "",
					  percpu_map ? cpu : next_key,
					  v->ui32, v->si32,
					  v->unused_bits2a,
					  v->bits28,
					  v->unused_bits2b,
					  (__u64)v->ui64,
					  v->ui8a[0], v->ui8a[1],
					  v->ui8a[2], v->ui8a[3],
					  v->ui8a[4], v->ui8a[5],
					  v->ui8a[6], v->ui8a[7],
					  pprint_enum_str[v->aenum],
					  v->ui32b,
					  v->bits2c,
					  v->si8_4[0][0], v->si8_4[0][1],
					  v->si8_4[1][0], v->si8_4[1][1]);
	}

#ifdef __SIZEOF_INT128__
	if (mapv_kind == PPRINT_MAPV_KIND_INT128) {
		struct pprint_mapv_int128 *v = mapv;

		nexpected_line = snprintf(expected_line, line_size,
					  "%s%u: {0x%lx,0x%lx,0x%lx,"
					  "0x%lx%016lx,0x%lx%016lx}\n",
					  percpu_map ? "\tcpu" : "",
					  percpu_map ? cpu : next_key,
					  (uint64_t)v->si128a,
					  (uint64_t)v->si128b,
					  (uint64_t)v->bits3,
					  (uint64_t)(v->bits80 >> 64),
					  (uint64_t)v->bits80,
					  (uint64_t)(v->ui128 >> 64),
					  (uint64_t)v->ui128);
	}
#endif

	return nexpected_line;
}

static int check_line(const char *expected_line, int nexpected_line,
		      int expected_line_len, const char *line)
{
	if (CHECK(nexpected_line == expected_line_len,
		  "expected_line is too long"))
		return -1;

	if (strcmp(expected_line, line)) {
		fprintf(stderr, "unexpected pprint output\n");
		fprintf(stderr, "expected: %s", expected_line);
		fprintf(stderr, "    read: %s", line);
		return -1;
	}

	return 0;
}


static void do_test_pprint(int test_num)
{
	const struct btf_raw_test *test = &pprint_test_template[test_num];
	enum pprint_mapv_kind_t mapv_kind = test->mapv_kind;
	LIBBPF_OPTS(bpf_map_create_opts, opts);
	bool ordered_map, lossless_map, percpu_map;
	int err, ret, num_cpus, rounded_value_size;
	unsigned int key, nr_read_elems;
	int map_fd = -1, btf_fd = -1;
	unsigned int raw_btf_size;
	char expected_line[255];
	FILE *pin_file = NULL;
	char pin_path[255];
	size_t line_len = 0;
	char *line = NULL;
	void *mapv = NULL;
	uint8_t *raw_btf;
	ssize_t nread;


	raw_btf = btf_raw_create(&hdr_tmpl, test->raw_types,
				 test->str_sec, test->str_sec_size,
				 &raw_btf_size, NULL);

	if (!raw_btf)
		return;

	*btf_log_buf = '\0';
	btf_fd = load_raw_btf(raw_btf, raw_btf_size);
	free(raw_btf);

	if (CHECK(btf_fd < 0, "errno:%d\n", errno)) {
		err = -1;
		goto done;
	}

	opts.btf_fd = btf_fd;
	opts.btf_key_type_id = test->key_type_id;
	opts.btf_value_type_id = test->value_type_id;
	map_fd = bpf_map_create(test->map_type, test->map_name,
				test->key_size, test->value_size, test->max_entries, &opts);
	if (CHECK(map_fd < 0, "errno:%d", errno)) {
		err = -1;
		goto done;
	}

	ret = snprintf(pin_path, sizeof(pin_path), "%s/%s",
		       "/sys/fs/bpf", test->map_name);

	if (CHECK(ret == sizeof(pin_path), "pin_path %s/%s is too long",
		  "/sys/fs/bpf", test->map_name)) {
		err = -1;
		goto done;
	}

	err = bpf_obj_pin(map_fd, pin_path);
	if (CHECK(err, "bpf_obj_pin(%s): errno:%d.", pin_path, errno))
		goto done;

	percpu_map = test->percpu_map;
	num_cpus = 1;
	rounded_value_size = roundup(get_pprint_mapv_size(mapv_kind), 8);
	mapv = calloc(num_cpus, rounded_value_size);
	if (CHECK(!mapv, "mapv allocation failure")) {
		err = -1;
		goto done;
	}

	for (key = 0; key < test->max_entries; key++) {
		set_pprint_mapv(mapv_kind, mapv, key, num_cpus, rounded_value_size);
		bpf_map_update_elem(map_fd, &key, mapv, 0);
	}

	pin_file = fopen(pin_path, "r");
	if (CHECK(!pin_file, "fopen(%s): errno:%d", pin_path, errno)) {
		err = -1;
		goto done;
	}

	/* Skip lines start with '#' */
	while ((nread = getline(&line, &line_len, pin_file)) > 0 &&
	       *line == '#')
		;

	if (CHECK(nread <= 0, "Unexpected EOF")) {
		err = -1;
		goto done;
	}

	nr_read_elems = 0;
	ordered_map = test->ordered_map;
	lossless_map = test->lossless_map;
	do {
		ssize_t nexpected_line;
		unsigned int next_key;
		void *cmapv;
		int cpu;

		next_key = ordered_map ? nr_read_elems : atoi(line);
		set_pprint_mapv(mapv_kind, mapv, next_key, num_cpus, rounded_value_size);
		cmapv = mapv;

		for (cpu = 0; cpu < num_cpus; cpu++) {
			if (percpu_map) {
				/* for percpu map, the format looks like:
				 * <key>: {
				 *	cpu0: <value_on_cpu0>
				 *	cpu1: <value_on_cpu1>
				 *	...
				 *	cpun: <value_on_cpun>
				 * }
				 *
				 * let us verify the line containing the key here.
				 */
				if (cpu == 0) {
					nexpected_line = snprintf(expected_line,
								  sizeof(expected_line),
								  "%u: {\n",
								  next_key);

					err = check_line(expected_line, nexpected_line,
							 sizeof(expected_line), line);
					if (err < 0)
						goto done;
				}

				/* read value@cpu */
				nread = getline(&line, &line_len, pin_file);
				if (nread < 0)
					break;
			}

			nexpected_line = get_pprint_expected_line(mapv_kind, expected_line,
								  sizeof(expected_line),
								  percpu_map, next_key,
								  cpu, cmapv);
			err = check_line(expected_line, nexpected_line,
					 sizeof(expected_line), line);
			if (err < 0)
				goto done;

			cmapv = cmapv + rounded_value_size;
		}

		if (percpu_map) {
			/* skip the last bracket for the percpu map */
			nread = getline(&line, &line_len, pin_file);
			if (nread < 0)
				break;
		}

		nread = getline(&line, &line_len, pin_file);
	} while (++nr_read_elems < test->max_entries && nread > 0);

	if (lossless_map &&
	    CHECK(nr_read_elems < test->max_entries,
		  "Unexpected EOF. nr_read_elems:%u test->max_entries:%u",
		  nr_read_elems, test->max_entries)) {
		err = -1;
		goto done;
	}

	if (CHECK(nread > 0, "Unexpected extra pprint output: %s", line)) {
		err = -1;
		goto done;
	}

	err = 0;

done:
	if (mapv)
		free(mapv);
	if (!err)
		fprintf(stderr, "OK");
	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);
	if (btf_fd >= 0)
		close(btf_fd);
	if (map_fd >= 0)
		close(map_fd);
	if (pin_file)
		fclose(pin_file);
	unlink(pin_path);
	free(line);
}

static void test_pprint(void)
{
	unsigned int i;

	/* test various maps with the first test template */
	for (i = 0; i < ARRAY_SIZE(pprint_tests_meta); i++) {
		pprint_test_template[0].descr = pprint_tests_meta[i].descr;
		pprint_test_template[0].map_type = pprint_tests_meta[i].map_type;
		pprint_test_template[0].map_name = pprint_tests_meta[i].map_name;
		pprint_test_template[0].ordered_map = pprint_tests_meta[i].ordered_map;
		pprint_test_template[0].lossless_map = pprint_tests_meta[i].lossless_map;
		pprint_test_template[0].percpu_map = pprint_tests_meta[i].percpu_map;

		do_test_pprint(0);
	}

	/* test rest test templates with the first map */
	for (i = 1; i < ARRAY_SIZE(pprint_test_template); i++) {
		pprint_test_template[i].descr = pprint_tests_meta[0].descr;
		pprint_test_template[i].map_type = pprint_tests_meta[0].map_type;
		pprint_test_template[i].map_name = pprint_tests_meta[0].map_name;
		pprint_test_template[i].ordered_map = pprint_tests_meta[0].ordered_map;
		pprint_test_template[i].lossless_map = pprint_tests_meta[0].lossless_map;
		pprint_test_template[i].percpu_map = pprint_tests_meta[0].percpu_map;
		do_test_pprint(i);
	}
}

#define BPF_LINE_INFO_ENC(insn_off, file_off, line_off, line_num, line_col) \
	(insn_off), (file_off), (line_off), ((line_num) << 10 | ((line_col) & 0x3ff))

static struct prog_info_raw_test {
	const char *descr;
	const char *str_sec;
	const char *err_str;
	__u32 raw_types[MAX_NR_RAW_U32];
	__u32 str_sec_size;
	struct bpf_insn insns[MAX_INSNS];
	__u32 prog_type;
	__u32 func_info[MAX_SUBPROGS][2];
	__u32 func_info_rec_size;
	__u32 func_info_cnt;
	__u32 line_info[MAX_NR_RAW_U32];
	__u32 line_info_rec_size;
	__u32 nr_jited_ksyms;
	bool expected_prog_load_failure;
	__u32 dead_code_cnt;
	__u32 dead_code_mask;
	__u32 dead_func_cnt;
	__u32 dead_func_mask;
} info_raw_tests[] = {
{
	.descr = "func_type (main func + one sub)",
	.raw_types = {
		BTF_TYPE_INT_ENC(NAME_TBD, BTF_INT_SIGNED, 0, 32, 4),	/* [1] */
		BTF_TYPE_INT_ENC(NAME_TBD, 0, 0, 32, 4),	/* [2] */
		BTF_FUNC_PROTO_ENC(1, 2),			/* [3] */
			BTF_FUNC_PROTO_ARG_ENC(NAME_TBD, 1),
			BTF_FUNC_PROTO_ARG_ENC(NAME_TBD, 2),
		BTF_FUNC_PROTO_ENC(1, 2),			/* [4] */
			BTF_FUNC_PROTO_ARG_ENC(NAME_TBD, 2),
			BTF_FUNC_PROTO_ARG_ENC(NAME_TBD, 1),
		BTF_FUNC_ENC(NAME_TBD, 3),			/* [5] */
		BTF_FUNC_ENC(NAME_TBD, 4),			/* [6] */
		BTF_END_RAW,
	},
	.str_sec = "\0int\0unsigned int\0a\0b\0c\0d\0funcA\0funcB",
	.str_sec_size = sizeof("\0int\0unsigned int\0a\0b\0c\0d\0funcA\0funcB"),
	.insns = {
		BPF_RAW_INSN(BPF_JMP | BPF_CALL, 0, 1, 0, 2),
		BPF_MOV64_IMM(BPF_REG_0, 1),
		BPF_EXIT_INSN(),
		BPF_MOV64_IMM(BPF_REG_0, 2),
		BPF_EXIT_INSN(),
	},
	.prog_type = BPF_PROG_TYPE_TRACEPOINT,
	.func_info = { {0, 5}, {3, 6} },
	.func_info_rec_size = 8,
	.func_info_cnt = 2,
	.line_info = { BTF_END_RAW },
},
};

static size_t probe_prog_length(const struct bpf_insn *fp)
{
	size_t len;

	for (len = MAX_INSNS - 1; len > 0; --len)
		if (fp[len].code != 0 || fp[len].imm != 0)
			break;
	return len + 1;
}

static __u32 *patch_name_tbd(const __u32 *raw_u32,
			     const char *str, __u32 str_off,
			     unsigned int str_sec_size,
			     unsigned int *ret_size)
{
	int i, raw_u32_size = get_raw_sec_size(raw_u32);
	const char *end_str = str + str_sec_size;
	const char *next_str = str + str_off;
	__u32 *new_u32 = NULL;

	if (raw_u32_size == -1)
		return ERR_PTR(-EINVAL);

	if (!raw_u32_size) {
		*ret_size = 0;
		return NULL;
	}

	new_u32 = malloc(raw_u32_size);
	if (!new_u32)
		return ERR_PTR(-ENOMEM);

	for (i = 0; i < raw_u32_size / sizeof(raw_u32[0]); i++) {
		if (raw_u32[i] == NAME_TBD) {
			next_str = get_next_str(next_str, end_str);
			if (CHECK(!next_str, "Error in getting next_str\n")) {
				free(new_u32);
				return ERR_PTR(-EINVAL);
			}
			new_u32[i] = next_str - str;
			next_str += strlen(next_str);
		} else {
			new_u32[i] = raw_u32[i];
		}
	}

	*ret_size = raw_u32_size;
	return new_u32;
}

static int test_get_finfo(const struct prog_info_raw_test *test,
			  int prog_fd)
{
	struct bpf_prog_info info = {};
	struct bpf_func_info *finfo;
	__u32 info_len, rec_size, i;
	void *func_info = NULL;
	__u32 nr_func_info;
	int err;

	/* get necessary lens */
	info_len = sizeof(struct bpf_prog_info);
	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);
	if (CHECK(err < 0, "invalid get info (1st) errno:%d", errno)) {
		fprintf(stderr, "%s\n", btf_log_buf);
		return -1;
	}
	nr_func_info = test->func_info_cnt - test->dead_func_cnt;
	if (CHECK(info.nr_func_info != nr_func_info,
		  "incorrect info.nr_func_info (1st) %d",
		  info.nr_func_info)) {
		return -1;
	}

	rec_size = info.func_info_rec_size;
	if (CHECK(rec_size != sizeof(struct bpf_func_info),
		  "incorrect info.func_info_rec_size (1st) %d", rec_size)) {
		return -1;
	}

	if (!info.nr_func_info)
		return 0;

	func_info = malloc(info.nr_func_info * rec_size);
	if (CHECK(!func_info, "out of memory"))
		return -1;

	/* reset info to only retrieve func_info related data */
	memset(&info, 0, sizeof(info));
	info.nr_func_info = nr_func_info;
	info.func_info_rec_size = rec_size;
	info.func_info = ptr_to_u64(func_info);
	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);
	if (CHECK(err < 0, "invalid get info (2nd) errno:%d", errno)) {
		fprintf(stderr, "%s\n", btf_log_buf);
		err = -1;
		goto done;
	}
	if (CHECK(info.nr_func_info != nr_func_info,
		  "incorrect info.nr_func_info (2nd) %d",
		  info.nr_func_info)) {
		err = -1;
		goto done;
	}
	if (CHECK(info.func_info_rec_size != rec_size,
		  "incorrect info.func_info_rec_size (2nd) %d",
		  info.func_info_rec_size)) {
		err = -1;
		goto done;
	}

	finfo = func_info;
	for (i = 0; i < nr_func_info; i++) {
		if (test->dead_func_mask & (1 << i))
			continue;
		if (CHECK(finfo->type_id != test->func_info[i][1],
			  "incorrect func_type %u expected %u",
			  finfo->type_id, test->func_info[i][1])) {
			err = -1;
			goto done;
		}
		finfo = (void *)finfo + rec_size;
	}

	err = 0;

done:
	free(func_info);
	return err;
}

static int test_get_linfo(const struct prog_info_raw_test *test,
			  const void *patched_linfo,
			  __u32 cnt, int prog_fd)
{
	__u32 i, info_len, nr_jited_ksyms, nr_jited_func_lens;
	__u64 *jited_linfo = NULL, *jited_ksyms = NULL;
	__u32 rec_size, jited_rec_size, jited_cnt;
	struct bpf_line_info *linfo = NULL;
	__u32 cur_func_len, ksyms_found;
	struct bpf_prog_info info = {};
	__u32 *jited_func_lens = NULL;
	__u64 cur_func_ksyms;
	__u32 dead_insns;
	int err;

	jited_cnt = cnt;
	rec_size = sizeof(*linfo);
	jited_rec_size = sizeof(*jited_linfo);
	if (test->nr_jited_ksyms)
		nr_jited_ksyms = test->nr_jited_ksyms;
	else
		nr_jited_ksyms = test->func_info_cnt - test->dead_func_cnt;
	nr_jited_func_lens = nr_jited_ksyms;

	info_len = sizeof(struct bpf_prog_info);
	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);
	if (CHECK(err < 0, "err:%d errno:%d", err, errno)) {
		err = -1;
		goto done;
	}

	if (!info.jited_prog_len) {
		/* prog is not jited */
		jited_cnt = 0;
		nr_jited_ksyms = 1;
		nr_jited_func_lens = 1;
	}

	if (CHECK(info.nr_line_info != cnt ||
		  info.nr_jited_line_info != jited_cnt ||
		  info.nr_jited_ksyms != nr_jited_ksyms ||
		  info.nr_jited_func_lens != nr_jited_func_lens ||
		  (!info.nr_line_info && info.nr_jited_line_info),
		  "info: nr_line_info:%u(expected:%u) nr_jited_line_info:%u(expected:%u) nr_jited_ksyms:%u(expected:%u) nr_jited_func_lens:%u(expected:%u)",
		  info.nr_line_info, cnt,
		  info.nr_jited_line_info, jited_cnt,
		  info.nr_jited_ksyms, nr_jited_ksyms,
		  info.nr_jited_func_lens, nr_jited_func_lens)) {
		err = -1;
		goto done;
	}

	if (CHECK(info.line_info_rec_size != sizeof(struct bpf_line_info) ||
		  info.jited_line_info_rec_size != sizeof(__u64),
		  "info: line_info_rec_size:%u(userspace expected:%u) jited_line_info_rec_size:%u(userspace expected:%u)",
		  info.line_info_rec_size, rec_size,
		  info.jited_line_info_rec_size, jited_rec_size)) {
		err = -1;
		goto done;
	}

	if (!cnt)
		return 0;

	rec_size = info.line_info_rec_size;
	jited_rec_size = info.jited_line_info_rec_size;

	memset(&info, 0, sizeof(info));

	linfo = calloc(cnt, rec_size);
	if (CHECK(!linfo, "!linfo")) {
		err = -1;
		goto done;
	}
	info.nr_line_info = cnt;
	info.line_info_rec_size = rec_size;
	info.line_info = ptr_to_u64(linfo);

	if (jited_cnt) {
		jited_linfo = calloc(jited_cnt, jited_rec_size);
		jited_ksyms = calloc(nr_jited_ksyms, sizeof(*jited_ksyms));
		jited_func_lens = calloc(nr_jited_func_lens,
					 sizeof(*jited_func_lens));
		if (CHECK(!jited_linfo || !jited_ksyms || !jited_func_lens,
			  "jited_linfo:%p jited_ksyms:%p jited_func_lens:%p",
			  jited_linfo, jited_ksyms, jited_func_lens)) {
			err = -1;
			goto done;
		}

		info.nr_jited_line_info = jited_cnt;
		info.jited_line_info_rec_size = jited_rec_size;
		info.jited_line_info = ptr_to_u64(jited_linfo);
		info.nr_jited_ksyms = nr_jited_ksyms;
		info.jited_ksyms = ptr_to_u64(jited_ksyms);
		info.nr_jited_func_lens = nr_jited_func_lens;
		info.jited_func_lens = ptr_to_u64(jited_func_lens);
	}

	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);

	/*
	 * Only recheck the info.*line_info* fields.
	 * Other fields are not the concern of this test.
	 */
	if (CHECK(err < 0 ||
		  info.nr_line_info != cnt ||
		  (jited_cnt && !info.jited_line_info) ||
		  info.nr_jited_line_info != jited_cnt ||
		  info.line_info_rec_size != rec_size ||
		  info.jited_line_info_rec_size != jited_rec_size,
		  "err:%d errno:%d info: nr_line_info:%u(expected:%u) nr_jited_line_info:%u(expected:%u) line_info_rec_size:%u(expected:%u) jited_linfo_rec_size:%u(expected:%u) line_info:%p jited_line_info:%p",
		  err, errno,
		  info.nr_line_info, cnt,
		  info.nr_jited_line_info, jited_cnt,
		  info.line_info_rec_size, rec_size,
		  info.jited_line_info_rec_size, jited_rec_size,
		  (void *)(long)info.line_info,
		  (void *)(long)info.jited_line_info)) {
		err = -1;
		goto done;
	}

	dead_insns = 0;
	while (test->dead_code_mask & (1 << dead_insns))
		dead_insns++;

	CHECK(linfo[0].insn_off, "linfo[0].insn_off:%u",
	      linfo[0].insn_off);
	for (i = 1; i < cnt; i++) {
		const struct bpf_line_info *expected_linfo;

		while (test->dead_code_mask & (1 << (i + dead_insns)))
			dead_insns++;

		expected_linfo = patched_linfo +
			((i + dead_insns) * test->line_info_rec_size);
		if (CHECK(linfo[i].insn_off <= linfo[i - 1].insn_off,
			  "linfo[%u].insn_off:%u <= linfo[%u].insn_off:%u",
			  i, linfo[i].insn_off,
			  i - 1, linfo[i - 1].insn_off)) {
			err = -1;
			goto done;
		}
		if (CHECK(linfo[i].file_name_off != expected_linfo->file_name_off ||
			  linfo[i].line_off != expected_linfo->line_off ||
			  linfo[i].line_col != expected_linfo->line_col,
			  "linfo[%u] (%u, %u, %u) != (%u, %u, %u)", i,
			  linfo[i].file_name_off,
			  linfo[i].line_off,
			  linfo[i].line_col,
			  expected_linfo->file_name_off,
			  expected_linfo->line_off,
			  expected_linfo->line_col)) {
			err = -1;
			goto done;
		}
	}

	if (!jited_cnt) {
		fprintf(stderr, "not jited. skipping jited_line_info check. ");
		err = 0;
		goto done;
	}

	if (CHECK(jited_linfo[0] != jited_ksyms[0],
		  "jited_linfo[0]:%lx != jited_ksyms[0]:%lx",
		  (long)(jited_linfo[0]), (long)(jited_ksyms[0]))) {
		err = -1;
		goto done;
	}

	ksyms_found = 1;
	cur_func_len = jited_func_lens[0];
	cur_func_ksyms = jited_ksyms[0];
	for (i = 1; i < jited_cnt; i++) {
		if (ksyms_found < nr_jited_ksyms &&
		    jited_linfo[i] == jited_ksyms[ksyms_found]) {
			cur_func_ksyms = jited_ksyms[ksyms_found];
			cur_func_len = jited_ksyms[ksyms_found];
			ksyms_found++;
			continue;
		}

		if (CHECK(jited_linfo[i] <= jited_linfo[i - 1],
			  "jited_linfo[%u]:%lx <= jited_linfo[%u]:%lx",
			  i, (long)jited_linfo[i],
			  i - 1, (long)(jited_linfo[i - 1]))) {
			err = -1;
			goto done;
		}

		if (CHECK(jited_linfo[i] - cur_func_ksyms > cur_func_len,
			  "jited_linfo[%u]:%lx - %lx > %u",
			  i, (long)jited_linfo[i], (long)cur_func_ksyms,
			  cur_func_len)) {
			err = -1;
			goto done;
		}
	}

	if (CHECK(ksyms_found != nr_jited_ksyms,
		  "ksyms_found:%u != nr_jited_ksyms:%u",
		  ksyms_found, nr_jited_ksyms)) {
		err = -1;
		goto done;
	}

	err = 0;

done:
	free(linfo);
	free(jited_linfo);
	free(jited_ksyms);
	free(jited_func_lens);
	return err;
}

static void do_test_info_raw(unsigned int test_num)
{
	const struct prog_info_raw_test *test = &info_raw_tests[test_num - 1];
	unsigned int raw_btf_size, linfo_str_off, linfo_size = 1;
	int btf_fd = -1, prog_fd = -1, err = 0;
	void *raw_btf, *patched_linfo = NULL;
	const char *ret_next_str;
	union bpf_attr attr = {};



	raw_btf = btf_raw_create(&hdr_tmpl, test->raw_types,
				 test->str_sec, test->str_sec_size,
				 &raw_btf_size, &ret_next_str);
	if (!raw_btf)
		return;

	*btf_log_buf = '\0';
	btf_fd = load_raw_btf(raw_btf, raw_btf_size);
	free(raw_btf);

	if (CHECK(btf_fd < 0, "invalid btf_fd errno:%d", errno)) {
		err = -1;
		goto done;
	}

	if (*btf_log_buf && always_log)
		fprintf(stderr, "\n%s", btf_log_buf);
	*btf_log_buf = '\0';

	linfo_str_off = ret_next_str - test->str_sec;
	patched_linfo = patch_name_tbd(test->line_info,
				       test->str_sec, linfo_str_off,
				       test->str_sec_size, &linfo_size);
	err = libbpf_get_error(patched_linfo);
	if (err) {
		fprintf(stderr, "error in creating raw bpf_line_info");
		err = -1;
		goto done;
	}

	attr.prog_type = test->prog_type;
	attr.insns = ptr_to_u64(test->insns);
	attr.insn_cnt = probe_prog_length(test->insns);
	attr.license = ptr_to_u64("GPL");
	attr.prog_btf_fd = btf_fd;
	attr.func_info_rec_size = test->func_info_rec_size;
	attr.func_info_cnt = test->func_info_cnt;
	attr.func_info = ptr_to_u64(test->func_info);
	attr.log_buf = ptr_to_u64(btf_log_buf);
	attr.log_size = BTF_LOG_BUF_SIZE;
	attr.log_level = 1;
	if (linfo_size) {
		attr.line_info_rec_size = test->line_info_rec_size;
		attr.line_info = ptr_to_u64(patched_linfo);
		attr.line_info_cnt = linfo_size / attr.line_info_rec_size;
	}

	prog_fd = syscall(__NR_bpf, BPF_PROG_LOAD, &attr, sizeof(attr));
	err = ((prog_fd < 0) != test->expected_prog_load_failure);
	if (CHECK(err, "prog_fd:%d expected_prog_load_failure:%u errno:%d",
		  prog_fd, test->expected_prog_load_failure, errno) ||
	    CHECK(test->err_str && !strstr(btf_log_buf, test->err_str),
		  "expected err_str:%s", test->err_str)) {
		err = -1;
		goto done;
	}

	if (prog_fd < 0)
		goto done;

	err = test_get_finfo(test, prog_fd);
	if (err)
		goto done;

	err = test_get_linfo(test, patched_linfo,
			     attr.line_info_cnt - test->dead_code_cnt,
			     prog_fd);
	if (err)
		goto done;

done:
	if (*btf_log_buf && (err || always_log))
		fprintf(stderr, "\n%s", btf_log_buf);

	if (btf_fd >= 0)
		close(btf_fd);
	if (prog_fd >= 0)
		close(prog_fd);

	if (!libbpf_get_error(patched_linfo))
		free(patched_linfo);
}

struct btf_raw_data {
	__u32 raw_types[MAX_NR_RAW_U32];
	const char *str_sec;
	__u32 str_sec_size;
};



static struct btf_file_test file_tests[] = {
	{ .file = "test_btf_haskv.o", },
	{ .file = "test_btf_newkv.o", },
	{ .file = "test_btf_nokv.o", .btf_kv_notfound = true, },
};

static void do_test_file(unsigned int test_num)
{
	const struct btf_file_test *test = &file_tests[test_num - 1];
	const char *expected_fnames[] = {"_dummy_tracepoint",
					 "test_long_fname_1",
					 "test_long_fname_2"};
	struct btf_ext *btf_ext = NULL;
	struct bpf_prog_info info = {};
	struct bpf_object *obj = NULL;
	struct bpf_func_info *finfo;
	struct bpf_program *prog;
	__u32 info_len, rec_size;
	bool has_btf_ext = false;
	struct btf *btf = NULL;
	void *func_info = NULL;
	struct bpf_map *map;
	int i, err, prog_fd;


	btf = btf__parse_elf(test->file, &btf_ext);
	err = libbpf_get_error(btf);
	if (err) {
		if (err == -ENOENT) {
			printf("%s:SKIP: No ELF %s found", __func__, "BTF_ELF_SEC");
			test__skip();
			return;
		}
		return;
	}
	btf__free(btf);

	has_btf_ext = btf_ext != NULL;
	btf_ext__free(btf_ext);

	obj = bpf_object__open(test->file);
	err = libbpf_get_error(obj);
	if (CHECK(err, "obj: %d", err))
		return;

	prog = bpf_object__next_program(obj, NULL);
	if (CHECK(!prog, "Cannot find bpf_prog")) {
		err = -1;
		goto done;
	}

	bpf_program__set_type(prog, BPF_PROG_TYPE_TRACEPOINT);
	err = bpf_object__load(obj);
	if (CHECK(err < 0, "bpf_object__load: %d", err))
		goto done;
	prog_fd = bpf_program__fd(prog);

	map = bpf_object__find_map_by_name(obj, "btf_map");
	if (CHECK(!map, "btf_map not found")) {
		err = -1;
		goto done;
	}

	err = (bpf_map__btf_key_type_id(map) == 0 || bpf_map__btf_value_type_id(map) == 0)
		!= test->btf_kv_notfound;
	if (CHECK(err, "btf_key_type_id:%u btf_value_type_id:%u test->btf_kv_notfound:%u",
		  bpf_map__btf_key_type_id(map), bpf_map__btf_value_type_id(map),
		  test->btf_kv_notfound))
		goto done;

	if (!has_btf_ext)
		goto skip;

	/* get necessary program info */
	info_len = sizeof(struct bpf_prog_info);
	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);

	if (CHECK(err < 0, "invalid get info (1st) errno:%d", errno)) {
		fprintf(stderr, "%s\n", btf_log_buf);
		err = -1;
		goto done;
	}
	if (CHECK(info.nr_func_info != 3,
		  "incorrect info.nr_func_info (1st) %d",
		  info.nr_func_info)) {
		err = -1;
		goto done;
	}
	rec_size = info.func_info_rec_size;
	if (CHECK(rec_size != sizeof(struct bpf_func_info),
		  "incorrect info.func_info_rec_size (1st) %d\n", rec_size)) {
		err = -1;
		goto done;
	}

	func_info = malloc(info.nr_func_info * rec_size);
	if (CHECK(!func_info, "out of memory")) {
		err = -1;
		goto done;
	}

	/* reset info to only retrieve func_info related data */
	memset(&info, 0, sizeof(info));
	info.nr_func_info = 3;
	info.func_info_rec_size = rec_size;
	info.func_info = ptr_to_u64(func_info);

	err = bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);

	if (CHECK(err < 0, "invalid get info (2nd) errno:%d", errno)) {
		fprintf(stderr, "%s\n", btf_log_buf);
		err = -1;
		goto done;
	}
	if (CHECK(info.nr_func_info != 3,
		  "incorrect info.nr_func_info (2nd) %d",
		  info.nr_func_info)) {
		err = -1;
		goto done;
	}
	if (CHECK(info.func_info_rec_size != rec_size,
		  "incorrect info.func_info_rec_size (2nd) %d",
		  info.func_info_rec_size)) {
		err = -1;
		goto done;
	}

	btf = btf__load_from_kernel_by_id(info.btf_id);
	err = libbpf_get_error(btf);
	if (CHECK(err, "cannot get btf from kernel, err: %d", err))
		goto done;

	/* check three functions */
	finfo = func_info;
	for (i = 0; i < 3; i++) {
		const struct btf_type *t;
		const char *fname;

		t = btf__type_by_id(btf, finfo->type_id);
		if (CHECK(!t, "btf__type_by_id failure: id %u",
			  finfo->type_id)) {
			err = -1;
			goto done;
		}

		fname = btf__name_by_offset(btf, t->name_off);
		err = strcmp(fname, expected_fnames[i]);
		/* for the second and third functions in .text section,
		 * the compiler may order them either way.
		 */
		if (i && err)
			err = strcmp(fname, expected_fnames[3 - i]);
		if (CHECK(err, "incorrect fname %s", fname ? : "")) {
			err = -1;
			goto done;
		}

		finfo = (void *)finfo + rec_size;
	}

skip:
	fprintf(stderr, "OK");

done:
	btf__free(btf);
	free(func_info);
	bpf_object__close(obj);
}

 
int main(void)
{
	int i;

	always_log = env.verbosity > VERBOSE_NONE;

	for (i = 1; i <= ARRAY_SIZE(raw_tests); i++)
		do_test_raw(i);
	for (i = 1; i <= ARRAY_SIZE(get_info_tests); i++)
		do_test_get_info(i);
	for (i = 1; i <= ARRAY_SIZE(info_raw_tests); i++)
		do_test_info_raw(i);
	for (i = 1; i <= ARRAY_SIZE(file_tests); i++)
		do_test_file(i);
	test_pprint();
	return 0;
}
