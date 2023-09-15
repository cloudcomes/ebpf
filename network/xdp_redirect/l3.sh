set -e
set -v

#第二步：Attach xdp program to the XDP event on the veth interface
ip link set dev veth1 xdpgeneric obj xdp_redirect.o sec redirect_to_222
