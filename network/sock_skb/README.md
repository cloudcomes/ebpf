# eBPF sock filter samples

This repo contains samples for eBPF sockops programs.
Copy from kernel example: linux/tools/testing/selftests/bpf/progs/test_sockmap_kern.h


## Running the sample

### Build skel

```shell
bpftool gen skeleton sockex1_kern.o > sockex1.skel.h
```

### Build and load the eBPF programs

```shell
$ make -f Makefile.user
$ make -f Makefile.kern
```


### Run the program

```shell
$ sockex1 
```


