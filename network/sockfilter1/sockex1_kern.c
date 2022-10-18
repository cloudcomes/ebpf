#include "vmlinux.h"
#include <bpf_helpers.h>

unsigned long long load_byte(void *skb,unsigned long long off) asm("llvm.bpf.load.byte");

#define ETH_HLEN	        14		/* Total octets in header.	 */

SEC("socket")
int bpf_prog1(struct __sk_buff *skb)
{
        int proto = load_byte(skb, ETH_HLEN + offsetof(struct iphdr, protocol));
        int size = ETH_HLEN + sizeof(struct iphdr);

        bpf_printk("Hello,proto is  %d\n",proto); 
        switch (proto) {
        case IPPROTO_UDP:
             size += sizeof(struct udphdr);
             break;
        case IPPROTO_ICMP:
             size += sizeof(struct udphdr) + 20;
             break;     
        default:
             size = 0;
             break;
        }
        bpf_printk("Hello,proto %u size is  %d\n",proto,size); 
        return size;
}
char _license[] SEC("license") = "GPL";
