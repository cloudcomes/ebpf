// SPDX-License-Identifier: GPL-2.0-only
/* Copyright (c) 2015 PLUMgrid, http://plumgrid.com
 */
#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <stdbool.h>
#include <string.h>
#include <time.h>


#include <bpf/bpf.h>
#include <bpf/libbpf.h>
#include "tracex4.skel.h"

struct pair {
	long long val;
	__u64 ip;
};

static __u64 time_get_ns(void)
{
	struct timespec ts;

	clock_gettime(CLOCK_MONOTONIC, &ts);
	return ts.tv_sec * 1000000000ull + ts.tv_nsec;
}

static void print_old_objects(int fd)
{
	long long val = time_get_ns();
	__u64 key, next_key;
	struct pair v;

	key = write(1, "\e[1;1H\e[2J", 11); /* clear screen */

	key = -1;
	while (bpf_map_get_next_key(fd, &key, &next_key) == 0) {
		bpf_map_lookup_elem(fd, &next_key, &v);
		key = next_key;
		if (val - v.val < 1000000000ll)
			/* object was allocated more then 1 sec ago */
			continue;
		printf("obj 0x%llx is %2lldsec old was allocated at ip %llx\n",
		       next_key, (val - v.val) / 1000000000ll, v.ip);
	}
}

int main(int ac, char **argv)
{
	//struct bpf_link *links[2];
	//struct bpf_program *prog;
	//struct bpf_object *obj;
	//char filename[256];
	int err;
	int map_fd;
	struct tracex4_bpf *obj;

	obj = tracex4_bpf__open();
	if (!obj) {
		fprintf(stderr, "failed to open BPF object\n");
		return 1;
	}

	/* load BPF program */
	err = tracex4_bpf__load(obj);
	if (err) {
		fprintf(stderr, "failed to load BPF skelect: %d\n", err);
		goto cleanup;
	}

    map_fd = bpf_map__fd(obj->maps.my_map);
    if (map_fd < 0) {
		fprintf(stderr, "ERROR: finding a map in obj file failed\n");
		goto cleanup;
	}

	err = tracex4_bpf__attach(obj);
	if (err) {
		fprintf(stderr, "failed to attach BPF programs: %s\n",
				strerror(-err));
		goto cleanup;
	}

	while (1) {
		print_old_objects(map_fd);
		sleep(1);
	}

cleanup:
	tracex4_bpf__destroy(obj);
	return 0;
}
