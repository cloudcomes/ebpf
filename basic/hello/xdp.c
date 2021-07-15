#include <linux/bpf.h>
#include <bpf_helpers.h>

static int foo(void)
{
    return XDP_DROP;
}

SEC("prog")
int xdp_drop(struct xdp_md *ctx)
{ 
    return foo();
}

char __license[] SEC("license") = "GPL";
