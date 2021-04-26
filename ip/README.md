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

###  Run ip-user

```
$ ip-user -i 192.168.1.100 
```

### send some ICMP packets to localhost 
send some ICMP packets to localhost with the IP 192.168.1.100

```
$ python3 test.py
```

