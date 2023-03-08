//#include <linux/skbuff.h>
#include "vmlinux.h"

#define ETH_HLEN	14		/* Total octets in header.	 */
#define NET_SKB_PAD	   32
#define NET_IP_ALIGN	2
/*
在需要对齐负载的架构上，网络要求IP头在四字节边界上对齐，以优化IP栈。对于普通的以太网
硬件，常数NET_IP_ALIGN被使用。在大多数架构上，这个常数的值是2，因为正常的以太网头是
14个字节，所以为了获得适当的对齐，需要DMA到一个可以表示为4*n+2的地址。一个值得注意的
例外是powerpc，它将NET_IP_ALIGN定义为0，因为DMA到未对齐的地址可能非常昂贵，与未对齐
的负载的成本相比相形见绌。
*/
#define GFP_KERNEL 0
#define ETH_P_IP	0x0800		/* Internet Protocol packet	*/
#define ETH_P_IPV6	0x86DD		/* IPv6 over bluebook		*/

#define skb_shinfo(SKB)	((struct skb_shared_info *)(skb_end_pointer(SKB)))

static struct sk_buff *build_test_skb(void)
{
	u32 headroom = NET_SKB_PAD + NET_IP_ALIGN + ETH_HLEN;
	struct sk_buff *skb[2];
	struct page *page[2];
	int i, data_size = 8;

	for (i = 0; i < 2; i++) {
		page[i] = alloc_page(GFP_KERNEL);
		if (!page[i]) {
			if (i == 0)
				goto err_page0;
			else
				goto err_page1;
		}

		/* this will set skb[i]->head_frag */
		skb[i] = dev_alloc_skb(headroom + data_size);
		if (!skb[i]) {
			if (i == 0)
				goto err_skb0;
			else
				goto err_skb1;
		}

		skb_reserve(skb[i], headroom);
		skb_put(skb[i], data_size);
		skb[i]->protocol = htons(ETH_P_IP);
		skb_reset_network_header(skb[i]);
		skb_set_mac_header(skb[i], -ETH_HLEN);

		skb_add_rx_frag(skb[i], 0, page[i], 0, 64, 64);
		// skb_headlen(skb[i]): 8, skb[i]->head_frag = 1
	}

	/* setup shinfo */
	skb_shinfo(skb[0])->gso_size = 1448;
	skb_shinfo(skb[0])->gso_type = SKB_GSO_TCPV4;
	skb_shinfo(skb[0])->gso_type |= SKB_GSO_DODGY;
	skb_shinfo(skb[0])->gso_segs = 0;
	skb_shinfo(skb[0])->frag_list = skb[1];
	skb_shinfo(skb[0])->hwtstamps.hwtstamp = 1000;

	/* adjust skb[0]'s len */
	skb[0]->len += skb[1]->len;
	skb[0]->data_len += skb[1]->data_len;
	skb[0]->truesize += skb[1]->truesize;

	return skb[0];

err_skb1:
	__free_page(page[1]);
err_page1:
	kfree_skb(skb[0]);
err_skb0:
	__free_page(page[0]);
err_page0:
	return 0;
}

static  struct sk_buff *build_test_skb_linear_no_head_frag(void)
{
	unsigned int alloc_size = 2000;
	unsigned int headroom = 102, doffset = 72, data_size = 1308;
	struct sk_buff *skb[2];
	int i;

	/* skbs linked in a frag_list, both with linear data, with head_frag=0
	 * (data allocated by kmalloc), both have tcp data of 1308 bytes
	 * (total payload is 2616 bytes).
	 * Data offset is 72 bytes (40 ipv6 hdr, 32 tcp hdr). Some headroom.
	 */
	for (i = 0; i < 2; i++) {
		skb[i] = alloc_skb(alloc_size, GFP_KERNEL);
		if (!skb[i]) {
			if (i == 0)
				goto err_skb0;
			else
				goto err_skb1;
		}

		skb[i]->protocol = htons(ETH_P_IPV6);
		skb_reserve(skb[i], headroom);
		skb_put(skb[i], doffset + data_size);
		skb_reset_network_header(skb[i]);
		if (i == 0)
			skb_reset_mac_header(skb[i]);
		else
			skb_set_mac_header(skb[i], -ETH_HLEN);
		__skb_pull(skb[i], doffset);
	}

	/* setup shinfo.
	 * mimic bpf_skb_proto_4_to_6, which resets gso_segs and assigns a
	 * reduced gso_size.
	 */
	skb_shinfo(skb[0])->gso_size = 1288;
	skb_shinfo(skb[0])->gso_type = SKB_GSO_TCPV6 | SKB_GSO_DODGY;
	skb_shinfo(skb[0])->gso_segs = 0;
	skb_shinfo(skb[0])->frag_list = skb[1];

	/* adjust skb[0]'s len */
	skb[0]->len += skb[1]->len;
	skb[0]->data_len += skb[1]->len;
	skb[0]->truesize += skb[1]->truesize;

	return skb[0];

err_skb1:
	kfree_skb(skb[0]);
err_skb0:
	return 0;
}

