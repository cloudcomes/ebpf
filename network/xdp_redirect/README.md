# eBPF xdp_redirect samples

This repo contains samples for eBPF sockops programs.
Copy from kernel example: linux/tools/testing/selftests/bpf/progs/test_xdp_redirect.c
linux/tools/testing/selftests/bpf/progs/xdp_dummy.c


## Running the sample

### Build and load the eBPF programs

```shell
$ make -f Makefile.dummy
$ make -f Makefile.kern
```

### Test 

```shell
$bash ./test.sh
$bash ./t.sh
```

