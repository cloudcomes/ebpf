/* SPDX-License-Identifier: (LGPL-2.1 OR BSD-2-Clause) */

/* THIS FILE IS AUTOGENERATED BY BPFTOOL! */
#ifndef __LSM_BPF_SKEL_H__
#define __LSM_BPF_SKEL_H__

#include <errno.h>
#include <stdlib.h>
#include <bpf/libbpf.h>

struct lsm_bpf {
	struct bpf_object_skeleton *skeleton;
	struct bpf_object *obj;
	struct {
		struct bpf_map *bss;
		struct bpf_map *rodata;
	} maps;
	struct {
		struct bpf_program *test_int_hook;
	} progs;
	struct {
		struct bpf_link *test_int_hook;
	} links;
	struct lsm_bpf__bss {
		int monitored_pid;
		int mprotect_count;
	} *bss;
	struct lsm_bpf__rodata {
	} *rodata;

#ifdef __cplusplus
	static inline struct lsm_bpf *open(const struct bpf_object_open_opts *opts = nullptr);
	static inline struct lsm_bpf *open_and_load();
	static inline int load(struct lsm_bpf *skel);
	static inline int attach(struct lsm_bpf *skel);
	static inline void detach(struct lsm_bpf *skel);
	static inline void destroy(struct lsm_bpf *skel);
	static inline const void *elf_bytes(size_t *sz);
#endif /* __cplusplus */
};

static void
lsm_bpf__destroy(struct lsm_bpf *obj)
{
	if (!obj)
		return;
	if (obj->skeleton)
		bpf_object__destroy_skeleton(obj->skeleton);
	free(obj);
}

static inline int
lsm_bpf__create_skeleton(struct lsm_bpf *obj);

static inline struct lsm_bpf *
lsm_bpf__open_opts(const struct bpf_object_open_opts *opts)
{
	struct lsm_bpf *obj;
	int err;

	obj = (struct lsm_bpf *)calloc(1, sizeof(*obj));
	if (!obj) {
		errno = ENOMEM;
		return NULL;
	}

	err = lsm_bpf__create_skeleton(obj);
	if (err)
		goto err_out;

	err = bpf_object__open_skeleton(obj->skeleton, opts);
	if (err)
		goto err_out;

	return obj;
err_out:
	lsm_bpf__destroy(obj);
	errno = -err;
	return NULL;
}

static inline struct lsm_bpf *
lsm_bpf__open(void)
{
	return lsm_bpf__open_opts(NULL);
}

static inline int
lsm_bpf__load(struct lsm_bpf *obj)
{
	return bpf_object__load_skeleton(obj->skeleton);
}

static inline struct lsm_bpf *
lsm_bpf__open_and_load(void)
{
	struct lsm_bpf *obj;
	int err;

	obj = lsm_bpf__open();
	if (!obj)
		return NULL;
	err = lsm_bpf__load(obj);
	if (err) {
		lsm_bpf__destroy(obj);
		errno = -err;
		return NULL;
	}
	return obj;
}

static inline int
lsm_bpf__attach(struct lsm_bpf *obj)
{
	return bpf_object__attach_skeleton(obj->skeleton);
}

static inline void
lsm_bpf__detach(struct lsm_bpf *obj)
{
	bpf_object__detach_skeleton(obj->skeleton);
}

static inline const void *lsm_bpf__elf_bytes(size_t *sz);

static inline int
lsm_bpf__create_skeleton(struct lsm_bpf *obj)
{
	struct bpf_object_skeleton *s;
	int err;

	s = (struct bpf_object_skeleton *)calloc(1, sizeof(*s));
	if (!s)	{
		err = -ENOMEM;
		goto err;
	}

	s->sz = sizeof(*s);
	s->name = "lsm_bpf";
	s->obj = &obj->obj;

	/* maps */
	s->map_cnt = 2;
	s->map_skel_sz = sizeof(*s->maps);
	s->maps = (struct bpf_map_skeleton *)calloc(s->map_cnt, s->map_skel_sz);
	if (!s->maps) {
		err = -ENOMEM;
		goto err;
	}

	s->maps[0].name = "lsm_bpf.bss";
	s->maps[0].map = &obj->maps.bss;
	s->maps[0].mmaped = (void **)&obj->bss;

	s->maps[1].name = "lsm_bpf.rodata";
	s->maps[1].map = &obj->maps.rodata;
	s->maps[1].mmaped = (void **)&obj->rodata;

	/* programs */
	s->prog_cnt = 1;
	s->prog_skel_sz = sizeof(*s->progs);
	s->progs = (struct bpf_prog_skeleton *)calloc(s->prog_cnt, s->prog_skel_sz);
	if (!s->progs) {
		err = -ENOMEM;
		goto err;
	}

	s->progs[0].name = "test_int_hook";
	s->progs[0].prog = &obj->progs.test_int_hook;
	s->progs[0].link = &obj->links.test_int_hook;

	s->data = (void *)lsm_bpf__elf_bytes(&s->data_sz);

	obj->skeleton = s;
	return 0;
err:
	bpf_object__destroy_skeleton(s);
	return err;
}

