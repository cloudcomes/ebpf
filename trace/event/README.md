## Profile

`profile` is an example written in Rust and C with BlazeSym. It
attaches to perf events, sampling on every processor periodically. It
shows addresses, symbols, file names, and line numbers of stacktraces.

```shell
$ sudo ./target/release/profile
COMM: swapper/6 (pid=0) @ CPU 6
Kernel:
  0 [<ffffffff81bdf010>] intel_idle+0x96
  1 [<ffffffff819959b0>] cpuidle_enter_state+0x80 /ro/source/drivers/cpuidle/cpuidle.c:238
  2 [<ffffffff81995cc9>] cpuidle_enter+0x29 /ro/source/drivers/cpuidle/cpuidle.c:353
  3 [<ffffffff810f8c0b>] do_idle+0x1bb /ro/source/kernel/sched/idle.c:243
  4 [<ffffffff810f8de9>] cpu_startup_entry+0x19 /ro/source/kernel/sched/idle.c:396
  5 [<ffffffff81044f46>] start_secondary+0x116 /ro/source/arch/x86/kernel/smpboot.c:272
  6 [<ffffffff810000f5>] secondary_startup_64_no_verify+0xb0 /ro/source/arch/x86/kernel/head_64.S:283
No Userspace Stack
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
