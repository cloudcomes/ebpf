// SPDX-License-Identifier: GPL-2.0
//#include <test_progs.h>
#include "cgroup_helpers.h"
#include "udp_limit.skel.h"

#include <sys/types.h>
#include <sys/socket.h>
#include <unistd.h>  //close()

//static int duration;

int test__join_cgroup(const char *path)
{
	int fd;

	if (setup_cgroup_environment()) {
		fprintf(stderr,"Failed to setup cgroup environment\n");
		return -1;
	}

	fd = create_and_get_cgroup(path);
	if (fd < 0) {
		fprintf(stderr,"Failed to create cgroup '%s'\n",path);
		return fd;
	}

	if (join_cgroup(path)) {
		fprintf(stderr,"Failed to join cgroup '%s' \n",path);
		return -1;
	}

	return fd;
}

int main(int argc, char **argv)
{
	struct udp_limit_bpf *skel;
	int fd1 = -1, fd2 = -1;
	int cgroup_fd;

	cgroup_fd = test__join_cgroup("/udp_limit");
	if (cgroup_fd < 0) {
		fprintf(stderr,"Failed to join cgroup \n");
		goto close_cgroup_fd;
	}    

	skel = udp_limit_bpf__open_and_load();
	if (!skel) {
		fprintf(stderr, "Failed to open BPF skeleton\n");
		goto close_cgroup_fd;
	}	

	skel->links.sock = bpf_program__attach_cgroup(skel->progs.sock, cgroup_fd);
	if (libbpf_get_error(skel->links.sock)) {
		printf("ERROR: bpf_program__attach failed\n");
		skel->links.sock = NULL;
		goto close_skeleton;
	}	

	skel->links.sock_release = bpf_program__attach_cgroup(skel->progs.sock_release, cgroup_fd);
	if (libbpf_get_error(skel->links.sock_release)) {
		printf("ERROR: bpf_program__attach failed\n");
		skel->links.sock_release = NULL;
		goto close_skeleton;
	}

	/* BPF program enforces a single UDP socket per cgroup,
	 * verify that.
	 */
	fd1 = socket(AF_INET, SOCK_DGRAM, 0);
	if (fd1 < 0) {
		fprintf(stderr,"Failed to create socket 1 '%d' \n",fd1);
		goto close_skeleton;
	}  

	fd2 = socket(AF_INET, SOCK_DGRAM, 0);
	if (fd2 < 0) {
		fprintf(stderr,"Failed to create socket 2 '%d'\n",fd1);
		goto close_skeleton;
	} 	
	/* We can reopen again after close. */
	close(fd1);
	fd1 = -1;

	fd1 = socket(AF_INET, SOCK_DGRAM, 0);
	if (fd1 < 0) {
		fprintf(stderr,"Failed to create socket 3 '%d' again\n",fd1);
		goto close_skeleton;
	} 

	/* Make sure the program was invoked the expected
	 * number of times:
	 * - open fd1           - BPF_CGROUP_INET_SOCK_CREATE
	 * - attempt to openfd2 - BPF_CGROUP_INET_SOCK_CREATE
	 * - close fd1          - BPF_CGROUP_INET_SOCK_RELEASE
	 * - open fd1 again     - BPF_CGROUP_INET_SOCK_CREATE
	 */

	fprintf(stdout,"invocations is '%d'\n",skel->bss->invocations);
	
	//if (CHECK(skel->bss->invocations != 4, "bss-invocations",
	//	  "invocations=%d", skel->bss->invocations))
	//	goto close_skeleton;
    
    fprintf(stdout,"in_use is '%d'\n",skel->bss->in_use);

	/* We should still have a single socket in use */
	//if (CHECK(skel->bss->in_use != 1, "bss-in_use",
	//	  "in_use=%d", skel->bss->in_use))
	//	goto close_skeleton;

close_skeleton:
	if (fd1 >= 0)
		close(fd1);
	if (fd2 >= 0)
		close(fd2);
	udp_limit_bpf__destroy(skel);
close_cgroup_fd:
	close(cgroup_fd);
	return 0;
}