static inline const void *lsm_bpf__elf_bytes(size_t *sz)
{
	*sz = 8488;
	return (const void *)"\
\x7f\x45\x4c\x46\x02\x01\x01\0\0\0\0\0\0\0\0\0\x01\0\xf7\0\x01\0\0\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\xa8\x1d\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\x40\0\x0e\0\
\x0d\0\x79\x17\x18\0\0\0\0\0\xbf\x72\0\0\0\0\0\0\x67\x02\0\0\x20\0\0\0\x77\x02\
\0\0\x20\0\0\0\x55\x02\x1f\0\0\0\0\0\x79\x18\0\0\0\0\0\0\x85\0\0\0\x0e\0\0\0\
\xbf\x06\0\0\0\0\0\0\x79\x81\x40\0\0\0\0\0\xb7\x07\0\0\0\0\0\0\x77\x06\0\0\x20\
\0\0\0\x79\x11\x30\x01\0\0\0\0\x79\x82\0\0\0\0\0\0\x2d\x12\x11\0\0\0\0\0\x79\
\x82\x08\0\0\0\0\0\x2d\x21\x0f\0\0\0\0\0\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\x61\x11\0\0\0\0\0\0\x5d\x61\x0b\0\0\0\0\0\x18\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\x61\x13\0\0\0\0\0\0\x07\x03\0\0\x01\0\0\0\x63\x31\0\0\0\0\0\0\x18\x01\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\xb7\x02\0\0\x1d\0\0\0\x85\0\0\0\x06\0\0\0\x18\x07\0\0\xff\
\xff\xff\xff\0\0\0\0\0\0\0\0\x18\x01\0\0\x1d\0\0\0\0\0\0\0\0\0\0\0\xb7\x02\0\0\
\x12\0\0\0\xbf\x63\0\0\0\0\0\0\x85\0\0\0\x06\0\0\0\xbf\x70\0\0\0\0\0\0\x95\0\0\
\0\0\0\0\0\x47\x50\x4c\0\x63\x75\x72\x72\x65\x6e\x74\x20\x6d\x70\x72\x6f\x74\
\x65\x63\x74\x5f\x63\x6f\x75\x6e\x74\x20\x3d\x20\x25\x64\x0a\0\x63\x75\x72\x72\
\x65\x6e\x74\x20\x70\x69\x64\x20\x3d\x20\x25\x64\x0a\0\x9f\xeb\x01\0\x18\0\0\0\
\0\0\0\0\xf0\x0c\0\0\xf0\x0c\0\0\xa2\x09\0\0\0\0\0\0\0\0\0\x02\x02\0\0\0\x01\0\
\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\0\0\0\0\x01\0\0\x0d\x04\0\0\0\x18\0\0\0\x01\
\0\0\0\x1c\0\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\x01\x20\0\0\0\x01\0\0\x0c\x03\0\0\
\0\xde\0\0\0\x14\0\0\x04\xd0\0\0\0\xed\0\0\0\x07\0\0\0\0\0\0\0\xf6\0\0\0\x07\0\
\0\0\x40\0\0\0\xfd\0\0\0\x08\0\0\0\x80\0\0\0\x05\x01\0\0\x08\0\0\0\xc0\0\0\0\
\x0d\x01\0\0\x09\0\0\0\0\x01\0\0\x13\x01\0\0\x07\0\0\0\xc0\x01\0\0\x22\x01\0\0\
\x0b\0\0\0\0\x02\0\0\x28\x01\0\0\x0c\0\0\0\x40\x02\0\0\x35\x01\0\0\x07\0\0\0\
\x80\x02\0\0\x3e\x01\0\0\x0f\0\0\0\xc0\x02\0\0\x45\x01\0\0\x10\0\0\0\xc0\x03\0\
\0\x54\x01\0\0\x12\0\0\0\x40\x04\0\0\x5d\x01\0\0\x13\0\0\0\x80\x04\0\0\x64\x01\
\0\0\x07\0\0\0\xc0\x04\0\0\x6d\x01\0\0\x15\0\0\0\0\x05\0\0\x75\x01\0\0\x15\0\0\
\0\x40\x05\0\0\x7f\x01\0\0\x16\0\0\0\x80\x05\0\0\x8f\x01\0\0\x17\0\0\0\xc0\x05\
\0\0\xa3\x01\0\0\x1d\0\0\0\0\x06\0\0\xad\x01\0\0\x1e\0\0\0\x40\x06\0\0\xc0\x01\
\0\0\0\0\0\x01\x08\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x06\0\0\0\xd2\x01\0\0\x03\
\0\0\x04\x18\0\0\0\xda\x01\0\0\x07\0\0\0\0\0\0\0\xec\x01\0\0\x0a\0\0\0\x40\0\0\
\0\xf5\x01\0\0\x0a\0\0\0\x80\0\0\0\0\0\0\0\0\0\0\x02\x09\0\0\0\0\0\0\0\0\0\0\
\x02\x20\0\0\0\xfd\x01\0\0\0\0\0\x08\x0d\0\0\0\x06\x02\0\0\x01\0\0\x04\x08\0\0\
\0\x06\x02\0\0\x0e\0\0\0\0\0\0\0\x0d\x02\0\0\0\0\0\x08\x07\0\0\0\0\0\0\0\x02\0\
\0\x04\x20\0\0\0\x19\x02\0\0\x09\0\0\0\0\0\0\0\x1c\x02\0\0\x07\0\0\0\xc0\0\0\0\
\x2c\x02\0\0\x02\0\0\x04\x10\0\0\0\x36\x02\0\0\x11\0\0\0\0\0\0\0\x3b\x02\0\0\
\x11\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\x02\x10\0\0\0\0\0\0\0\0\0\0\x02\x6c\0\0\0\0\
\0\0\0\0\0\0\x02\x14\0\0\0\0\0\0\0\0\0\0\x0a\x78\0\0\0\0\0\0\0\0\0\0\x02\x6e\0\
\0\0\0\0\0\0\0\0\0\x02\0\0\0\0\x40\x02\0\0\0\0\0\x08\x18\0\0\0\x4e\x02\0\0\0\0\
\0\x08\x19\0\0\0\0\0\0\0\x01\0\0\x04\x08\0\0\0\x59\x02\0\0\x1a\0\0\0\0\0\0\0\
\x61\x02\0\0\0\0\0\x08\x1b\0\0\0\x65\x02\0\0\0\0\0\x08\x1c\0\0\0\x6b\x02\0\0\0\
\0\0\x01\x08\0\0\0\x40\0\0\x01\0\0\0\0\0\0\0\x02\x72\0\0\0\xad\x01\0\0\x01\0\0\
\x04\x08\0\0\0\x18\0\0\0\x1f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x76\0\0\0\xb6\x02\
\0\0\x02\0\0\x04\x18\x04\0\0\0\0\0\0\x21\0\0\0\0\0\0\0\xc0\x02\0\0\x5e\0\0\0\
\xc0\x20\0\0\0\0\0\0\x3e\0\0\x04\x18\x04\0\0\xcb\x02\0\0\x08\0\0\0\0\0\0\0\xd0\
\x02\0\0\x22\0\0\0\x40\0\0\0\xd6\x02\0\0\x23\0\0\0\x80\0\0\0\xe6\x02\0\0\x25\0\
\0\0\xc0\0\0\0\xf8\x02\0\0\x07\0\0\0\0\x01\0\0\x02\x03\0\0\x07\0\0\0\x40\x01\0\
\0\x13\x03\0\0\x07\0\0\0\x80\x01\0\0\x24\x03\0\0\x07\0\0\0\xc0\x01\0\0\x3c\x03\
\0\0\x07\0\0\0\0\x02\0\0\x46\x03\0\0\x07\0\0\0\x40\x02\0\0\x55\x03\0\0\x27\0\0\
\0\x80\x02\0\0\x59\x03\0\0\x29\0\0\0\xc0\x02\0\0\x6a\x03\0\0\x29\0\0\0\xe0\x02\
\0\0\x73\x03\0\0\x29\0\0\0\0\x03\0\0\x7c\x03\0\0\x17\0\0\0\x40\x03\0\0\x8b\x03\
\0\0\x04\0\0\0\x80\x03\0\0\x95\x03\0\0\x2b\0\0\0\xa0\x03\0\0\xa5\x03\0\0\x3a\0\
\0\0\xc0\x03\0\0\xaf\x03\0\0\x10\0\0\0\0\x05\0\0\xb6\x03\0\0\x07\0\0\0\x80\x05\
\0\0\xc2\x03\0\0\x07\0\0\0\xc0\x05\0\0\xcd\x03\0\0\x07\0\0\0\0\x06\0\0\xd6\x03\
\0\0\x07\0\0\0\x40\x06\0\0\xe0\x03\0\0\x18\0\0\0\x80\x06\0\0\xea\x03\0\0\x07\0\
\0\0\xc0\x06\0\0\xf2\x03\0\0\x07\0\0\0\0\x07\0\0\xfa\x03\0\0\x07\0\0\0\x40\x07\
\0\0\x03\x04\0\0\x07\0\0\0\x80\x07\0\0\x0d\x04\0\0\x3d\0\0\0\xc0\x07\0\0\x1f\
\x04\0\0\x2b\0\0\0\xe0\x07\0\0\x28\x04\0\0\x07\0\0\0\0\x08\0\0\x33\x04\0\0\x07\
\0\0\0\x40\x08\0\0\x3c\x04\0\0\x07\0\0\0\x80\x08\0\0\x47\x04\0\0\x07\0\0\0\xc0\
\x08\0\0\x50\x04\0\0\x07\0\0\0\0\x09\0\0\x5a\x04\0\0\x07\0\0\0\x40\x09\0\0\x5e\
\x04\0\0\x07\0\0\0\x80\x09\0\0\x6a\x04\0\0\x07\0\0\0\xc0\x09\0\0\x74\x04\0\0\
\x07\0\0\0\0\x0a\0\0\x7c\x04\0\0\x07\0\0\0\x40\x0a\0\0\x86\x04\0\0\x07\0\0\0\
\x80\x0a\0\0\x8e\x04\0\0\x40\0\0\0\xc0\x0a\0\0\x99\x04\0\0\x42\0\0\0\xc0\x16\0\
\0\xa2\x04\0\0\x44\0\0\0\xc0\x17\0\0\xa9\x04\0\0\x45\0\0\0\0\x18\0\0\xb1\x04\0\
\0\x07\0\0\0\0\x1c\0\0\xb7\x04\0\0\x4e\0\0\0\x40\x1c\0\0\xc2\x04\0\0\x2b\0\0\0\
\x80\x1c\0\0\xcd\x04\0\0\x4f\0\0\0\xc0\x1c\0\0\xd9\x04\0\0\x50\0\0\0\0\x1d\0\0\
\xdf\x04\0\0\x51\0\0\0\x40\x1d\0\0\xe7\x04\0\0\x15\0\0\0\x80\x1d\0\0\xf0\x04\0\
\0\x52\0\0\0\xc0\x1d\0\0\x07\x05\0\0\x07\0\0\0\0\x1e\0\0\x16\x05\0\0\x07\0\0\0\
\x40\x1e\0\0\x27\x05\0\0\x04\0\0\0\x80\x1e\0\0\x35\x05\0\0\x29\0\0\0\xa0\x1e\0\
\0\x47\x05\0\0\x53\0\0\0\xc0\x1e\0\0\x59\x05\0\0\x55\0\0\0\0\x1f\0\0\x67\x05\0\
\0\x17\0\0\0\x40\x1f\0\0\x75\x05\0\0\x57\0\0\0\x80\x1f\0\0\x84\x05\0\0\x5c\0\0\
\0\x80\x20\0\0\x8a\x05\0\0\x01\0\0\x04\x08\0\0\0\xd2\x01\0\0\x0a\0\0\0\0\0\0\0\
\x92\x05\0\0\0\0\0\x08\x24\0\0\0\x96\x05\0\0\0\0\0\x08\x02\0\0\0\0\0\0\0\0\0\0\
\x02\x26\0\0\0\0\0\0\0\x05\0\0\x0d\x07\0\0\0\0\0\0\0\x15\0\0\0\0\0\0\0\x07\0\0\
\0\0\0\0\0\x07\0\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\x07\0\0\0\0\0\0\0\0\0\0\x02\x28\
\0\0\0\x9c\x05\0\0\0\0\0\x08\x0f\0\0\0\xa2\x05\0\0\0\0\0\x08\x2a\0\0\0\0\0\0\0\
\x01\0\0\x04\x04\0\0\0\x59\x02\0\0\x04\0\0\0\0\0\0\0\xab\x05\0\0\0\0\0\x08\x2c\
\0\0\0\xb6\x05\0\0\x01\0\0\x04\x04\0\0\0\0\0\0\0\x2d\0\0\0\0\0\0\0\0\0\0\0\x01\
\0\0\x05\x04\0\0\0\xbf\x05\0\0\x2e\0\0\0\0\0\0\0\xc5\x05\0\0\x01\0\0\x04\x04\0\
\0\0\xd2\x05\0\0\x2f\0\0\0\0\0\0\0\xdb\x05\0\0\0\0\0\x08\x30\0\0\0\xeb\x05\0\0\
\x01\0\0\x04\x04\0\0\0\0\0\0\0\x31\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\x05\x04\0\0\0\
\xf5\x05\0\0\x29\0\0\0\0\0\0\0\0\0\0\0\x32\0\0\0\0\0\0\0\0\0\0\0\x36\0\0\0\0\0\
\0\0\0\0\0\0\x02\0\0\x04\x02\0\0\0\xf9\x05\0\0\x33\0\0\0\0\0\0\0\0\x06\0\0\x33\
\0\0\0\x08\0\0\0\x08\x06\0\0\0\0\0\x08\x34\0\0\0\x0b\x06\0\0\0\0\0\x08\x35\0\0\
\0\x10\x06\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\0\0\0\0\0\x02\0\0\x04\x04\0\0\0\x1e\
\x06\0\0\x37\0\0\0\0\0\0\0\x2d\x06\0\0\x37\0\0\0\x10\0\0\0\x32\x06\0\0\0\0\0\
\x08\x38\0\0\0\x36\x06\0\0\0\0\0\x08\x39\0\0\0\x3c\x06\0\0\0\0\0\x01\x02\0\0\0\
\x10\0\0\0\x4b\x06\0\0\x05\0\0\x04\x28\0\0\0\x58\x06\0\0\x17\0\0\0\0\0\0\0\xd9\
\x04\0\0\x17\0\0\0\x40\0\0\0\x5e\x06\0\0\x3b\0\0\0\x80\0\0\0\x62\x06\0\0\x3c\0\
\0\0\xa0\0\0\0\x6c\x06\0\0\x10\0\0\0\xc0\0\0\0\x76\x06\0\0\x01\0\0\x04\x04\0\0\
\0\x2d\x06\0\0\x29\0\0\0\0\0\0\0\x8c\x06\0\0\0\0\0\x08\x2e\0\0\0\x9b\x06\0\0\0\
\0\0\x08\x3e\0\0\0\xa6\x06\0\0\x01\0\0\x04\x04\0\0\0\xaf\x06\0\0\x3f\0\0\0\0\0\
\0\0\xb8\x06\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x07\0\
\0\0\x41\0\0\0\x30\0\0\0\xc5\x06\0\0\0\0\0\x01\x04\0\0\0\x20\0\0\0\xd9\x06\0\0\
\x01\0\0\x04\x20\0\0\0\x58\x06\0\0\x43\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\
\x17\0\0\0\x41\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\x02\x71\0\0\0\xe5\x06\0\0\0\0\0\
\x08\x46\0\0\0\0\0\0\0\x0b\0\0\x04\x80\0\0\0\xf2\x06\0\0\x23\0\0\0\0\0\0\0\xf9\
\x06\0\0\x18\0\0\0\x40\0\0\0\x01\x07\0\0\x3a\0\0\0\x80\0\0\0\x0d\x07\0\0\x47\0\
\0\0\xc0\x01\0\0\xb1\x04\0\0\x39\0\0\0\0\x02\0\0\x11\x07\0\0\x48\0\0\0\x40\x02\
\0\0\x16\x07\0\0\x16\0\0\0\x40\x03\0\0\x1b\x07\0\0\x49\0\0\0\x80\x03\0\0\x26\
\x07\0\0\x29\0\0\0\xc0\x03\0\0\x39\x07\0\0\x37\0\0\0\xe0\x03\0\0\x4d\x07\0\0\
\x4b\0\0\0\xf0\x03\0\0\0\0\0\0\0\0\0\x02\x70\0\0\0\x5f\x07\0\0\x04\0\0\x04\x20\
\0\0\0\xd9\x04\0\0\x17\0\0\0\0\0\0\0\x62\x06\0\0\x3c\0\0\0\x40\0\0\0\x5e\x06\0\
\0\x3b\0\0\0\x60\0\0\0\x6c\x06\0\0\x10\0\0\0\x80\0\0\0\0\0\0\0\0\0\0\x02\x4a\0\
\0\0\0\0\0\0\0\0\0\x0a\x77\0\0\0\x65\x07\0\0\0\0\0\x08\x4c\0\0\0\x69\x07\0\0\0\
\0\0\x08\x4d\0\0\0\x6f\x07\0\0\0\0\0\x01\x02\0\0\0\x10\0\0\x01\0\0\0\0\0\0\0\
\x02\x6d\0\0\0\0\0\0\0\0\0\0\x02\x6f\0\0\0\0\0\0\0\0\0\0\x02\x74\0\0\0\0\0\0\0\
\0\0\0\x02\x75\0\0\0\0\0\0\0\0\0\0\x02\x73\0\0\0\x75\x07\0\0\0\0\0\x08\x54\0\0\
\0\x7a\x07\0\0\0\0\0\x01\x01\0\0\0\x08\0\0\x04\x59\x05\0\0\x01\0\0\x04\x08\0\0\
\0\x80\x07\0\0\x56\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x02\x79\0\0\0\x89\x07\0\0\x03\0\
\0\x04\x20\0\0\0\x95\x07\0\0\x17\0\0\0\0\0\0\0\x9a\x07\0\0\x10\0\0\0\x40\0\0\0\
\xa0\x07\0\0\x58\0\0\0\xc0\0\0\0\xa5\x07\0\0\0\0\0\x08\x59\0\0\0\0\0\0\0\0\0\0\
\x02\x5a\0\0\0\0\0\0\0\x01\0\0\x0d\0\0\0\0\0\0\0\0\x5b\0\0\0\0\0\0\0\0\0\0\x02\
\x57\0\0\0\xb1\x07\0\0\0\0\0\x08\x5d\0\0\0\xb5\x07\0\0\0\0\0\x08\x3f\0\0\0\0\0\
\0\0\0\0\0\x03\0\0\0\0\x07\0\0\0\x41\0\0\0\0\0\0\0\x9d\x08\0\0\0\0\0\x01\x01\0\
\0\0\x08\0\0\x01\0\0\0\0\0\0\0\x03\0\0\0\0\x5f\0\0\0\x41\0\0\0\x04\0\0\0\xa2\
\x08\0\0\0\0\0\x0e\x60\0\0\0\x01\0\0\0\xab\x08\0\0\0\0\0\x0e\x04\0\0\0\x01\0\0\
\0\xb9\x08\0\0\0\0\0\x0e\x04\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\x0a\x5f\0\0\0\0\0\0\
\0\0\0\0\x03\0\0\0\0\x64\0\0\0\x41\0\0\0\x1d\0\0\0\xc8\x08\0\0\0\0\0\x0e\x65\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\0\0\0\x64\0\0\0\x41\0\0\0\x12\0\0\0\xe2\x08\0\
\0\0\0\0\x0e\x67\0\0\0\0\0\0\0\xfe\x08\0\0\x02\0\0\x0f\0\0\0\0\x62\0\0\0\0\0\0\
\0\x04\0\0\0\x63\0\0\0\0\0\0\0\x04\0\0\0\x03\x09\0\0\x02\0\0\x0f\0\0\0\0\x66\0\
\0\0\0\0\0\0\x1d\0\0\0\x68\0\0\0\x1d\0\0\0\x12\0\0\0\x0b\x09\0\0\x01\0\0\x0f\0\
\0\0\0\x61\0\0\0\0\0\0\0\x04\0\0\0\x54\x01\0\0\0\0\0\x07\0\0\0\0\xb7\x04\0\0\0\
\0\0\x07\0\0\0\0\x13\x09\0\0\0\0\0\x07\0\0\0\0\x18\x09\0\0\0\0\0\x07\0\0\0\0\
\x25\x09\0\0\0\0\0\x07\0\0\0\0\x30\x09\0\0\0\0\0\x07\0\0\0\0\x3d\x09\0\0\0\0\0\
\x07\0\0\0\0\x47\x09\0\0\0\0\0\x07\0\0\0\0\x62\x09\0\0\0\0\0\x07\0\0\0\0\x6e\
\x09\0\0\0\0\0\x07\0\0\0\0\x7d\x09\0\0\0\0\0\x07\0\0\0\0\x1b\x07\0\0\0\0\0\x07\
\0\0\0\0\x8d\x09\0\0\0\0\0\x07\0\0\0\0\x80\x07\0\0\0\0\0\x07\0\0\0\0\0\x6c\x6f\
\x6e\x67\x20\x6c\x6f\x6e\x67\x20\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x69\x6e\
\x74\0\x63\x74\x78\0\x69\x6e\x74\0\x74\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\x6f\
\x6f\x6b\0\x6c\x73\x6d\x2f\x66\x69\x6c\x65\x5f\x6d\x70\x72\x6f\x74\x65\x63\x74\
\0\x2f\x72\x6f\x6f\x74\x2f\x63\x6c\x6f\x75\x64\x2f\x65\x62\x70\x66\x2f\x73\x65\
\x63\x75\x72\x69\x74\x79\x2f\x6c\x73\x6d\x2f\x6c\x73\x6d\x2e\x62\x70\x66\x2e\
\x63\0\x69\x6e\x74\x20\x42\x50\x46\x5f\x50\x52\x4f\x47\x28\x74\x65\x73\x74\x5f\
\x69\x6e\x74\x5f\x68\x6f\x6f\x6b\x2c\x20\x73\x74\x72\x75\x63\x74\x20\x76\x6d\
\x5f\x61\x72\x65\x61\x5f\x73\x74\x72\x75\x63\x74\x20\x2a\x76\x6d\x61\x2c\0\x09\
\x69\x66\x20\x28\x72\x65\x74\x20\x21\x3d\x20\x30\x29\0\x09\x5f\x5f\x75\x33\x32\
\x20\x70\x69\x64\x20\x3d\x20\x62\x70\x66\x5f\x67\x65\x74\x5f\x63\x75\x72\x72\
\x65\x6e\x74\x5f\x70\x69\x64\x5f\x74\x67\x69\x64\x28\x29\x20\x3e\x3e\x20\x33\
\x32\x3b\0\x76\x6d\x5f\x61\x72\x65\x61\x5f\x73\x74\x72\x75\x63\x74\0\x76\x6d\
\x5f\x73\x74\x61\x72\x74\0\x76\x6d\x5f\x65\x6e\x64\0\x76\x6d\x5f\x6e\x65\x78\
\x74\0\x76\x6d\x5f\x70\x72\x65\x76\0\x76\x6d\x5f\x72\x62\0\x72\x62\x5f\x73\x75\
\x62\x74\x72\x65\x65\x5f\x67\x61\x70\0\x76\x6d\x5f\x6d\x6d\0\x76\x6d\x5f\x70\
\x61\x67\x65\x5f\x70\x72\x6f\x74\0\x76\x6d\x5f\x66\x6c\x61\x67\x73\0\x73\x68\
\x61\x72\x65\x64\0\x61\x6e\x6f\x6e\x5f\x76\x6d\x61\x5f\x63\x68\x61\x69\x6e\0\
\x61\x6e\x6f\x6e\x5f\x76\x6d\x61\0\x76\x6d\x5f\x6f\x70\x73\0\x76\x6d\x5f\x70\
\x67\x6f\x66\x66\0\x76\x6d\x5f\x66\x69\x6c\x65\0\x76\x6d\x5f\x70\x72\x66\x69\
\x6c\x65\0\x76\x6d\x5f\x70\x72\x69\x76\x61\x74\x65\x5f\x64\x61\x74\x61\0\x73\
\x77\x61\x70\x5f\x72\x65\x61\x64\x61\x68\x65\x61\x64\x5f\x69\x6e\x66\x6f\0\x76\
\x6d\x5f\x70\x6f\x6c\x69\x63\x79\0\x76\x6d\x5f\x75\x73\x65\x72\x66\x61\x75\x6c\
\x74\x66\x64\x5f\x63\x74\x78\0\x6c\x6f\x6e\x67\x20\x75\x6e\x73\x69\x67\x6e\x65\
\x64\x20\x69\x6e\x74\0\x72\x62\x5f\x6e\x6f\x64\x65\0\x5f\x5f\x72\x62\x5f\x70\
\x61\x72\x65\x6e\x74\x5f\x63\x6f\x6c\x6f\x72\0\x72\x62\x5f\x72\x69\x67\x68\x74\
\0\x72\x62\x5f\x6c\x65\x66\x74\0\x70\x67\x70\x72\x6f\x74\x5f\x74\0\x70\x67\x70\
\x72\x6f\x74\0\x70\x67\x70\x72\x6f\x74\x76\x61\x6c\x5f\x74\0\x72\x62\0\x72\x62\
\x5f\x73\x75\x62\x74\x72\x65\x65\x5f\x6c\x61\x73\x74\0\x6c\x69\x73\x74\x5f\x68\
\x65\x61\x64\0\x6e\x65\x78\x74\0\x70\x72\x65\x76\0\x61\x74\x6f\x6d\x69\x63\x5f\
\x6c\x6f\x6e\x67\x5f\x74\0\x61\x74\x6f\x6d\x69\x63\x36\x34\x5f\x74\0\x63\x6f\
\x75\x6e\x74\x65\x72\0\x73\x36\x34\0\x5f\x5f\x73\x36\x34\0\x6c\x6f\x6e\x67\x20\
\x6c\x6f\x6e\x67\x20\x69\x6e\x74\0\x30\x3a\x36\0\x09\x69\x73\x5f\x73\x74\x61\
\x63\x6b\x20\x3d\x20\x28\x76\x6d\x61\x2d\x3e\x76\x6d\x5f\x73\x74\x61\x72\x74\
\x20\x3c\x3d\x20\x76\x6d\x61\x2d\x3e\x76\x6d\x5f\x6d\x6d\x2d\x3e\x73\x74\x61\
\x72\x74\x5f\x73\x74\x61\x63\x6b\x20\x26\x26\0\x6d\x6d\x5f\x73\x74\x72\x75\x63\
\x74\0\x63\x70\x75\x5f\x62\x69\x74\x6d\x61\x70\0\x6d\x6d\x61\x70\0\x6d\x6d\x5f\
\x72\x62\0\x76\x6d\x61\x63\x61\x63\x68\x65\x5f\x73\x65\x71\x6e\x75\x6d\0\x67\
\x65\x74\x5f\x75\x6e\x6d\x61\x70\x70\x65\x64\x5f\x61\x72\x65\x61\0\x6d\x6d\x61\
\x70\x5f\x62\x61\x73\x65\0\x6d\x6d\x61\x70\x5f\x6c\x65\x67\x61\x63\x79\x5f\x62\
\x61\x73\x65\0\x6d\x6d\x61\x70\x5f\x63\x6f\x6d\x70\x61\x74\x5f\x62\x61\x73\x65\
\0\x6d\x6d\x61\x70\x5f\x63\x6f\x6d\x70\x61\x74\x5f\x6c\x65\x67\x61\x63\x79\x5f\
\x62\x61\x73\x65\0\x74\x61\x73\x6b\x5f\x73\x69\x7a\x65\0\x68\x69\x67\x68\x65\
\x73\x74\x5f\x76\x6d\x5f\x65\x6e\x64\0\x70\x67\x64\0\x6d\x65\x6d\x62\x61\x72\
\x72\x69\x65\x72\x5f\x73\x74\x61\x74\x65\0\x6d\x6d\x5f\x75\x73\x65\x72\x73\0\
\x6d\x6d\x5f\x63\x6f\x75\x6e\x74\0\x70\x67\x74\x61\x62\x6c\x65\x73\x5f\x62\x79\
\x74\x65\x73\0\x6d\x61\x70\x5f\x63\x6f\x75\x6e\x74\0\x70\x61\x67\x65\x5f\x74\
\x61\x62\x6c\x65\x5f\x6c\x6f\x63\x6b\0\x6d\x6d\x61\x70\x5f\x6c\x6f\x63\x6b\0\
\x6d\x6d\x6c\x69\x73\x74\0\x68\x69\x77\x61\x74\x65\x72\x5f\x72\x73\x73\0\x68\
\x69\x77\x61\x74\x65\x72\x5f\x76\x6d\0\x74\x6f\x74\x61\x6c\x5f\x76\x6d\0\x6c\
\x6f\x63\x6b\x65\x64\x5f\x76\x6d\0\x70\x69\x6e\x6e\x65\x64\x5f\x76\x6d\0\x64\
\x61\x74\x61\x5f\x76\x6d\0\x65\x78\x65\x63\x5f\x76\x6d\0\x73\x74\x61\x63\x6b\
\x5f\x76\x6d\0\x64\x65\x66\x5f\x66\x6c\x61\x67\x73\0\x77\x72\x69\x74\x65\x5f\
\x70\x72\x6f\x74\x65\x63\x74\x5f\x73\x65\x71\0\x61\x72\x67\x5f\x6c\x6f\x63\x6b\
\0\x73\x74\x61\x72\x74\x5f\x63\x6f\x64\x65\0\x65\x6e\x64\x5f\x63\x6f\x64\x65\0\
\x73\x74\x61\x72\x74\x5f\x64\x61\x74\x61\0\x65\x6e\x64\x5f\x64\x61\x74\x61\0\
\x73\x74\x61\x72\x74\x5f\x62\x72\x6b\0\x62\x72\x6b\0\x73\x74\x61\x72\x74\x5f\
\x73\x74\x61\x63\x6b\0\x61\x72\x67\x5f\x73\x74\x61\x72\x74\0\x61\x72\x67\x5f\
\x65\x6e\x64\0\x65\x6e\x76\x5f\x73\x74\x61\x72\x74\0\x65\x6e\x76\x5f\x65\x6e\
\x64\0\x73\x61\x76\x65\x64\x5f\x61\x75\x78\x76\0\x72\x73\x73\x5f\x73\x74\x61\
\x74\0\x62\x69\x6e\x66\x6d\x74\0\x63\x6f\x6e\x74\x65\x78\x74\0\x66\x6c\x61\x67\
\x73\0\x63\x6f\x72\x65\x5f\x73\x74\x61\x74\x65\0\x69\x6f\x63\x74\x78\x5f\x6c\
\x6f\x63\x6b\0\x69\x6f\x63\x74\x78\x5f\x74\x61\x62\x6c\x65\0\x6f\x77\x6e\x65\
\x72\0\x75\x73\x65\x72\x5f\x6e\x73\0\x65\x78\x65\x5f\x66\x69\x6c\x65\0\x6e\x6f\
\x74\x69\x66\x69\x65\x72\x5f\x73\x75\x62\x73\x63\x72\x69\x70\x74\x69\x6f\x6e\
\x73\0\x6e\x75\x6d\x61\x5f\x6e\x65\x78\x74\x5f\x73\x63\x61\x6e\0\x6e\x75\x6d\
\x61\x5f\x73\x63\x61\x6e\x5f\x6f\x66\x66\x73\x65\x74\0\x6e\x75\x6d\x61\x5f\x73\
\x63\x61\x6e\x5f\x73\x65\x71\0\x74\x6c\x62\x5f\x66\x6c\x75\x73\x68\x5f\x70\x65\
\x6e\x64\x69\x6e\x67\0\x74\x6c\x62\x5f\x66\x6c\x75\x73\x68\x5f\x62\x61\x74\x63\
\x68\x65\x64\0\x75\x70\x72\x6f\x62\x65\x73\x5f\x73\x74\x61\x74\x65\0\x68\x75\
\x67\x65\x74\x6c\x62\x5f\x75\x73\x61\x67\x65\0\x61\x73\x79\x6e\x63\x5f\x70\x75\
\x74\x5f\x77\x6f\x72\x6b\0\x70\x61\x73\x69\x64\0\x72\x62\x5f\x72\x6f\x6f\x74\0\
\x75\x36\x34\0\x5f\x5f\x75\x36\x34\0\x70\x67\x64\x5f\x74\0\x61\x74\x6f\x6d\x69\
\x63\x5f\x74\0\x73\x70\x69\x6e\x6c\x6f\x63\x6b\x5f\x74\0\x73\x70\x69\x6e\x6c\
\x6f\x63\x6b\0\x72\x6c\x6f\x63\x6b\0\x72\x61\x77\x5f\x73\x70\x69\x6e\x6c\x6f\
\x63\x6b\0\x72\x61\x77\x5f\x6c\x6f\x63\x6b\0\x61\x72\x63\x68\x5f\x73\x70\x69\
\x6e\x6c\x6f\x63\x6b\x5f\x74\0\x71\x73\x70\x69\x6e\x6c\x6f\x63\x6b\0\x76\x61\
\x6c\0\x6c\x6f\x63\x6b\x65\x64\0\x70\x65\x6e\x64\x69\x6e\x67\0\x75\x38\0\x5f\
\x5f\x75\x38\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x63\x68\x61\x72\0\x6c\x6f\
\x63\x6b\x65\x64\x5f\x70\x65\x6e\x64\x69\x6e\x67\0\x74\x61\x69\x6c\0\x75\x31\
\x36\0\x5f\x5f\x75\x31\x36\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\x73\x68\x6f\
\x72\x74\0\x72\x77\x5f\x73\x65\x6d\x61\x70\x68\x6f\x72\x65\0\x63\x6f\x75\x6e\
\x74\0\x6f\x73\x71\0\x77\x61\x69\x74\x5f\x6c\x6f\x63\x6b\0\x77\x61\x69\x74\x5f\
\x6c\x69\x73\x74\0\x6f\x70\x74\x69\x6d\x69\x73\x74\x69\x63\x5f\x73\x70\x69\x6e\
\x5f\x71\x75\x65\x75\x65\0\x72\x61\x77\x5f\x73\x70\x69\x6e\x6c\x6f\x63\x6b\x5f\
\x74\0\x73\x65\x71\x63\x6f\x75\x6e\x74\x5f\x74\0\x73\x65\x71\x63\x6f\x75\x6e\
\x74\0\x73\x65\x71\x75\x65\x6e\x63\x65\0\x75\x6e\x73\x69\x67\x6e\x65\x64\x20\
\x69\x6e\x74\0\x5f\x5f\x41\x52\x52\x41\x59\x5f\x53\x49\x5a\x45\x5f\x54\x59\x50\
\x45\x5f\x5f\0\x6d\x6d\x5f\x72\x73\x73\x5f\x73\x74\x61\x74\0\x6d\x6d\x5f\x63\
\x6f\x6e\x74\x65\x78\x74\x5f\x74\0\x63\x74\x78\x5f\x69\x64\0\x74\x6c\x62\x5f\
\x67\x65\x6e\0\x6c\x64\x74\x5f\x75\x73\x72\x5f\x73\x65\x6d\0\x6c\x64\x74\0\x6c\
\x6f\x63\x6b\0\x76\x64\x73\x6f\0\x76\x64\x73\x6f\x5f\x69\x6d\x61\x67\x65\0\x70\
\x65\x72\x66\x5f\x72\x64\x70\x6d\x63\x5f\x61\x6c\x6c\x6f\x77\x65\x64\0\x70\x6b\
\x65\x79\x5f\x61\x6c\x6c\x6f\x63\x61\x74\x69\x6f\x6e\x5f\x6d\x61\x70\0\x65\x78\
\x65\x63\x75\x74\x65\x5f\x6f\x6e\x6c\x79\x5f\x70\x6b\x65\x79\0\x6d\x75\x74\x65\
\x78\0\x73\x31\x36\0\x5f\x5f\x73\x31\x36\0\x73\x68\x6f\x72\x74\0\x62\x6f\x6f\
\x6c\0\x5f\x42\x6f\x6f\x6c\0\x78\x6f\x6c\x5f\x61\x72\x65\x61\0\x77\x6f\x72\x6b\
\x5f\x73\x74\x72\x75\x63\x74\0\x64\x61\x74\x61\0\x65\x6e\x74\x72\x79\0\x66\x75\
\x6e\x63\0\x77\x6f\x72\x6b\x5f\x66\x75\x6e\x63\x5f\x74\0\x75\x33\x32\0\x5f\x5f\
\x75\x33\x32\0\x30\x3a\x30\x3a\x33\x36\0\x30\x3a\x30\0\x30\x3a\x31\0\x09\x09\
\x20\x20\x20\x20\x76\x6d\x61\x2d\x3e\x76\x6d\x5f\x65\x6e\x64\x20\x3e\x3d\x20\
\x76\x6d\x61\x2d\x3e\x76\x6d\x5f\x6d\x6d\x2d\x3e\x73\x74\x61\x72\x74\x5f\x73\
\x74\x61\x63\x6b\x29\x3b\0\x09\x69\x66\x20\x28\x69\x73\x5f\x73\x74\x61\x63\x6b\
\x20\x26\x26\x20\x6d\x6f\x6e\x69\x74\x6f\x72\x65\x64\x5f\x70\x69\x64\x20\x3d\
\x3d\x20\x70\x69\x64\x29\x20\x7b\0\x09\x09\x6d\x70\x72\x6f\x74\x65\x63\x74\x5f\
\x63\x6f\x75\x6e\x74\x2b\x2b\x3b\0\x09\x09\x62\x70\x66\x5f\x70\x72\x69\x6e\x74\
\x6b\x28\x22\x63\x75\x72\x72\x65\x6e\x74\x20\x6d\x70\x72\x6f\x74\x65\x63\x74\
\x5f\x63\x6f\x75\x6e\x74\x20\x3d\x20\x25\x64\x5c\x6e\x22\x2c\x20\x6d\x70\x72\
\x6f\x74\x65\x63\x74\x5f\x63\x6f\x75\x6e\x74\x29\x3b\0\x09\x62\x70\x66\x5f\x70\
\x72\x69\x6e\x74\x6b\x28\x22\x63\x75\x72\x72\x65\x6e\x74\x20\x70\x69\x64\x20\
\x3d\x20\x25\x64\x5c\x6e\x22\x2c\x20\x70\x69\x64\x29\x3b\0\x63\x68\x61\x72\0\
\x5f\x6c\x69\x63\x65\x6e\x73\x65\0\x6d\x6f\x6e\x69\x74\x6f\x72\x65\x64\x5f\x70\
\x69\x64\0\x6d\x70\x72\x6f\x74\x65\x63\x74\x5f\x63\x6f\x75\x6e\x74\0\x5f\x5f\
\x5f\x5f\x74\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\x6f\x6f\x6b\x2e\x5f\x5f\x5f\
\x5f\x66\x6d\x74\0\x5f\x5f\x5f\x5f\x74\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\x6f\
\x6f\x6b\x2e\x5f\x5f\x5f\x5f\x66\x6d\x74\x2e\x31\0\x2e\x62\x73\x73\0\x2e\x72\
\x6f\x64\x61\x74\x61\0\x6c\x69\x63\x65\x6e\x73\x65\0\x66\x69\x6c\x65\0\x6b\x69\
\x6f\x63\x74\x78\x5f\x74\x61\x62\x6c\x65\0\x6c\x64\x74\x5f\x73\x74\x72\x75\x63\
\x74\0\x6c\x69\x6e\x75\x78\x5f\x62\x69\x6e\x66\x6d\x74\0\x6d\x65\x6d\x70\x6f\
\x6c\x69\x63\x79\0\x6d\x6d\x75\x5f\x6e\x6f\x74\x69\x66\x69\x65\x72\x5f\x73\x75\
\x62\x73\x63\x72\x69\x70\x74\x69\x6f\x6e\x73\0\x74\x61\x73\x6b\x5f\x73\x74\x72\
\x75\x63\x74\0\x75\x73\x65\x72\x5f\x6e\x61\x6d\x65\x73\x70\x61\x63\x65\0\x75\
\x73\x65\x72\x66\x61\x75\x6c\x74\x66\x64\x5f\x63\x74\x78\0\x76\x6d\x5f\x6f\x70\
\x65\x72\x61\x74\x69\x6f\x6e\x73\x5f\x73\x74\x72\x75\x63\x74\0\x9f\xeb\x01\0\
\x20\0\0\0\0\0\0\0\x14\0\0\0\x14\0\0\0\xfc\0\0\0\x10\x01\0\0\x4c\0\0\0\x08\0\0\
\0\x2e\0\0\0\x01\0\0\0\0\0\0\0\x05\0\0\0\x10\0\0\0\x2e\0\0\0\x0f\0\0\0\0\0\0\0\
\x40\0\0\0\x68\0\0\0\x05\x50\0\0\x20\0\0\0\x40\0\0\0\xa0\0\0\0\x06\x64\0\0\x28\
\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\0\x30\0\0\0\x40\0\0\0\xaf\0\0\0\x0e\x70\0\0\x40\
\0\0\0\x40\0\0\0\x7d\x02\0\0\x24\x7c\0\0\x50\0\0\0\x40\0\0\0\xaf\0\0\0\x29\x70\
\0\0\x58\0\0\0\x40\0\0\0\x7d\x02\0\0\x2b\x7c\0\0\x60\0\0\0\x40\0\0\0\x7d\x02\0\
\0\x13\x7c\0\0\x68\0\0\0\x40\0\0\0\x7d\x02\0\0\x37\x7c\0\0\x70\0\0\0\x40\0\0\0\
\xca\x07\0\0\x0c\x80\0\0\x78\0\0\0\x40\0\0\0\xf9\x07\0\0\x0f\x88\0\0\xa0\0\0\0\
\x40\0\0\0\x22\x08\0\0\x11\x8c\0\0\xc8\0\0\0\x40\0\0\0\x36\x08\0\0\x03\x90\0\0\
\xf8\0\0\0\x40\0\0\0\x75\x08\0\0\x02\x9c\0\0\x20\x01\0\0\x40\0\0\0\x68\0\0\0\
\x05\x50\0\0\x10\0\0\0\x2e\0\0\0\x04\0\0\0\x40\0\0\0\x06\0\0\0\x79\x02\0\0\0\0\
\0\0\x58\0\0\0\x20\0\0\0\xbb\x07\0\0\0\0\0\0\x60\0\0\0\x06\0\0\0\xc2\x07\0\0\0\
\0\0\0\x70\0\0\0\x06\0\0\0\xc6\x07\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x8b\0\0\0\x04\0\xf1\xff\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\xbd\0\0\0\0\0\x02\0\xf8\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xb6\0\0\0\0\0\
\x02\0\x20\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x23\0\0\0\x01\0\x05\0\0\0\0\0\0\0\0\
\0\x1d\0\0\0\0\0\0\0\xc4\0\0\0\x01\0\x05\0\x1d\0\0\0\0\0\0\0\x12\0\0\0\0\0\0\0\
\0\0\0\0\x03\0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x03\0\x05\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\0\0\0\x11\0\x03\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\
\0\0\x7d\0\0\0\x11\0\x04\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\x14\0\0\0\x11\0\
\x04\0\x04\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\x58\0\0\0\x12\0\x02\0\0\0\0\0\0\0\0\
\0\x30\x01\0\0\0\0\0\0\x80\0\0\0\0\0\0\0\x01\0\0\0\x09\0\0\0\xa0\0\0\0\0\0\0\0\
\x01\0\0\0\x0a\0\0\0\xc8\0\0\0\0\0\0\0\x01\0\0\0\x07\0\0\0\xf8\0\0\0\0\0\0\0\
\x01\0\0\0\x07\0\0\0\x10\x0c\0\0\0\0\0\0\0\0\0\0\x09\0\0\0\x1c\x0c\0\0\0\0\0\0\
\0\0\0\0\x0a\0\0\0\x34\x0c\0\0\0\0\0\0\x0a\0\0\0\x07\0\0\0\x40\x0c\0\0\0\0\0\0\
\x0a\0\0\0\x07\0\0\0\x58\x0c\0\0\0\0\0\0\0\0\0\0\x08\0\0\0\x2c\0\0\0\0\0\0\0\0\
\0\0\0\x06\0\0\0\x40\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x50\0\0\0\0\0\0\0\0\0\0\0\
\x06\0\0\0\x60\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x70\0\0\0\0\0\0\0\0\0\0\0\x06\0\
\0\0\x80\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x90\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\
\xa0\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\xb0\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\xc0\0\
\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\xd0\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\xe0\0\0\0\0\
\0\0\0\0\0\0\0\x06\0\0\0\xf0\0\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\0\x01\0\0\0\0\0\0\
\0\0\0\0\x06\0\0\0\x10\x01\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x20\x01\0\0\0\0\0\0\0\
\0\0\0\x06\0\0\0\x3c\x01\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x4c\x01\0\0\0\0\0\0\0\0\
\0\0\x06\0\0\0\x5c\x01\0\0\0\0\0\0\0\0\0\0\x06\0\0\0\x6c\x01\0\0\0\0\0\0\0\0\0\
\0\x06\0\0\0\xe5\x64\xe2\x64\xd9\x64\xda\x64\0\x2e\x74\x65\x78\x74\0\x2e\x72\
\x65\x6c\x2e\x42\x54\x46\x2e\x65\x78\x74\0\x6d\x70\x72\x6f\x74\x65\x63\x74\x5f\
\x63\x6f\x75\x6e\x74\0\x5f\x5f\x5f\x5f\x74\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\
\x6f\x6f\x6b\x2e\x5f\x5f\x5f\x5f\x66\x6d\x74\0\x2e\x72\x65\x6c\x6c\x73\x6d\x2f\
\x66\x69\x6c\x65\x5f\x6d\x70\x72\x6f\x74\x65\x63\x74\0\x2e\x62\x73\x73\0\x74\
\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\x6f\x6f\x6b\0\x2e\x6c\x6c\x76\x6d\x5f\x61\
\x64\x64\x72\x73\x69\x67\0\x5f\x6c\x69\x63\x65\x6e\x73\x65\0\x6d\x6f\x6e\x69\
\x74\x6f\x72\x65\x64\x5f\x70\x69\x64\0\x6c\x73\x6d\x2e\x62\x70\x66\x2e\x63\0\
\x2e\x73\x74\x72\x74\x61\x62\0\x2e\x73\x79\x6d\x74\x61\x62\0\x2e\x72\x6f\x64\
\x61\x74\x61\0\x2e\x72\x65\x6c\x2e\x42\x54\x46\0\x4c\x42\x42\x30\x5f\x36\0\x4c\
\x42\x42\x30\x5f\x35\0\x5f\x5f\x5f\x5f\x74\x65\x73\x74\x5f\x69\x6e\x74\x5f\x68\
\x6f\x6f\x6b\x2e\x5f\x5f\x5f\x5f\x66\x6d\x74\x2e\x31\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\x40\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\x41\0\0\0\x01\0\0\0\x06\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x40\0\0\0\0\0\0\
\0\x30\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x75\0\
\0\0\x01\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x70\x01\0\0\0\0\0\0\x04\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x53\0\0\0\x08\0\0\0\
\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x74\x01\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\0\x04\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xa5\0\0\0\x01\0\0\0\x02\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\x74\x01\0\0\0\0\0\0\x2f\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xb1\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\xa3\x01\0\0\0\0\0\0\xaa\x16\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\x0b\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x4d\x18\0\
\0\0\0\0\0\x7c\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\x9d\0\0\0\x02\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xd0\x19\0\0\0\0\0\0\x20\
\x01\0\0\0\0\0\0\x0d\0\0\0\x08\0\0\0\x08\0\0\0\0\0\0\0\x18\0\0\0\0\0\0\0\x3d\0\
\0\0\x09\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\xf0\x1a\0\0\0\0\0\0\x40\0\0\0\0\
\0\0\0\x08\0\0\0\x02\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\xad\0\0\0\x09\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x30\x1b\0\0\0\0\0\0\x50\0\0\0\0\0\0\0\x08\
\0\0\0\x06\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x07\0\0\0\x09\0\0\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0\0\0\x80\x1b\0\0\0\0\0\0\x40\x01\0\0\0\0\0\0\x08\0\0\0\
\x07\0\0\0\x08\0\0\0\0\0\0\0\x10\0\0\0\0\0\0\0\x66\0\0\0\x03\x4c\xff\x6f\0\0\0\
\x80\0\0\0\0\0\0\0\0\0\0\0\0\xc0\x1c\0\0\0\0\0\0\x08\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\x01\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x95\0\0\0\x03\0\0\0\0\0\0\0\0\0\0\0\0\0\
\0\0\0\0\0\0\xc8\x1c\0\0\0\0\0\0\xe0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\0\x01\0\0\0\0\
\0\0\0\0\0\0\0\0\0\0\0";
}

