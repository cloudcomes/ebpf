# Common Makefile parts for BPF-building with libbpf

ifeq ($(V),1)
	Q =
	msg =
else
	Q = @
	msg = @printf '  %-8s %s%s\n' "$(1)" "$(2)" "$(if $(3), $(3))";
endif


KERN_TARGETS := syscall_kern
USER_TARGETS := syscall_user

LLC ?= llc
CLANG ?= clang
CC ?= gcc

KERN_C = ${KERN_TARGETS:=.c}
KERN_OBJ = ${KERN_C:.c=.o}

USER_C := ${USER_TARGETS:=.c}
USER_OBJ := ${USER_C:.c=.o}

NO_PKG_CONFIG := 1 

# Expect this is defined by including Makefile, but define if not
LIBBPF_DIR ?= /home/cloudcome/libbpf/src
OBJECT_LIBBPF = $(LIBBPF_DIR)/libbpf.a

LDFLAGS ?= -L$(LIBBPF_DIR)/

BPF_CFLAGS ?= -I/home/cloudcome/libbpf/src/

LIBS = /home/cloudcome/libbpf/src/libbpf.a 

all: llvm-check $(KERN_OBJ) $(USER_OBJ) $(USER_TARGETS)

.PHONY: clean $(CLANG) $(LLC)

clean:
	$(call msg,rm,$@)
	#rm -rf $(LIBBPF_DIR)/build
	#$(MAKE) -C $(LIBBPF_DIR) clean
	rm -f *.ll
	rm -f *.o
	rm -f syscall

llvm-check: $(CLANG) $(LLC)
	$(call msg,CHECK,$@)
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
          #mkdir -p build; $(MAKE) install_headers DESTDIR=build OBJDIR=.; \
        fi

$(USER_OBJ): 
	$(call msg,CC,$@)
	$(Q)$(CC) -Wall -O2 -Wmissing-prototypes -Wstrict-prototypes $(BPF_CFLAGS)  \
        -DHAVE_ATTR_TEST=0 \
        -c -o ./syscall_user.o ./syscall_user.c

$(USER_TARGETS):
	$(call msg,CC,$@)
	$(Q)$(CC) -Wp,-MD,-Wall -O2 -Wmissing-prototypes -Wstrict-prototypes $(BPF_CFLAGS)  \
        -DHAVE_ATTR_TEST=0 \
	-o ./syscall ./syscall_user.o $(LIBS) -lelf -lz

$(KERN_OBJ): %.o: %.c  $(OBJECT_LIBBPF)
	$(call msg,CLANG,$@)
	$(Q)$(CLANG) -S \
        -target bpf \
            -D __BPF_TRACING__ \
            $(BPF_CFLAGS) \
            -Wall \
            -Wno-unused-value \
            -Wno-pointer-sign \
            -Wno-compare-distinct-pointer-types \
            -Werror \
            -D__TARGET_ARCH_x86 \
            -O2 -emit-llvm -c -g -o ${@:.o=.ll} $<
	$(call msg,LLC,$@)
	$(Q)$(LLC) -march=bpf -filetype=obj -o $@ ${@:.o=.ll}
