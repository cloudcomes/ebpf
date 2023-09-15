set -e
set -v
#第三步：发送数据包，触发xdp程序的运行
ip netns exec ns1-111 ping -c 1 10.1.1.22
ip netns exec ns2-222 ping -c 1 10.1.1.11
