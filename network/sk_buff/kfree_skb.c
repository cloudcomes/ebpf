// SPDX-License-Identifier: GPL-2.0
#include <fcntl.h>  /*open*/
#include <unistd.h> /*read*/
#include <signal.h>
#include "kfree_skb.skel.h"

#define DEBUGFS "/sys/kernel/debug/tracing/"

void read_trace_pipe(void)
{
	int trace_fd;

	trace_fd = open(DEBUGFS "trace_pipe", O_RDONLY, 0);
	if (trace_fd < 0)
		return;

	while (1) {
		static char buf[4096];
		ssize_t sz;

		sz = read(trace_fd, buf, sizeof(buf) - 1);
		if (sz > 0) {
			buf[sz] = 0;
			puts(buf);
		}
	}
}

static volatile sig_atomic_t exiting = 0;

static void sig_int(int signo)
{
	exiting = 1;
}

int main(void)
{
	struct kfree_skb_bpf *skel = NULL;
	int err;

	skel = kfree_skb_bpf__open_and_load();
	if (!skel) {
		fprintf(stderr, "Failed to open BPF skeleton\n");
		return 1;
	}

	/* Attach tracepoint handler */
	err = kfree_skb_bpf__attach(skel);
	if (err) {
		fprintf(stderr, "Failed to attach BPF skeleton\n");
		goto cleanup;
	}

	/* make sure kfree_skb program was triggered
	 * and it sent expected skb into ring buffer
	 */
	if (signal(SIGINT, sig_int) == SIG_ERR) {
		err = errno;
		fprintf(stderr, "Can't set signal handler: %s\n", strerror(errno));
		goto cleanup;
	}	
	printf("Successfully started! Please run `sudo cat /sys/kernel/debug/tracing/trace_pipe` "
	       "to see output of the BPF program.\n");
	read_trace_pipe();	   

cleanup:
//	perf_buffer__free(pb);
//	bpf_object__close(obj);
	kfree_skb_bpf__destroy(skel);
	return 0;
}
