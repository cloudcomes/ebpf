#!/bin/bash
set -x
set -e

# Mount bpf filesystem
sudo mount -t bpf bpf /sys/fs/bpf/

# Compile the bpf_sockops program
make -f Makefile.kern

# Load the bpf_sockops program
sudo bpftool prog load bpf_sockops.o "/sys/fs/bpf/bpf_sockop"
sudo bpftool cgroup attach "/sys/fs/cgroup/unified/" sock_ops pinned "/sys/fs/bpf/bpf_sockop"

MAP_ID=$(sudo bpftool prog show pinned "/sys/fs/bpf/bpf_sockop" | grep -o -E 'map_ids [0-9]+' | awk '{print $2}')
sudo bpftool map pin id $MAP_ID "/sys/fs/bpf/sock_ops_map"


