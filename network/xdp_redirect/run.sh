set -e
set -v
#第一步：Create namespce and config ip.....
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
sleep 0.5

#第二步：Attach xdp program to the XDP event on the veth interface
ip -n ns1-111 link set veth11 xdpgeneric obj xdp_dummy.o sec xdp
sleep 0.5
ip -n ns2-222 link set veth22 xdpgeneric obj xdp_dummy.o sec xdp
sleep 0.5
ip link set dev veth1 xdpgeneric obj xdp_redirect.o sec redirect_to_222
sleep 0.5
ip link set dev veth2 xdpgeneric obj xdp_redirect.o sec redirect_to_111

sleep 0.5
#第三步：发送数据包，触发xdp程序的运行
ip netns exec ns1-111 ping -c 1 10.1.1.22
ip netns exec ns2-222 ping -c 1 10.1.1.11
