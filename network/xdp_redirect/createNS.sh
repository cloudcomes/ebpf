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

