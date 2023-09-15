#include "vmlinux.h"
#include <bpf_helpers.h>

SEC("xdp")
int xdp_dummy_prog(struct xdp_md *ctx)
{
	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
