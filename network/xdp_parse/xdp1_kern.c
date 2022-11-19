/* Copyright (c) 2016 PLUMgrid
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of version 2 of the GNU General Public
 * License as published by the Free Software Foundation.
 */

#include "vmlinux.h"
#include <bpf_helpers.h>

#define htons(x)		__builtin_bswap16(x)
#define ETH_P_IP	    0x0800		/* Internet Protocol packet	*/


static int parse_ipv4(void *data, u64 nh_off, void *data_end)
{
	struct iphdr *iph = data + nh_off;

	if (iph + 1 > data_end)
		return 0;
	return iph->protocol;
}


SEC("xdp1")
int xdp_prog1(struct xdp_md *ctx)
{
	void *data_end = (void *)(long)ctx->data_end;
	void *data = (void *)(long)ctx->data;
	struct ethhdr *eth = data;

	u16 h_proto;
	u64 nh_off;
	u32 ipproto;

	char fmt[] = "IP protocol is:%u -> len is  %u:\n";
	unsigned int len = data_end - data;

	nh_off = sizeof(*eth);
	if (data + nh_off > data_end)
		return XDP_PASS;

	h_proto = eth->h_proto;

	if (h_proto == htons(ETH_P_IP))
		ipproto = parse_ipv4(data, nh_off, data_end);
	else
		ipproto = 0;

    bpf_trace_printk(fmt, sizeof(fmt),ipproto, len);
	
	return XDP_PASS;
}

char _license[] SEC("license") = "GPL";
