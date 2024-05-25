#include <linux/bpf.h>
#include <bpf_helpers.h>
static __attribute__((noinline)) __attribute__((section("prog")))int gfunc(int a, int b) {
    return a * b;
}

static __attribute__((noinline)) __attribute__((section("prog"))) int lfunc(int a, int b) {
    return a + b;
}
SEC("prog")
int test(int a, int b) {
    return gfunc(a, b) +  lfunc(a, b);
}
char __license[] SEC("license") = "GPL";
