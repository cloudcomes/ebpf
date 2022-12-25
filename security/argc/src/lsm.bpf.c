// SPDX-License-Identifier: GPL-2.0

/*
 * Copyright 2020 Google LLC.
 */

#include "vmlinux.h"
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_tracing.h>
#include <errno.h>
#include "common.h"

struct {
	__uint(type, BPF_MAP_TYPE_RINGBUF);
	__uint(max_entries, 256 * 1024 /* 256 KB */);
} buffer SEC(".maps");

static inline void log_process_name(const struct linux_binprm *bprm)
{
	
	struct event *event;
	/* reserve sample from BPF ringbuf */
	event = bpf_ringbuf_reserve(&buffer, sizeof(*event), 0);
	//struct event *event = bpf_ringbuf_reserve(&buffer, sizeof(struct event), 0);

	if (event) {
		event->pid = bpf_get_current_pid_tgid() >> 32;
		bpf_printk("current pid = %d\n", event->pid);
		bpf_get_current_comm(&event->comm, sizeof(event->comm));
		bpf_probe_read_str(&event->filename, sizeof(event->filename),bprm->filename);
		bpf_ringbuf_submit(event, 0);
	}
}


SEC("lsm/bprm_check_security")
int BPF_PROG(check_argc0, struct linux_binprm *bprm)
{
    bpf_printk("argc is  = %d\n", bprm->argc);
	bpf_printk("current filename is = %s\n", bprm->filename);
	if (bprm->argc == 1) {
	  log_process_name(bprm);
	}

	return 0;
}

char _license[] SEC("license") = "Dual BSD/GPL";
