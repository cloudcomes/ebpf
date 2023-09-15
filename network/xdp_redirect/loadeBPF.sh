set -e
set -v

#第二步：Attach xdp program to the XDP event on the veth interface
ip -n ns1-111 link set veth11 xdpgeneric obj xdp_dummy.o sec xdp
sleep 0.5
ip -n ns2-222 link set veth22 xdpgeneric obj xdp_dummy.o sec xdp
sleep 0.5
ip link set dev veth1 xdpgeneric obj xdp_redirect.o sec redirect_to_222
sleep 0.5
ip link set dev veth2 xdpgeneric obj xdp_redirect.o sec redirect_to_111

