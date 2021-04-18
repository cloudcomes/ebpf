# Schema

 Filter ARP 数据包.

ETHERNET 数据包的协议类型 TYPE 的值为 0x0806：ARP协议，即：ETHERTYPE_ARP，
    该值在 /usr/include/net/ethernet.h中有定义。ETHERNET 数据包的格式如下：

    |<------------ Ethernet Header ---------->|
    ------------------------------------------------------------
    |DST MAC ADDR |SRC MAC ADDR |    TYPE     | ARP 协议数据包 |
    ------------------------------------------------------------
    |<- 6 bytes ->|<- 6 bytes ->|<- 2 bytes ->|<-- 28 bytes -->|



###  Clone Project.
```
$ https://github.com/cloudcomes/ebpf.git
```

### Compile an XDP program using clang
```
$ clang -O2 -Wall -target bpf -c hello.c -o hello.o
```

### Loading of XDP BPF object files

```
$ ip link set dev enp0s3 xdp obj hello.o
```

### Test with traffic

```
$ arp -n
Address                  HWtype  HWaddress           Flags Mask            Iface
192.168.56.1             ether   0a:00:27:00:00:00   C                     enp0s8
10.0.2.2                         (incomplete)                              enp0s3

```
### Remove the existing XDP program from the interface

```
$ ip link set dev enp0s3 xdp off
```

### Test with traffic and unload
```
arp -n
Address                  HWtype  HWaddress           Flags Mask            Iface
192.168.56.1             ether   0a:00:27:00:00:00   C                     enp0s8
10.0.2.2                 ether   52:54:00:12:35:02   C                     enp0s3
```