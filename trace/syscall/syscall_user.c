#include "libbpf.h"
#include <unistd.h>
#include <fcntl.h>

int main(int argc, char **argv )
{
        int fd;
        struct bpf_object *obj;
	struct bpf_program *prog;
        struct bpf_link *link = NULL;


        fprintf(stdout,"1: Open BPF application......\n");
        obj = bpf_object__open_file("syscall_kern.o", NULL);
        if (libbpf_get_error(obj)) {
	  fprintf(stderr, "Failed to open BPF skeleton\n");
	}   
        
	fprintf(stdout,"2: Load & verify BPF programs......\n");
	if (bpf_object__load(obj)) {
       	  fprintf(stderr, "Failed to load and verify BPF skeleton\n");
        }

   
        fprintf(stdout,"3: Attach tracepoint handler......\n");
 	bpf_object__for_each_program(prog, obj) {
	  link = bpf_program__attach(prog);
	  if (libbpf_get_error(link)) {
        	fprintf(stderr, "Failed to attach BPF skeleton\n");
		link = NULL; 
	  }
	}        

         
        fprintf(stdout,"4: Open a file to triger eBPF program.....\n"); 
        fd = open("syscall_kern.c",O_RDONLY);


        close(fd);
	
        fprintf(stdout,"5: Detach and Unload eBPF program......\n"); 
	bpf_link__destroy(link);
        bpf_object__close(obj);
 

        return 0;
}
