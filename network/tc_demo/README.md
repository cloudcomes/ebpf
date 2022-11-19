# eBPF sockops samples

This repo contains samples for eBPF sockops programs.
Copy from kernel example: linux/samples/bpf/xdp1_kern.c


## Running the sample

### Build and load the eBPF programs

```shell
$ make -f Makefile
```

```shell
$tc qdisc show dev enp0s3

```

### 加载TC BPF程序到容器的eth1网卡上
```shell
$tc qdisc add dev enp0s3 clsact
$tc filter add dev enp0s3 ingress bpf da obj tc_drop.o sec tc
$tc filter show dev enp0s3 egress

```


### Test 

```shell
nc 
```


### Unload the eBPF programs

```shell
$ tc qdisc del dev eth1 clsact
```
