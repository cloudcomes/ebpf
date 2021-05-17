#include <linux/bpf.h>

#define SEC(NAME) __attribute__((section(NAME), used))

static char _license[] SEC("license") = "GPL";

SEC("prog")
int xdp_prog1(struct xdp_md *xdp)
{
  unsigned char *data;
  data = (void *)(unsigned long)xdp->data;
  if (data + 14 > (void *)(long)xdp->data_end)
     return XDP_ABORTED;
 // if (data[12] != 0x22 || data[13] != 0x22)
  if (data[12] == 0x08 || data[13] == 0x06)
     return XDP_DROP;
  return XDP_PASS;
}

