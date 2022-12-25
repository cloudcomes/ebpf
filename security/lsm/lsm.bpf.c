// SPDX-License-Identifier: GPL-2.0

/*
 * Copyright 2020 Google LLC.
 */

#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>
#include  <errno.h>


char _license[] SEC("license") = "GPL";

int monitored_pid = 0;
int mprotect_count = 0;


SEC("lsm/file_mprotect")
int BPF_PROG(test_int_hook, struct vm_area_struct *vma,
	     unsigned long reqprot, unsigned long prot, int ret)
{
	/* ret is the return value from the previous BPF program
    * or 0 if it's the first hook.*/
	if (ret != 0)
		return ret;

	__u32 pid = bpf_get_current_pid_tgid() >> 32;
	int is_stack = 0;

	is_stack = (vma->vm_start <= vma->vm_mm->start_stack &&
		    vma->vm_end >= vma->vm_mm->start_stack);

	if (is_stack && monitored_pid == pid) {
		mprotect_count++;
		bpf_printk("current mprotect_count = %d\n", mprotect_count);
		ret = -EPERM;
	}
	bpf_printk("current pid = %d\n", pid);

	return ret;
}
