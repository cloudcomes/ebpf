#!/bin/bash
set -x

# UnLoad the bpf_sockops program
sudo bpftool cgroup detach "/sys/fs/cgroup/unified/" sock_ops pinned "/sys/fs/bpf/bpf_sockop"
sudo rm "/sys/fs/bpf/bpf_sockop"

# Delete the map
sudo rm "/sys/fs/bpf/sock_ops_map"

# clean 
make -f Makefile.kern clean