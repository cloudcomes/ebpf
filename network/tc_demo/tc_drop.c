#include "vmlinux.h"
#include <bpf_helpers.h>


#define ETH_P_IP      0x0800
#define IPPROTO_UDP		17
#define htons(x)		__builtin_bswap16(x)

#define TC_ACT_UNSPEC  	(-1)
#define TC_ACT_OK		      0
#define TC_ACT_RECLASSIFY	1
#define TC_ACT_SHOT		    2
#define TC_ACT_PIPE		    3
#define TC_ACT_STOLEN	   	4
#define TC_ACT_QUEUED		  5
#define TC_ACT_REPEAT		  6
#define TC_ACT_REDIRECT		7


/*
  check whether the packet is of UDP protocol and its port is 1314
*/
static bool is_udp(struct __sk_buff *skb){
  void *data = (void *)(long)skb->data;
  void *data_end = (void *)(long)skb->data_end;

	struct udphdr *udp_hdr;
	struct ethhdr *eth_hdr;
	struct iphdr *ip_hdr;

  eth_hdr = (struct ethhdr *)data;
  ip_hdr = (struct iphdr *)(data + sizeof(struct ethhdr));
  udp_hdr = (struct udphdr *)(data + sizeof(struct ethhdr) + sizeof(struct iphdr));

  if (udp_hdr + 1 > data_end)
		return false;

  if (eth_hdr->h_proto != htons(ETH_P_IP))
	  return false;
  if (ip_hdr->protocol == IPPROTO_UDP)
	  return true;

  return false;
}

SEC("tc")
int tc_drop_udp(struct __sk_buff *skb)
{

  if (is_udp(skb)) 
    return TC_ACT_OK;

  return TC_ACT_SHOT;
}

char _license[] SEC("license") = "GPL";