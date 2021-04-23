#include <linux/bpf.h>
#include <linux/if_link.h>
#include <assert.h>
#include <errno.h>
#include <signal.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/resource.h>
#include <arpa/inet.h>
#include <netinet/ether.h>
#include <unistd.h>
#include <time.h>
//#include "bpf_load.h"
#include <bpf.h>
//#include "bpf_util.h"
#include <libbpf.h>
static int ifindex = 1; // localhost interface ifindex
static __u32 xdp_flags = 0;


// unlink the xdp program and exit
static void int_exit(int sig) {
  printf("stopping\n");
  bpf_set_link_xdp_fd(ifindex, -1, xdp_flags);
  exit(0);
}

// An XDP program which filter packets for an IP address
// ./ip_u -i <ip>
int main(int argc, char **argv) {
  const char *optstr = "i:";
  char *filename="ip.o";
  char *ip_param = "127.0.0.1";
  int opt;
  int prog_fd,map_fd;
  struct bpf_object *obj;
  // maps key
  __u32 key = 0;
  struct bpf_prog_load_attr prog_load_attr = {
      		.prog_type	= BPF_PROG_TYPE_XDP,
      	};

  while ((opt = getopt(argc, argv, optstr)) != -1) {
    switch(opt)
      {
      case 'i':
        ip_param=optarg;
      break;
    }
  }

  // convert the ip string to __u32
  struct sockaddr_in sa_param;
  inet_pton(AF_INET, ip_param, &(sa_param.sin_addr));
  __u32 ip = sa_param.sin_addr.s_addr;
  printf("the ip to filter is %s/%u\n", ip_param, ip);

  // change limits
  struct rlimit r = {RLIM_INFINITY, RLIM_INFINITY};
  if (setrlimit(RLIMIT_MEMLOCK, &r)) {
    perror("setrlimit(RLIMIT_MEMLOCK, RLIM_INFINITY)");
    return 1;
  }

  // load the bpf kern file

  prog_load_attr.file = filename;
  if (bpf_prog_load_xattr(&prog_load_attr, &obj, &prog_fd))
		return 1;


  // add sig handlers
  signal(SIGINT, int_exit);
  signal(SIGTERM, int_exit);

  map_fd = bpf_object__find_map_fd_by_name(obj, "ip_map");
  	 if (map_fd < 0) {
  			printf("finding a max_pcktsz map in obj file failed\n");
  			return 1;
  	 }
  // set the first element of the first map to the ip passed as a parameter
  int result = bpf_map_update_elem(map_fd, &key, &ip, BPF_ANY);
  if (result != 0) {
    fprintf(stderr, "bpf_map_update_elem error %d %s \n", errno, strerror(errno));
    return 1;
  }

  // link the xdp program to the interface
  if (bpf_set_link_xdp_fd(ifindex, prog_fd, xdp_flags) < 0) {
    printf("link set xdp fd failed\n");
    return 1;
  }

  int i, j;

  // get the number of cpus
  unsigned int cpus = libbpf_num_possible_cpus();
  if (cpus < 0) {
     printf("Can't get # of possible cpus: %s", strerror(-cpus));
     exit(-1);
  }
  __u64 values[cpus];

  map_fd = bpf_object__find_map_fd_by_name(obj, "counter_map");
  	if (map_fd < 0) {
  		printf("finding a icmpcnt map in obj file failed\n");
  		return 1;
  	}

  // "infinite" loop
  for (i=0; i< 1000; i++) {
    // get the values of the second map into values.
    assert(bpf_map_lookup_elem(map_fd, &key, values) == 0);
    printf("%d\n", i);
    for (j=0; j < cpus; j++) {
      printf("cpu %d, value = %llu\n", j, values[j]);
    }
    printf("\n\n");
    sleep(2);
  }

  printf("end\n");
  // unlink the xdp program
  bpf_set_link_xdp_fd(ifindex, -1, xdp_flags);
  return 0;

}