#ifdef __cplusplus
struct lsm_bpf *lsm_bpf::open(const struct bpf_object_open_opts *opts) { return lsm_bpf__open_opts(opts); }
struct lsm_bpf *lsm_bpf::open_and_load() { return lsm_bpf__open_and_load(); }
int lsm_bpf::load(struct lsm_bpf *skel) { return lsm_bpf__load(skel); }
int lsm_bpf::attach(struct lsm_bpf *skel) { return lsm_bpf__attach(skel); }
void lsm_bpf::detach(struct lsm_bpf *skel) { lsm_bpf__detach(skel); }
void lsm_bpf::destroy(struct lsm_bpf *skel) { lsm_bpf__destroy(skel); }
const void *lsm_bpf::elf_bytes(size_t *sz) { return lsm_bpf__elf_bytes(sz); }
#endif /* __cplusplus */

__attribute__((unused)) static void
lsm_bpf__assert(struct lsm_bpf *s __attribute__((unused)))
{
#ifdef __cplusplus
#define _Static_assert static_assert
#endif
	_Static_assert(sizeof(s->bss->monitored_pid) == 4, "unexpected size of 'monitored_pid'");
	_Static_assert(sizeof(s->bss->mprotect_count) == 4, "unexpected size of 'mprotect_count'");
#ifdef __cplusplus
#undef _Static_assert
#endif
}

#endif /* __LSM_BPF_SKEL_H__ */
