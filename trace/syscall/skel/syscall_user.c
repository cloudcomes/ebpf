#include "libbpf.h"
#include <unistd.h>
#include <fcntl.h>
#include "syscall.skel.h"

int main(int argc, char **argv )
{
        int fd;
	int err;
        
	struct syscall_kern *skel;

        fprintf(stdout,"1: Open BPF application......\n");
        skel = syscall_kern__open();
        if (!skel) {
	  fprintf(stderr, "Failed to open eBPF skeleton\n");
	  return 1;
	}   
        
	fprintf(stdout,"2: Load & verify BPF programs......\n");
	if (syscall_kern__load(skel)) {
       	  fprintf(stderr, "Failed to load and verify eBPF skeleton\n");
	  goto cleanup;
        }

   
        fprintf(stdout,"3: Attach tracepoint handler......\n");
	if (syscall_kern__attach(skel)) {
       	   fprintf(stderr, "Failed to attach eBPF skeleton\n");
           goto cleanup; 
	}        

        printf("Successfully started!\n");
         
        fprintf(stdout,"4: Trigger our eBPF program.....\n"); 
        fd = open("syscall_kern.c",O_RDONLY);


        close(fd);
cleanup:
        fprintf(stdout,"5: detaching and unloading eBPF programs......\n"); 
	syscall_kern__destroy(skel);
        return -err;
}
