// SPDX-License-Identifier: GPL-2.0
// Copyright (c) 2019 Facebook
#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>
#include <bpf/bpf_endian.h>
#include <bpf/bpf_tracing.h>

char _license[] SEC("license") = "GPL";

#define _(P) (__builtin_preserve_access_index(P))

struct net_device /* same as kernel's struct net_device */ {
	char name[16];
	int ifindex;
	struct dev_ifalias *ifalias;
	unsigned int mtu;
	unsigned int promiscuity;
	long unsigned int state;
};

struct sk_buff {
	/* field names and sizes should match to those in the kernel */
	unsigned int len, data_len;
	__u16 mac_len, hdr_len, queue_mapping;
	struct net_device *dev;
	/* order of the fields doesn't matter */
	//refcount_t users;
	unsigned char *data;
	char __pkt_type_offset[0];
	char cb[48];
};

SEC("fentry/eth_type_trans")
int BPF_PROG(fentry_eth_type_trans, struct sk_buff *skb, struct net_device *dev,
	     unsigned short protocol)
{
	int len, ifindex;
	unsigned int mtu;
	long unsigned int state;
	unsigned int promiscuity;
	char devname[16];

	__builtin_preserve_access_index(({
		len = skb->len;
		ifindex = dev->ifindex;
		mtu = dev->mtu;
		promiscuity = dev->promiscuity;
		state = dev->state;
		//devname = dev->name;
	}));

    bpf_probe_read(devname, sizeof(devname), dev->name);
	
	/* using bpf_trace_printk() for DEBUG ONLY */
  
    bpf_printk("dev name is %7s \n", devname);

    bpf_printk("dev MTU %d state %d promiscuity %d\n", mtu, state,promiscuity);

    /* fentry sees full packet including L2 header */
    bpf_printk("with L2 header:skb->len %d ifindex %d \n",len, ifindex);
	return 0;
}

SEC("fexit/eth_type_trans")
int BPF_PROG(fexit_eth_type_trans, struct sk_buff *skb, struct net_device *dev,
	     unsigned short protocol)
{
	int len, ifindex;

	__builtin_preserve_access_index(({
		len = skb->len;
		ifindex = dev->ifindex;
	}));

	/* fexit sees packet without L2 header that eth_type_trans should have
	 * consumed.
	 */
	//if (len != 60 || protocol != bpf_htons(0x86dd) || ifindex != 1)
	//	return 0;
	bpf_printk("without L2 header:skb->len %d ifindex %d \n",len, ifindex);
	return 0;
}
