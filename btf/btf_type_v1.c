/* SPDX-License-Identifier: GPL-2.0 */
/* Copyright (c) 2022 Cloudcome */
#include <stdio.h>
#include <unistd.h>
#include <errno.h>
#include <bpf.h>
#include <uapi/linux/btf.h>
#include <btf.h>
#include "test_btf.h"
#include "libbpf_internal.h"

#define BTF_PARAM_ENC(name, type) (name), (type)

static int probe_void_btf(void)
{
	struct btf *btf = NULL;
	const struct btf_type *t,*tt,*ttt;
	int fd, err;
	
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

    /* Step 1: loads and verifies the BTF */
	/*
      1) loads and verifies the BTF
      2) returns a BTF fd to userspace 
	*/
	fd = libbpf__load_raw_btf((char *)types, sizeof(types), strs, sizeof(strs));
	if (fd < 0)
	  return 0; /* BTF not supported at all */
    
    /* Step 2: constructs struct btf from in-kernel BTF data by FD and 
	 load BTF data by FD
    */
	btf = btf_get_from_fd(fd, NULL);

	/* Step 3: Get pointer to a btf_type */
	/* even  we have a pointer to a btf_type,we can get any data we want */
	
	/* int */
	printf("print int BTF info\n");
	t = btf__type_by_id(btf, 1);

    printf("kind is: %u\n", btf_kind(t));
    printf("size is: %d\n", t->size);

    const char *iname; 
	iname = btf__name_by_offset(btf, t->name_off);

	printf("name_off is: %d\n", t->name_off);
	printf("name is: %s\n\n", iname);

    
	/* FUNC_PROTO */
	printf("print FUNC_PROTO BTF info\n");
	tt = btf__type_by_id(btf, 2);
    
    printf("kind is: %u\n", btf_kind(tt));
    printf("size is: %d\n", tt->size);

	const char *fpname; 
	fpname = btf__name_by_offset(btf, tt->name_off);

	printf("name_off is: %d\n", tt->name_off);
	printf("name is: %s\n\n", fpname);

	const struct btf_param *p = btf_params(tt);
	const char *pname;
	printf("param_name_off is: %d\n", p->name_off);
    printf("param_type is: %d\n", p->type);

	pname = btf__name_by_offset(btf, p->name_off);
	printf("pname is: %s\n\n", pname);


	/* FUNC x */
	printf("print FUNC x BTF info\n");
	ttt = btf__type_by_id(btf, 3);

    printf("kind is: %u\n", btf_kind(ttt));
    printf("size is: %d\n", ttt->size);
    
	const char *fname;
	fname = btf__name_by_offset(btf, ttt->name_off);
	printf("name_off is: %d\n", ttt->name_off);
	printf("name is: %s\n", fname);


	close(fd);
	return !err;
}

int main(void)
{
    probe_void_btf();
    return 0;
}

