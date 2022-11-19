#!/bin/bash
# SPDX-License-Identifier: GPL-2.0
#
# This test installs a TC bpf program that throttles a TCP flow
# with dst port = 9000 down to 5MBps. Then it measures actual
# throughput of the flow.
#set -v
#set -x
if [[ $EUID -ne 0 ]]; then
	echo "This script must be run as root"
	echo "FAIL"
	exit 1
fi

# check that nc, dd, and timeout are present
command -v nc >/dev/null 2>&1 || \
	{ echo >&2 "nc is not available"; exit 1; }
command -v dd >/dev/null 2>&1 || \
	{ echo >&2 "nc is not available"; exit 1; }
command -v timeout >/dev/null 2>&1 || \
	{ echo >&2 "timeout is not available"; exit 1; }

readonly NS_SRC="ns-src-$(mktemp -u XXXXXX)"
readonly NS_DST="ns-dst-$(mktemp -u XXXXXX)"

readonly IP_SRC="172.16.1.100"
readonly IP_DST="172.16.2.100"

cleanup()
{
	ip netns del ${NS_SRC}
	ip netns del ${NS_DST}
}

trap cleanup EXIT

set -e  # exit on error

echo "1 Create two namespaces for testing............"

ip netns add "${NS_SRC}"
ip netns add "${NS_DST}"
ip link add veth_src type veth peer name veth_dst
ip link set veth_src netns ${NS_SRC}
ip link set veth_dst netns ${NS_DST}

ip -netns ${NS_SRC} addr add ${IP_SRC}/24  dev veth_src
ip -netns ${NS_DST} addr add ${IP_DST}/24  dev veth_dst

ip -netns ${NS_SRC} link set dev veth_src up
ip -netns ${NS_DST} link set dev veth_dst up

ip -netns ${NS_SRC} route add ${IP_DST}/32  dev veth_src
ip -netns ${NS_DST} route add ${IP_SRC}/32  dev veth_dst

echo "2 Set up TC on RX............................"
# set up TC on RX
#ip netns exec ${NS_DST} tc qdisc add dev veth_dst root fq
ip netns exec ${NS_DST} tc qdisc add dev veth_dst clsact 
ip netns exec ${NS_DST} tc filter add dev veth_dst ingress \
	bpf da obj tc_drop.o sec tc 


declare -ir TIMEOUT=20
STRING="abcdef"
################################
## UDP traffics is passed ######
################################

echo "3 Start testing UDP traffic............................"
# start the listener to test UDP
ip netns exec ${NS_DST} bash -c \
	"nc -4 -l ${IP_DST} 1314 -u>/dev/null &"
declare -i NC_PID=$!
sleep 1


# run the load, capture RX bytes on DST
declare -ir RX_BYTES_START=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

set +e
#ip netns exec ${NS_SRC} bash -c 'ping '${IP_DST}' -i 0.1 -c 3'
ip netns exec ${NS_SRC} bash -c "echo ${STRING}|nc -vu ${IP_DST} 1314  &"

set -e
sleep 3
declare -ir RX_BYTES_END=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

declare -ir ACTUAL_BYTE=$(( ($RX_BYTES_END - $RX_BYTES_START) ))

echo  $ACTUAL_BYTE | \
		awk '{printf "Bytes count:%d\n",$1}'


################################
## TCP traffics is droped     ##
################################

echo "4 Start testing TCP traffic............................"
# start the listener to test TCP
ip netns exec ${NS_DST} bash -c \
	"nc -4 -l ${IP_DST} 1314 >/dev/null &"
declare -i NC_PID2=$!

# run the load, capture RX bytes on DST
declare -ir RX_BYTES_START2=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

set +e
ip netns exec ${NS_SRC} bash -c "echo ${STRING}|nc -v ${IP_DST} 1314"

set -e

sleep 2
declare -ir RX_BYTES_END2=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

declare -ir ACTUAL_BYTE2=$(( ($RX_BYTES_END2 - $RX_BYTES_START2) ))

echo  $ACTUAL_BYTE2 | awk '{printf "Bytes count:%d\n",$1}'


########################################################
## After deleting qdisc ,TCP & ICMP traffics are fine ##
########################################################

echo "5 Start testing TCP and ICMP traffic without qdisc............................"
ip netns exec ${NS_DST} tc qdisc del dev veth_dst clsact

# start the listener
ip netns exec ${NS_DST} bash -c \
	"nc -4 -l ${IP_DST} 1314 >/dev/null &"


# run the load, capture RX bytes on DST
declare -ir RX_BYTES_START1=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

set +e
#ip netns exec ${NS_SRC} bash -c 'ping '${IP_DST}' -c 3'
ip netns exec ${NS_SRC} bash -c "echo ${STRING}|nc -v ${IP_DST} 1314 &"
#ip netns exec ${NS_SRC} bash -c "timeout ${TIMEOUT} dd if=/dev/zero \
#	bs=1000 count=1000000 > /dev/tcp/${IP_DST}/1314 2>/dev/null"
set -e

sleep 2
declare -ir RX_BYTES_END1=$( ip netns exec ${NS_DST} \
	cat /sys/class/net/veth_dst/statistics/rx_bytes )

declare -ir ACTUAL_BPS1=$(( ($RX_BYTES_END1 - $RX_BYTES_START1) ))

echo  $ACTUAL_BPS1 | \
	awk '{printf "Bytes count:%d\n",$1}'