#include <assert.h>
#include <linux/bpf.h>
#include <bpf.h>
#include <unistd.h>

#include<stdio.h>
#include<malloc.h>
#include<sys/socket.h>

#include<arpa/inet.h>           
#include<linux/icmp.h>
	 
#include<linux/if_ether.h>      // for ethernet header
#include<linux/ip.h>		    // for ip header
#include<linux/udp.h>		    // for udp header

#include "sockex1.skel.h"

FILE* packets_txt;
int total,udp,icmp,other,iphdrlen;

struct sockaddr saddr;
struct sockaddr_in source,dest;

static void icmp_payload(unsigned char* buffer,int buflen)
{
	int i=0;
	unsigned char * data = (buffer + iphdrlen  + sizeof(struct ethhdr) + sizeof(struct icmphdr));
	fprintf(packets_txt,"\nData\n");
	int remaining_data = buflen - (iphdrlen  + sizeof(struct ethhdr) + sizeof(struct icmphdr));
	for(i=0;i<remaining_data;i++)
	{
		if(i!=0 && i%16==0)
			fprintf(packets_txt,"\n");
		fprintf(packets_txt," %.2X ",data[i]);
	}

	fprintf(packets_txt,"\n");

}

static void payload(unsigned char* buffer,int buflen)
{
	int i=0;
	unsigned char * data = (buffer + iphdrlen  + sizeof(struct ethhdr) + sizeof(struct udphdr));
	fprintf(packets_txt,"\nData\n");
	int remaining_data = buflen - (iphdrlen  + sizeof(struct ethhdr) + sizeof(struct udphdr));
	for(i=0;i<remaining_data;i++)
	{
		if(i!=0 && i%16==0)
			fprintf(packets_txt,"\n");
		fprintf(packets_txt," %.2X ",data[i]);
	}

	fprintf(packets_txt,"\n");

}

static void eth_header(unsigned char* buffer,int buflen)
{
	struct ethhdr *eth = (struct ethhdr *)(buffer);
	fprintf(packets_txt,"\nEthernet Header\n");
	fprintf(packets_txt,"\t|-Source Address	: %.2X-%.2X-%.2X-%.2X-%.2X-%.2X\n",eth->h_source[0],eth->h_source[1],eth->h_source[2],eth->h_source[3],eth->h_source[4],eth->h_source[5]);
	fprintf(packets_txt,"\t|-Destination Address	: %.2X-%.2X-%.2X-%.2X-%.2X-%.2X\n",eth->h_dest[0],eth->h_dest[1],eth->h_dest[2],eth->h_dest[3],eth->h_dest[4],eth->h_dest[5]);
	fprintf(packets_txt,"\t|-Protocol		: %d\n",eth->h_proto);

}

static void ip_header(unsigned char* buffer,int buflen)
{
	struct iphdr *ip = (struct iphdr*)(buffer + sizeof(struct ethhdr));

	iphdrlen =ip->ihl*4;

	memset(&source, 0, sizeof(source));
	source.sin_addr.s_addr = ip->saddr;     
	memset(&dest, 0, sizeof(dest));
	dest.sin_addr.s_addr = ip->daddr;     

	fprintf(packets_txt , "\nIP Header\n");

	fprintf(packets_txt , "\t|-Version              : %d\n",(unsigned int)ip->version);
	fprintf(packets_txt , "\t|-Internet Header Length  : %d DWORDS or %d Bytes\n",(unsigned int)ip->ihl,((unsigned int)(ip->ihl))*4);
	fprintf(packets_txt , "\t|-Type Of Service   : %d\n",(unsigned int)ip->tos);
	fprintf(packets_txt , "\t|-Total Length      : %d  Bytes\n",ntohs(ip->tot_len));
	fprintf(packets_txt , "\t|-Identification    : %d\n",ntohs(ip->id));
	fprintf(packets_txt , "\t|-Time To Live	    : %d\n",(unsigned int)ip->ttl);
	fprintf(packets_txt , "\t|-Protocol 	    : %d\n",(unsigned int)ip->protocol);
	fprintf(packets_txt , "\t|-Header Checksum   : %d\n",ntohs(ip->check));
	fprintf(packets_txt , "\t|-Source IP         : %s\n", inet_ntoa(source.sin_addr));
	fprintf(packets_txt , "\t|-Destination IP    : %s\n",inet_ntoa(dest.sin_addr));
}


