clang  -g -D__TARGET_ARCH_x86 -mlittle-endian -I../libbpf/src  -Wno-compare-distinct-pointer-types -O2 -target bpf -c test_tc_peer.c -o test_tc_peer.o -mcpu=v3

clang  -g -D__TARGET_ARCH_x86 -mlittle-endian -I../libbpf/src  -Wno-compare-distinct-pointer-types -O2 -target bpf -c test_tc_neigh_fib.c -o test_tc_neigh_fib.o -mcpu=v3

clang  -g -D__TARGET_ARCH_x86 -mlittle-endian -I../libbpf/src  -Wno-compare-distinct-pointer-types -O2 -target bpf -c test_tc_neigh.c -o test_tc_neigh.o -mcpu=v3 

./test_tc_redirect.sh
