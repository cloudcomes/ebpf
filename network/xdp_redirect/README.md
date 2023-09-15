## xdp_redirect sample

Copy from kernel example: 
 &emsp;linux/tools/testing/selftests/bpf/progs/test_xdp_redirect.c
 &emsp;linux/tools/testing/selftests/bpf/progs/xdp_dummy.c

### Test the the eBPF programs

#### &emsp; Build the eBPF programs

```shell
$ make -f Makefile.dummy
$ make -f Makefile
```

#### &emsp; Load & Run the eBPF programs

```shell
$ bash ./test.sh
```