static void icmp_header(unsigned char* buffer,int buflen)
{
	fprintf(packets_txt,"\n*************************ICMP Packet******************************");
   	eth_header(buffer,buflen);
  	ip_header(buffer,buflen);

   	struct icmphdr *icmp = (struct icmphdr*)(buffer + iphdrlen + sizeof(struct ethhdr));
   	fprintf(packets_txt , "\nICMP Header\n");
   	fprintf(packets_txt , "\t|-type          : %u\n",icmp->type);
   	fprintf(packets_txt , "\t|-code     : %u\n",icmp->code);

	icmp_payload(buffer,buflen);
    
    fprintf(packets_txt,"*****************************************************************\n\n\n");

}

static void udp_header(unsigned char* buffer, int buflen)
{
	fprintf(packets_txt,"\n*************************UDP Packet******************************");
	eth_header(buffer,buflen);
	ip_header(buffer,buflen);
	fprintf(packets_txt,"\nUDP Header\n");

	struct udphdr *udp = (struct udphdr*)(buffer + iphdrlen + sizeof(struct ethhdr));
	fprintf(packets_txt , "\t|-Source Port    	: %d\n" , ntohs(udp->source));
	fprintf(packets_txt , "\t|-Destination Port	: %d\n" , ntohs(udp->dest));
	fprintf(packets_txt , "\t|-UDP Length      	: %d\n" , ntohs(udp->len));
	fprintf(packets_txt , "\t|-UDP Checksum   	: %d\n" , ntohs(udp->check));

	payload(buffer,buflen);

	fprintf(packets_txt ,"*****************************************************************\n\n\n");

}

static void data_process(unsigned char* buffer,int buflen)
{
	struct iphdr *ip = (struct iphdr*)(buffer + sizeof (struct ethhdr));
	++total;
	/* we will se UDP Protocol only*/ 
	switch (ip->protocol)    //see /etc/protocols file 
	{

		case 1:
			++icmp;
			icmp_header(buffer,buflen);
			break;

		case 17:
			++udp;
			udp_header(buffer,buflen);
			break;

		default:
			++other;

	}
	printf("ICMP: %d  UDP: %d  Other: %d  Toatl: %d  \r",icmp,udp,other,total);

}

int main(void)
{
	int prog_fd;
    int sock,saddr_len,buflen;

    struct sockex1_kern *skel;

	FILE *fff,*f;

	unsigned char* buffer = (unsigned char *)malloc(65536); 
	memset(buffer,0,65536);

	packets_txt=fopen("log.txt","w");
	if(!packets_txt)
	{
		printf("unable to open log.txt\n");
		return -1;

	}

	printf("starting .... \n");

    /* Load and verify BPF application */ 
    skel = sockex1_kern__open_and_load();
	if (!skel) {
	  fprintf(stderr, "Failed to open and load eBPF skeleton\n");
	  return 1;
	}   
    
	prog_fd = bpf_program__fd(skel->progs.bpf_prog1);

    /* Opening a raw socket */ 
    sock=socket(AF_PACKET,SOCK_RAW,htons(ETH_P_ALL)); 
	
	if(sock<0)
	{
		printf("error in socket\n");
		return -1;
	}

    /* Attach BPF application with socket */ 
    assert(setsockopt(sock, SOL_SOCKET, SO_ATTACH_BPF, &prog_fd,
			  sizeof(prog_fd)) == 0);

	while(1)
	{
	      /* Sending the UDP packet */ 
		fff = popen("netperf -t UDP_STREAM -l 4 localhost", "r");
        (void) fff;

		f = popen("ping -s 20 -4 -c5 localhost", "r");
	    (void) f;

		saddr_len=sizeof(saddr);

		buflen=recvfrom(sock,buffer,65536,0,&saddr,(socklen_t *)&saddr_len);

		if(buflen<0)
		{
			printf("error in reading recvfrom function\n");
			return -1;
		}
		fflush(packets_txt);
		data_process(buffer,buflen);

	}

	close(sock);
	printf("DONE!!!!\n");

}
