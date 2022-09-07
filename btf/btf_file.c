/* SPDX-License-Identifier: GPL-2.0 */
/* Copyright (c) 2018 Facebook */

#include <linux/err.h>
#include <linux/kernel.h>
#include <stdlib.h>
#include <bpf/libbpf.h>

#include <uapi/linux/btf.h>
#include <btf.h>

#include "test_progs.h"


struct btf_file_test {
	const char *file;
};


static struct btf_file_test file_tests[] = {
	{ .file = "/root/ebpf/btf/xdp.oo"},
};

static void do_test_file(unsigned int test_num)
{
	const struct btf_file_test *test = &file_tests[test_num - 1];

	struct btf_ext *btf_ext = NULL;
	struct bpf_prog_info info = {};
	struct bpf_object *obj = NULL;
	struct bpf_func_info *finfo;
	struct bpf_program *prog;
	__u32 info_len, rec_size;
	bool has_btf_ext = false;
	struct btf *btf = NULL;
	void *func_info = NULL;
	int err, prog_fd;

   
	btf = btf__parse_elf(test->file, &btf_ext);
	
	err = libbpf_get_error(btf);
	if (err) {
		if (err == -ENOENT) {
			printf("%s:SKIP: No ELF %s found", __func__, "BTF_ELF_SEC");
			return;
		}
		return;
	}
	
	btf__free(btf);
   
	has_btf_ext = btf_ext != NULL;
	btf_ext__free(btf_ext);
   
   
	obj = bpf_object__open(test->file);

	prog = bpf_object__next_program(obj, NULL);

	bpf_program__set_type(prog, BPF_PROG_TYPE_XDP);
	bpf_object__load(obj);

	prog_fd = bpf_program__fd(prog);


	if (!has_btf_ext)
		goto skip;

	/* get necessary program info */
	info_len = sizeof(struct bpf_prog_info);
	bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);
    printf("nr_func_info: %d\n", info.nr_func_info);

	rec_size = info.func_info_rec_size;
	printf("func_info_rec_size: %d\n", info.func_info_rec_size);
    
	func_info = malloc(info.nr_func_info * rec_size);

    /* reset info to only retrieve func_info related data */
    memset(&info, 0, sizeof(info));
	info.nr_func_info = 1;
	info.func_info_rec_size = rec_size;
	info.func_info = ptr_to_u64(func_info);

    bpf_obj_get_info_by_fd(prog_fd, &info, &info_len);

	btf = btf__load_from_kernel_by_id(info.btf_id);
	

	/* check three functions */
	finfo = func_info;
	
	const struct btf_type *t;
	const char *fname;
        

	t = btf__type_by_id(btf, finfo->type_id);
	printf("name_off is: %d\n", t->name_off);
 
	fname = btf__name_by_offset(btf, t->name_off);
	printf("name is: %s\n", fname);
		
	finfo = (void *)finfo + rec_size;
	

skip:
	fprintf(stderr, "OK");


	btf__free(btf);
	free(func_info);
	bpf_object__close(obj);
}

 
int main(void)
{
	int i;

	for (i = 1; i <= ARRAY_SIZE(file_tests); i++)
		do_test_file(i);
	
	return 0;
}
