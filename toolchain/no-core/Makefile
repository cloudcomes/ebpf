# Common Makefile parts for BPF-building with libbpf

KERN_TARGETS := xdp

LLC ?= llc
CLANG ?= clang

KERN_C = ${KERN_TARGETS:=.c}
KERN_OBJ = ${KERN_C:.c=.o}

# Expect this is defined by including Makefile, but define if not


BPF_CFLAGS ?= -I../libbpf/src


all: llvm-check $(KERN_OBJ) 

.PHONY: clean $(CLANG) $(LLC)

clean:
	rm -f $(KERN_OBJ) 
	rm -f *.ll
	rm -f *~

llvm-check: $(CLANG) $(LLC)
	@for TOOL in $^ ; do \
		if [ ! $$(command -v $${TOOL} 2>/dev/null) ]; then \
			echo "*** ERROR: Cannot find tool $${TOOL}" ;\
			exit 1; \
		else true; fi; \
	done


$(KERN_OBJ): %.o: %.c  
	$(CLANG) -S \
	    -target bpf \
	    -D __BPF_TRACING__ \
	    $(BPF_CFLAGS) \
	    -Wall \
	    -Wno-unused-value \
	    -Wno-pointer-sign \
	    -Wno-compare-distinct-pointer-types \
	    -Werror \
	    -O2 -emit-llvm -c -g -o ${@:.o=.ll} $<
	$(LLC) -march=bpf -filetype=obj -o $@ ${@:.o=.ll}
