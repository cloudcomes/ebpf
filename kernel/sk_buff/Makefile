
CFLAGS ?= -I/root/cloud/linux/include
CFLAGS += -I/root/cloud/linux/arch/x86/include
CFLAGS += -I/root/cloud/linux/arch/arm64/include

default: segment 

sk_buff:
segment: segment.c
	clang -w -static $(CFLAGS) $@.c -o $@

clean:
	rm -f segment