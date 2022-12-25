# eBPF sockops samples

tc (short for Traffic Control) is an example of handling ingress network traffics. 
It creates a qdisc on the lo interface and attaches the tc_ingress BPF program to it. 
It reports the metadata of the IP packets that coming into the lo interface.

```shell
$ sudo ./tc
...
Successfully started! Please run `sudo cat /sys/kernel/debug/tracing/trace_pipe` to see output of the BPF program.
......

```
The tc output in /sys/kernel/debug/tracing/trace_pipe should look something like this:
```shell
$ sudo cat /sys/kernel/debug/tracing/trace_pipe
            node-1254811 [007] ..s1 8737831.671074: 0: Got IP packet: tot_len: 79, ttl: 64
            sshd-1254728 [006] ..s1 8737831.674334: 0: Got IP packet: tot_len: 79, ttl: 64
            sshd-1254728 [006] ..s1 8737831.674349: 0: Got IP packet: tot_len: 72, ttl: 64
            node-1254811 [007] ..s1 8737831.674550: 0: Got IP packet: tot_len: 71, ttl: 64
```

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
