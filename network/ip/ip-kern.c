#include <linux/bpf.h>
#include <linux/if_ether.h>
#include <linux/if_packet.h>
#include <bpf_helpers.h>
#include <linux/ip.h>
#include <bpf_endian.h>
struct {
   __uint(type, BPF_MAP_TYPE_HASH);
   __type(key, __u32);
   __type(value,__u32);
   __uint(max_entries, 256);
} my_map SEC(".maps");



struct bpf_map_def SEC("maps") ip_map = {
	.type        = BPF_MAP_TYPE_HASH,
	.key_size    = sizeof(__u32),
	.value_size  = sizeof(__u32),
	.max_entries = 1,
};

struct bpf_map_def SEC("maps") counter_map = {
	.type        = BPF_MAP_TYPE_PERCPU_ARRAY,
	.key_size    = sizeof(__u32),
	.value_size  = sizeof(__u64),
	.max_entries = 1,
};

SEC("xdp_ip_filter")
int _xdp_ip_filter(struct xdp_md *ctx) {
  // key of the maps
  __u32 key = 0;
  // the ip to filter
  __u32 *ip;

  bpf_printk("starting xdp ip filter\n");

  // get the ip to filter from the ip_filtered map
  ip = bpf_map_lookup_elem(&ip_map, &key);
  if (!ip){
    return XDP_PASS;
  }

  bpf_printk("the ip address to filter is %u\n", ip);

  void *data_end = (void *)(long)ctx->data_end;
  void *data     = (void *)(long)ctx->data;
  struct ethhdr *eth = data;

  // check packet size
  if (eth + 1 > data_end) {
    return XDP_PASS;
  }

  // check if the packet is an IP packet
  if(bpf_ntohs(eth->h_proto) != ETH_P_IP) {
    return XDP_PASS;
  }

  // get the source address of the packet
  struct iphdr *iph = data + sizeof(struct ethhdr);
  if (iph + 1 > data_end) {
    return XDP_PASS;
  }
  __u32 ip_src = iph->saddr;
  bpf_printk("source ip address is %u\n", ip_src);

  // drop the packet if the ip source address is equal to ip
  if (ip_src == *ip) {
   // u64 *filtered_count;
    __u64 *counter;
    counter = bpf_map_lookup_elem(&counter_map, &key);
    if (counter) {
      *counter += 1;
    }
    return XDP_DROP;
  }
  return XDP_PASS;
}

char _license[] SEC("license") = "GPL";


