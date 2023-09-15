set -e
set -v

#第二步：Attach xdp program to the XDP event on the veth interface
ip -n ns1-111 link set veth11 xdpgeneric obj xdp_dummy.o sec xdp

