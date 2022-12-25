// SPDX-License-Identifier: GPL-2.0

/*
 * Copyright (C) 2020 Google LLC.
 */


#include <sys/mman.h>
#include <sys/wait.h>
#include <unistd.h>
#include <malloc.h>
#include <stdlib.h>

#include "lsm.skel.h"

char *CMD_ARGS[] = {"true", NULL};

#define GET_PAGE_ADDR(ADDR, PAGE_SIZE)					\
	(char *)(((unsigned long) (ADDR + PAGE_SIZE)) & ~(PAGE_SIZE-1))

int stack_mprotect(void)
{
	void *buf;
	long sz;
	int ret;

	sz = sysconf(_SC_PAGESIZE);
	if (sz < 0)
		return sz;

	buf = alloca(sz * 3);
	ret = mprotect(GET_PAGE_ADDR(buf, sz), sz,
		       PROT_READ | PROT_WRITE | PROT_EXEC);
	return ret;
}

int exec_cmd(int *monitored_pid)
{
	int child_pid, child_status;

	child_pid = fork();
	if (child_pid == 0) {
		printf("Current child monitored_pid is %d \n",getpid());
		*monitored_pid = getpid();
		execvp(CMD_ARGS[0], CMD_ARGS);
		return -EINVAL;
	} else if (child_pid > 0) {
		waitpid(child_pid, &child_status, 0);
		return child_status;
	}

	return -EINVAL;
}

static int test_lsm(struct lsm_bpf *skel)
{
	//int buf = 1234;
	struct bpf_link *link;
	int err;

	err = lsm_bpf__attach(skel);
	if (err) {
		fprintf(stderr, "Failed to attach BPF skeleton\n");
	}

    /* Check that already linked program can't be attached again. */
	link = bpf_program__attach(skel->progs.test_int_hook);
    
	if (libbpf_get_error(link)) 
        {
		fprintf(stderr, "ERROR: bpf_program__attach link failed\n");
		link = NULL;
	}


    err = exec_cmd(&skel->bss->monitored_pid);
	if (err) {
		fprintf(stderr, "Failed to exe Task \n");
	}

    printf("Current monitored_pid is %d \n",getpid());
	skel->bss->monitored_pid = getpid();

	err = stack_mprotect();
	if (err) {
		fprintf(stderr, "Failed to run mprotect \n");
	}
    
	printf("skel->bss->mprotect_count is %d\n",skel->bss->mprotect_count);
	//printf("skel->bss->mprotect_count is %d and mprotect_count is %d\n",skel->bss->mprotect_count,mprotect_count);
	//ASSERT_EQ(skel->bss->mprotect_count, 1, "mprotect_count");

	lsm_bpf__detach(skel);
	bpf_link__destroy(link);

	skel->bss->mprotect_count = 0;
	return 0;
}

int main(void)
{
	struct lsm_bpf *skel = NULL;
	int err;

	skel = lsm_bpf__open_and_load();
	if (!skel) {
		fprintf(stderr, "Failed to open BPF skeleton\n");
		return 1;
	}

	err = test_lsm(skel);
	if (err) {
		fprintf(stderr, "Failed to run BPF skeleton\n");
		goto close_prog;

		}
	err = test_lsm(skel);
	if (err) {
		fprintf(stderr, "Failed to run BPF skeleton\n");
		goto close_prog;

		}

close_prog:
	lsm_bpf__destroy(skel);
	return 0;
}
