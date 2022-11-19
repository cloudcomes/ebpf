/* SPDX-License-Identifier: GPL-2.0
 *  Copyright(c) 2018 Jesper Dangaard Brouer.
 *
 * XDP/TC VLAN manipulation example
 *
 * GOTCHA: Remember to disable NIC hardware offloading of VLANs,
 * else the VLAN tags are NOT inlined in the packet payload:
 *
 *  # ethtool -K ixgbe2 rxvlan off
 *
 * Verify setting:
 *  # ethtool -k ixgbe2 | grep rx-vlan-offload
 *  rx-vlan-offload: off
 *
 */
//#include <stddef.h>
//#include <stdbool.h>
//#include <string.h>
//#include <linux/bpf.h>
//#include <linux/if_ether.h>
//#include <linux/if_vlan.h>
//#include <linux/in.h>
//#include <linux/pkt_cls.h>

#include "vmlinux.h"
#include <bpf_helpers.h>
#include <bpf_endian.h>


#define ETH_ALEN 6
#define ETH_P_802_3_MIN 0x0600
#define ETH_P_8021Q 0x8100
#define ETH_P_8021AD 0x88A8
#define ETH_P_IP 0x0800
#define ETH_P_IPV6 0x86DD
#define ETH_P_ARP 0x0806
#define IPPROTO_ICMPV6 58

//#define bpf_ntohs(x)		__builtin_bswap16(x)

#define VLAN_PRIO_MASK		0xe000 /* Priority Code Point */
#define VLAN_PRIO_SHIFT		13
#define VLAN_CFI_MASK		0x1000 /* Canonical Format Indicator */
#define VLAN_TAG_PRESENT	VLAN_CFI_MASK
#define VLAN_VID_MASK		0x0fff /* VLAN Identifier */
#define VLAN_N_VID		4096
#define VLAN_HDR_SZ	4	/* bytes */

# define TC_ACT_OK		0
/* Hint, VLANs are choosen to hit network-byte-order issues */
#define TESTVLAN 4011 /* 0xFAB */

/* linux/if_vlan.h have not exposed this as UAPI, thus mirror some here
 *
 *	struct vlan_hdr - vlan header
 *	@h_vlan_TCI: priority and VLAN ID
 *	@h_vlan_encapsulated_proto: packet type ID or len
 */
struct _vlan_hdr {
	__be16 h_vlan_TCI;
	__be16 h_vlan_encapsulated_proto;
};

struct parse_pkt {
	__u16 l3_proto;
	__u16 l3_offset;
	__u16 vlan_outer;
	__u16 vlan_inner;
	__u8  vlan_outer_offset;
	__u8  vlan_inner_offset;
};

char _license[] SEC("license") = "GPL";

static __always_inline
bool parse_eth_frame(struct ethhdr *eth, void *data_end, struct parse_pkt *pkt)
{
	__u16 eth_type;
	__u8 offset;

	offset = sizeof(*eth);
	/* Make sure packet is large enough for parsing eth + 2 VLAN headers */
	if ((void *)eth + offset + (2*sizeof(struct _vlan_hdr)) > data_end)
		return false;

	eth_type = eth->h_proto;

	/* Handle outer VLAN tag */
	if (eth_type == bpf_htons(ETH_P_8021Q)
	    || eth_type == bpf_htons(ETH_P_8021AD)) {
		struct _vlan_hdr *vlan_hdr;

		vlan_hdr = (void *)eth + offset;
		pkt->vlan_outer_offset = offset;
		pkt->vlan_outer = bpf_ntohs(vlan_hdr->h_vlan_TCI)
				& VLAN_VID_MASK;
		eth_type        = vlan_hdr->h_vlan_encapsulated_proto;
		offset += sizeof(*vlan_hdr);
	}

	/* Handle inner (double) VLAN tag */
	if (eth_type == bpf_htons(ETH_P_8021Q)
	    || eth_type == bpf_htons(ETH_P_8021AD)) {
		struct _vlan_hdr *vlan_hdr;

		vlan_hdr = (void *)eth + offset;
		pkt->vlan_inner_offset = offset;
		pkt->vlan_inner = bpf_ntohs(vlan_hdr->h_vlan_TCI)
				& VLAN_VID_MASK;
		eth_type        = vlan_hdr->h_vlan_encapsulated_proto;
		offset += sizeof(*vlan_hdr);
	}

	pkt->l3_proto = bpf_ntohs(eth_type); /* Convert to host-byte-order */
	pkt->l3_offset = offset;

	return true;
}

/* Changing VLAN to zero, have same practical effect as removing the VLAN. */
#define TO_VLAN	0

SEC("xdp_vlan_change")
int  xdp_prognum1(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data     = (void *)(long)ctx->data;
	struct parse_pkt pkt = { 0 };

	if (!parse_eth_frame(data, data_end, &pkt))
		return XDP_ABORTED;

	/* Change specific VLAN ID */
	if (pkt.vlan_outer == TESTVLAN) {
		struct _vlan_hdr *vlan_hdr = data + pkt.vlan_outer_offset;

		/* Modifying VLAN, preserve top 4 bits */
		vlan_hdr->h_vlan_TCI =
			bpf_htons((bpf_ntohs(vlan_hdr->h_vlan_TCI) & 0xf000)
				  | TO_VLAN);
	}

	return XDP_PASS;
}

/*=====================================
 *  BELOW: TC-hook based ebpf programs
 * ====================================
 * The TC-clsact eBPF programs (currently) need to be attach via TC commands
 */

SEC("tc_vlan_push")
int _tc_progA(struct __sk_buff *ctx)
{
	bpf_skb_vlan_push(ctx, bpf_htons(ETH_P_8021Q), TESTVLAN);

	return TC_ACT_OK;
}

