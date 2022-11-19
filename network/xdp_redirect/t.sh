local xdpmode=xdpgeneric
setup
set -e
set -v
ip netns add ns1-111
ip netns add ns2-222
ip link add veth1 index 111 type veth peer name veth11 netns ns1-111
ip link add veth2 index 222 type veth peer name veth22 netns ns2-222
ip link set veth1 up
ip link set veth2 up
ip -n ns1-111 link set dev veth11 up
ip -n ns2-222 link set dev veth22 up
ip -n ns1-111 addr add 10.1.1.11/24 dev veth11
ip -n ns2-222 addr add 10.1.1.22/24 dev veth22
ip link set dev veth1 xdpgeneric off

ip -n ns1-111 link set veth11 xdpgeneric obj xdp_dummy.o sec xdp
ip -n ns2-222 link set veth22 xdpgeneric obj xdp_dummy.o sec xdp
ip link set dev veth1 xdpgeneric obj xdp_redirect.o sec redirect_to_222
ip link set dev veth2 xdpgeneric obj xdp_redirect.o sec redirect_to_111
ip netns exec ns1-111 ping -c 1 10.1.1.22
ip netns exec ns2-222 ping -c 1 10.1.1.11
echo 'selftests: test_xdp_redirect xdpgeneric [PASS]'
selftests: test_xdp_redirect xdpgeneric [PASS]

ip link del veth1
ip link del veth2
ip netns del ns1-111
ip netns del ns2-222