// SPDX-License-Identifier: GPL-2.0
#include <stdio.h>
#include <assert.h>

#include <bpf/bpf.h>
#include "sock_example.h"
#include "sockex1.skel.h"

int main(int ac, char **argv)
{
	int map_fd, prog_fd;
	int i, sock;
	FILE *f;

	struct sockex1_bpf *skel;

    /* Load and verify BPF application */ 
    skel = sockex1_bpf__open_and_load();
	if (!skel) {
	  fprintf(stderr, "Failed to open and load eBPF skeleton\n");
	  goto cleanup;
	  return 1;
	}   
    
	prog_fd = bpf_program__fd(skel->progs.bpf_prog1);

    map_fd = bpf_map__fd(skel->maps.my_map);
    
	sock = open_raw_sock("lo");

	assert(setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog_fd,
			  sizeof(prog_fd)) == 0);

	f = popen("ping -4 -c5 localhost", "r");
	(void) f;

	for (i = 0; i < 5; i++) {
		long long tcp_cnt, udp_cnt, icmp_cnt;
		
		int key;

		key = IPPROTO_TCP;
		assert(bpf_map_lookup_elem(map_fd, &key, &tcp_cnt) == 0);

		key = IPPROTO_UDP;
		assert(bpf_map_lookup_elem(map_fd, &key, &udp_cnt) == 0);

		key = IPPROTO_ICMP;
		assert(bpf_map_lookup_elem(map_fd, &key, &icmp_cnt) == 0);

		printf("TCP %lld UDP %lld ICMP %lld bytes\n",
		       tcp_cnt, udp_cnt, icmp_cnt);
		sleep(1);
	}
    cleanup:
        fprintf(stdout,"1: detaching and unloading eBPF programs......\n"); 
	    sockex1_bpf__destroy(skel);
        
	return 0;
}
