# Common Makefile parts for BPF-building with libbpf

USER_TARGETS := sock_example

LLC ?= llc
CLANG ?= clang
CC ?= gcc

USER_C := ${USER_TARGETS:=.c}
USER_OBJ := ${USER_C:.c=.o}

# Expect this is defined by including Makefile, but define if not

LIBBPF_DIR ?= ../libbpf/src
OBJECT_LIBBPF = $(LIBBPF_DIR)/libbpf.a

#CFLAGS ?= -I$(LIBBPF_DIR)/build/usr/include/ -g
#CFLAGS += -I../headers/
CFLAGS += -I../libbpf/src
LDFLAGS ?= -L$(LIBBPF_DIR)/

#BPF_CFLAGS ?= -I$(LIBBPF_DIR)/build/usr/include/ -I../libbpf/src
BPF_CFLAGS ?= -I../libbpf/src

LIBS = -l:libbpf.a -lelf -lz $(USER_LIBS)

all: llvm-check $(KERN_OBJ) $(USER_TARGETS)

.PHONY: clean $(CLANG) $(LLC)

clean:
	$(MAKE) -C $(LIBBPF_DIR) clean
	rm -f $(USER_TARGETS) $(KERN_OBJ) $(USER_OBJ)
	rm -f *.ll
	rm -f *~

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

$(USER_TARGETS): %: %.c  $(OBJECT_LIBBPF)
	$(CC) -Wall $(CFLAGS) $(LDFLAGS) -o $@  \
	 $< $(LIBS)


