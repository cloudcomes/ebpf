#pip3 install scapy
from scapy.all import  *
conf.L3socket=L3RawSocket
sr1(IP(src="192.168.132.6", dst="8.8.8.8")/ICMP())
