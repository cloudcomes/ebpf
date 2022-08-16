//#include <linux/bpf.h>
#include "vmlinux.h"

#include "bpf_helpers.h"

struct syscalls_enter_open_args {
	unsigned long long unused;
	long syscall_nr;
	long filename_ptr;
	long flags;
	long mode;
};

SEC("tracepoint/syscalls/sys_enter_openat")
int bpf_sys(struct syscalls_enter_open_args *ctx)
{
	bpf_printk("Hello,this syscall NR is  %d\n",ctx->syscall_nr);
        return 0;
}
char _license[] SEC("license") = "GPL";
