cmd_/root/cloud/ebpf/kernel/driver/modules.order := {   echo /root/cloud/ebpf/kernel/driver/test_bpf.ko; :; } | awk '!x[$$0]++' - > /root/cloud/ebpf/kernel/driver/modules.order
