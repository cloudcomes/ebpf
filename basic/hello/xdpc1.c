#include <linux/bpf.h>
#include <bpf_helpers.h>
int a = 0;
SEC("prog")
int xdp_drop(struct xdp_md *ctx)
{ 
    a=10; 
    a=a+10;
    return a;
}
char __license[] SEC("license") = "GPL";
