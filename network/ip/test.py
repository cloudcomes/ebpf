#pip3 install scapy
from scapy.all import  *
conf.L3socket=L3RawSocket
sr1(IP(src="192.168.1.100", dst="127.0.0.1")/ICMP())
