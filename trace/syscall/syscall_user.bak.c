#include "libbpf.h"
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv )
{
        int fd;
        struct bpf_object *obj;
	struct bpf_program *prog;
        struct bpf_link *link = NULL;


        fprintf(stdout,"1: opening eBPF file syscall_kern.o......\n");
        obj = bpf_object__open_file("syscall_kern.o", NULL);
        if (libbpf_get_error(obj)) {
	  fprintf(stderr, "opening BPF object file failed\n");
	}   
        
	fprintf(stdout,"2: loading eBPF object file......\n");
	if (bpf_object__load(obj)) {
       	  fprintf(stderr, "loading BPF object file failed\n");
        }

   
        fprintf(stdout,"3: attaching eBPF program to TP......\n");
 	bpf_object__for_each_program(prog, obj) {
	  link = bpf_program__attach(prog);
	  if (libbpf_get_error(link)) {
        	fprintf(stderr, "bpf_program__attach failed\n");
		link = NULL; 
	  }
	}        

         
        fprintf(stdout,"4: opening a file to triger eBPF code running.....\n"); 
        fd = open("syscall_kern.c",O_RDONLY);


        close(fd);
	
        fprintf(stdout,"5: detaching and unloading eBPF programs......\n"); 
	bpf_link__destroy(link);
        bpf_object__close(obj);
 

        return 0;
}
