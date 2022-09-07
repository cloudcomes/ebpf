/* SPDX-License-Identifier: GPL-2.0 */
/* Copyright (c) 2018 Facebook */
#include <stdio.h>
#include <unistd.h>
#include <bpf/bpf.h>
#include <errno.h>
#include <uapi/linux/btf.h>
#include <btf.h>
#include "test_btf.h"
#include "libbpf_internal.h"

#define BTF_PARAM_ENC(name, type) (name), (type)

static int probe_void_btf(void)
{

	struct bpf_btf_info info;
	struct btf *btf = NULL;
	const struct btf_type *t;

	int fd, btf_fd,err;
	
	const char *fname;
	__u32 len = sizeof(info);

    /* void x(int a) {} */
    static const char strs[] = "\0int\0x\0a";
	 
	__u32 types[] = { 
		/* int */
		BTF_TYPE_INT_ENC(1, BTF_INT_SIGNED, 0, 32, 4),  /* [1] */ 
		/* FUNC_PROTO */                                /* [2] */
		BTF_TYPE_ENC(0, BTF_INFO_ENC(BTF_KIND_FUNC_PROTO, 0, 1), 0),
		BTF_PARAM_ENC(7, 1),
		/* FUNC x */                                    /* [3] */
		BTF_TYPE_ENC(5, BTF_INFO_ENC(BTF_KIND_FUNC, 0, 0), 2),
	};

	fd = libbpf__load_raw_btf((char *)types, sizeof(types), strs, sizeof(strs));
	if (fd < 0)
		return 0; /* BTF not supported at all */
    
	memset(&info, 0, sizeof(info));
	err = bpf_obj_get_info_by_fd(fd, &info, &len);


    btf_fd = bpf_btf_get_fd_by_id(info.id);
	printf("btf_fd: %d\n", btf_fd);

	btf = btf_get_from_fd(btf_fd, NULL);

	/* Get Type info */
	t = btf__type_by_id(btf, 3);

    printf("kind is: %u\n", btf_kind(t));
	printf("vlen is: %d\n", btf_vlen(t));
    printf("size is: %d\n", t->size);

	fname = btf__name_by_offset(btf, t->name_off);
	printf("name_off is: %d\n", t->name_off);
	printf("name is: %s\n", fname);
    
    const struct btf_type *tt;
	tt = btf__type_by_id(btf, 2);

	const struct btf_param *p = btf_params(tt);
	printf("param_name_off is: %d\n", p->name_off);
    printf("param_type is: %d\n", p->type);

	const char *pname;
    pname = btf__name_by_offset(btf, p->name_off);
	printf("pname is: %s\n", pname);

    /* Get String Info */ 
	const char *btf_str;
	btf_str = btf__str_by_offset(btf, t->name_off);
	printf("btf_str is: %s\n", btf_str);

    btf_str = btf__str_by_offset(btf, p->name_off);
	printf("btf_str is: %s\n", btf_str);

    /* Get Info */
    __u32 type_info = btf_type_info(btf_kind(t), btf_vlen(t) + 1, btf_kflag(t));
    printf("Fun info is: %x\n", type_info);

	close(fd);
	return !err;
}

int main(void)
{
    probe_void_btf();
	return 0;
}


