#include <unistd.h>
#include <bpf.h>
#include "bpf_insn.h"
#include <error.h>
#include <errno.h>

#ifndef __NR_bpf
# if defined(__i386__)
#  define __NR_bpf 357
# elif defined(__x86_64__)
#  define __NR_bpf 321
# elif defined(__aarch64__)
#  define __NR_bpf 280
# elif defined(__sparc__)
#  define __NR_bpf 349
# elif defined(__s390__)
#  define __NR_bpf 351
# elif defined(__mips__) && defined(_ABIO32)
#  define __NR_bpf 4355
# elif defined(__mips__) && defined(_ABIN32)
#  define __NR_bpf 6319
# elif defined(__mips__) && defined(_ABI64)
#  define __NR_bpf 5315
# else
#  error __NR_bpf not defined. libbpf does not support your arch.
# endif
#endif


static int test_verifier(void)
{
    static char bpf_log_buf[65536];
    static const char bpf_license[] = "GPL";
    int bpf_fd;
    
    //invalid access __sk_buff local_ip4
    const struct bpf_insn prog[] = {
	   	BPF_LDX_MEM(BPF_W, BPF_REG_0, BPF_REG_1,
		    offsetof(struct __sk_buff, local_ip4)),
	    BPF_EXIT_INSN(),
	   };
    union bpf_attr attr;

    memset(&attr, 0, sizeof(attr));
    attr.prog_type = BPF_PROG_TYPE_CGROUP_SOCK;
    attr.insn_cnt = (__u32)(sizeof(prog) / sizeof(struct bpf_insn));
    attr.insns = (unsigned long) &prog;
    attr.license = (unsigned long) &bpf_license;
    attr.log_buf = (unsigned long) &bpf_log_buf;
    attr.log_size = sizeof(bpf_log_buf);
    attr.log_level = 2;
    attr.kern_version = 0;

    bpf_fd = syscall(__NR_bpf, BPF_PROG_LOAD, &attr, sizeof(attr));
	if (bpf_fd < 0)
		error(1, errno, "ebpf error. log:\n%s\n", bpf_log_buf);
    return bpf_fd;
}

int main(void)
{
	return test_verifier();
}
