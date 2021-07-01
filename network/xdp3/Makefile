# Common Makefile parts for BPF-building with libbpf

KERN_TARGETS := xdp_fwd_kern
USER_TARGETS := xdp_fwd_user

LLC ?= llc
CLANG ?= clang
CC ?= gcc

KERN_C = ${KERN_TARGETS:=.c}
KERN_OBJ = ${KERN_C:.c=.o}

USER_C := ${USER_TARGETS:=.c}
USER_OBJ := ${USER_C:.c=.o}


#Linux source code folder
SRC_DIR ?= /usr/src/linux-source-5.11.0/linux-source-5.11.0

# Expect this is defined by including Makefile, but define if not
LIBBPF_DIR ?= ../libbpf/src
OBJECT_LIBBPF = $(LIBBPF_DIR)/libbpf.a

LDFLAGS ?= -L$(LIBBPF_DIR)/

BPF_GCCFLAGS ?= -I$(SRC_DIR)/tools/testing/selftests/bpf/
BPF_GCCFLAGS += -I$(SRC_DIR)/usr/include/
BPF_GCCFLAGS += -I$(SRC_DIR)/tools/lib/
BPF_GCCFLAGS += -I$(SRC_DIR)/tools/include/
BPF_GCCFLAGS += -I$(SRC_DIR)/tools/perf/
BPF_GCCFLAGS += -I../libbpf/src/

#BPF_CFLAGS ?= -I../libbpf/src/
BPF_CFLAGS ?= -I$(SRC_DIR)/arch/x86/include
BPF_CFLAGS += -I$(SRC_DIR)/arch/x86/include/generated
BPF_CFLAGS += -I$(SRC_DIR)/include

BPF_CFLAGS += -I$(SRC_DIR)/arch/x86/include/uapi/
BPF_CFLAGS += -I$(SRC_DIR)/arch/x86/include/generated/uapi/
BPF_CFLAGS += -I$(SRC_DIR)/include/uapi/
BPF_CFLAGS += -I$(SRC_DIR)/include/generated/uapi/
BPF_CFLAGS += -include $(SRC_DIR)/include/linux/kconfig.h
BPF_CFLAGS += -Iubuntu/include

BPF_CFLAGS += -I$(SRC_DIR)/tools/lib/


#BPF_CFLAGS += -I$(SRC_DIR)/samples/bpf

LIBS = -l:libbpf.a -lelf -lz 


all: llvm-check $(OBJECT_LIBBPF) $(KERN_OBJ) $(USER_OBJ) $(USER_TARGETS)

.PHONY: clean $(CLANG) $(LLC)

clean:
	rm -rf $(LIBBPF_DIR)/build
	$(MAKE) -C $(LIBBPF_DIR) clean
	rm -f $(USER_TARGETS) $(KERN_OBJ) $(USER_OBJ)
	rm -f *.ll
	rm -f *.o
	rm -f sampleip

llvm-check: $(CLANG) $(LLC)
	@for TOOL in $^ ; do \
           if [ ! $$(command -v $${TOOL} 2>/dev/null) ]; then \
              echo "*** ERROR: Cannot find tool $${TOOL}" ;\
              exit 1; \
           else true; fi; \
        done

$(OBJECT_LIBBPF):
	@if [ ! -d $(LIBBPF_DIR) ]; then \
	  echo "Error: Need libbpf submodule"; \
	  echo "May need to run git submodule update --init"; \
	  exit 1; \
	else \
          cd $(LIBBPF_DIR) && $(MAKE) all OBJDIR=.; \
          mkdir -p build; $(MAKE) install_headers DESTDIR=build OBJDIR=.; \
        fi


$(USER_OBJ): 
	$(CC) -Wall -O2 -Wmissing-prototypes -Wstrict-prototypes $(BPF_GCCFLAGS)  \
        -DHAVE_ATTR_TEST=0 \
        -c -o ./xdp_fwd_user.o ./xdp_fwd_user.c

$(USER_TARGETS):
	$(CC) -Wp,-MD,-Wall -O2 -Wmissing-prototypes -Wstrict-prototypes $(BPF_GCCFLAGS)  \
        -DHAVE_ATTR_TEST=0 \
	-o ./xdp_fwd ./xdp_fwd_user.o ../libbpf/src/libbpf.a -lelf -lz

$(KERN_OBJ): 
	$(CLANG)  -nostdinc -isystem /usr/lib/gcc/x86_64-linux-gnu/10/include \
	$(BPF_CFLAGS) \
	-fno-stack-protector \
       	-g \
	-D__KERNEL__ -D__BPF_TRACING__ -Wno-unused-value -Wno-pointer-sign \
	-D__TARGET_ARCH_x86 -Wno-compare-distinct-pointer-types \
	-Wno-gnu-variable-sized-type-not-at-end \
	-Wno-address-of-packed-member -Wno-tautological-compare \
	-Wno-unknown-warning-option  \
	-O2 -emit-llvm -Xclang -disable-llvm-passes -c ./xdp_fwd_kern.c -o - | \
	opt -O2 -mtriple=bpf-pc-linux | llvm-dis | \
	llc -march=bpf  -filetype=obj -o ./xdp_fwd_kern.o	



