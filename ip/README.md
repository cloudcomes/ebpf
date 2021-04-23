ETHERNET 数据包的协议类型 TYPE 的值为 0x0800：IP协议，即：ETHERTYPE_IP，
该值在 /usr/include/net/ethernet.h中有定义。ETHERNET 数据包的格式如下：

   |<------------ Ethernet Header ---------->|
    -------------------------------------------------------------------------
    |DST MAC ADDR |SRC MAC ADDR |    TYPE     |   IP PACKET  |  TCP PACKET  |
    -------------------------------------------------------------------------
    |<- 6 bytes ->|<- 6 bytes ->|<- 2 bytes ->|<- 20 bytes ->|<- 20 bytes ->|


###  Clone Project.
```
$ git clone https://github.com/cloudcomes/ebpf.git
```

###  Clone libbpf.
```
$ git clone https://github.com/libbpf/libbpf.tar

```

### Compile using Make
```
编译libbpf.a动态库
#make ../libbpf/src/libbpf.a 
编译用户空间加载程序
# make ip-user
编译ebpf
make ip-kern.o


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
