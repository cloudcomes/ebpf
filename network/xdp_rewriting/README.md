# eBPF sockops samples

This repo contains samples for eBPF sockops programs.
Copy from kernel example: linux/samples/bpf/xdp1_kern.c


## Running the sample

### Build and load the eBPF programs

```shell
$ make -f Makefile.kern
```

```shell
$ip link set dev enp0s8 xdp obj xdp1-kern.o sec xdp1
```

### Test 

```shell
ping 192.168.56.112
```
```shell
cat /sys/kernel/debug/tracing/trace_pipe
```

### Unload the eBPF programs

```shell
$ bpftool net detach xdp dev enp0s8
```
