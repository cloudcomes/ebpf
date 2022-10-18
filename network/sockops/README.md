# eBPF sockops samples

This repo contains samples for eBPF sockops programs.
Copy from kernel example: linux/tools/testing/selftests/bpf/progs/test_sockmap_kern.h


## Running the sample

### Build and load the eBPF programs

```shell
$ sudo ./load.sh
```

```shell
$ sudo bpftool prog show

305: sock_ops  name bpf_sockmap  tag 5792890316dbd318  gpl
	loaded_at 2022-10-15T16:13:47+0800  uid 0
	xlated 312B  jited 205B  memlock 4096B  map_ids 19,21
	btf_id 237

```

### Run the [iperf3](https://iperf.fr/) server

```shell
$ nc -l 10000 
```

### Run the [iperf3](https://iperf.fr/) client

```shell
echo "hello"|nc 127.0.0.1 10000
```

### Collect tracing

```shell
$ ./trace.sh

nc-168769  [000] d.s11 524025.500607: bpf_trace_printk: op is  5
,rport is 10000
,lport is -2033844224
```
You should see 4 events for socket establishment. If you don't see any events then the eBPF program is NOT attached properly.

### Unload the eBPF programs

```shell
$ sudo ./unload.sh
```
