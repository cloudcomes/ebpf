## test bpf

### Build test_bpd module

```shell
$ make -f Makefile
```
### Test 

Insert the module into the kernel memory by command “insmod”.

```shell
insmod test_bpf.ko
```
we can list all modules by command “lsmod”

```shell
lsmod|grep test_bpf
```
The following command “dmesg” shows the output message of printk in the module's init function.
It proves the great_init_module() has been called after we typed “insmod” command.
```shell
dmesg|tail
```

### Unload the module

Remove the module and you can see the output message of printk in the module's exit function.
```shell
$ bpftool net detach xdp dev enp0s8
```
