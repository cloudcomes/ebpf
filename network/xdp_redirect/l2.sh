set -e
set -v

#第二步：Attach xdp program to the XDP event on the veth interface
ip -n ns2-222 link set veth22 xdpgeneric obj xdp_dummy.o sec xdp
