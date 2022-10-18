#include "vmlinux.h"
#include <bpf_helpers.h>
#include <bpf_endian.h>

struct {
	__uint(type, BPF_MAP_TYPE_SOCKMAP);
	__uint(max_entries, 20);
	__uint(key_size, sizeof(int));
	__uint(value_size, sizeof(int));
} sock_map SEC(".maps");


SEC("sockops")
int bpf_sockmap(struct bpf_sock_ops *skops)
{
	__u32 lport, rport;
	int op, err = 0,  ret;

	op = (int) skops->op;

	switch (op) {
	case BPF_SOCK_OPS_PASSIVE_ESTABLISHED_CB:
		lport = skops->local_port;
		rport = skops->remote_port;

		if (lport == 10000) {
			ret = 1;
		err = bpf_sock_map_update(skops, &sock_map, &ret,
						  BPF_NOEXIST);

		bpf_printk("PASSIVE_ESTABLISHED op is  %d\n,rport is %d\n,lport is %d\n",op,lport,rport);				  
		
		}
		break;
	case BPF_SOCK_OPS_ACTIVE_ESTABLISHED_CB:
		lport = skops->local_port;
		rport = skops->remote_port;
		if (bpf_ntohl(rport) == 10001) {
			ret = 10;

		err = bpf_sock_map_update(skops, &sock_map, &ret,
						  BPF_NOEXIST);
		bpf_printk("ACTIVE_ESTABLISHED op is  %d\n,rport is %d\n,lport is %d\n",op,lport,rport);				  

		}
		break;
	default:
		break;
	}

	return 0;
}
char _license[] SEC("license") = "GPL";