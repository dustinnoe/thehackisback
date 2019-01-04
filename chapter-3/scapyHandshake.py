# For this example to work you must set your firewall to drop RST packets
# to scanme.nmap.org because your kernel has no idea you are using scapy
# and is just doing it's thing.
#
# iptables -A OUTPUT -p tcp --tcp-flags RST RST -d scanme.nmap.org -j DROP
#
from scapy.all import *
conf.verb = 0

dst = 'scanme.nmap.org'
dport = 80

syn = IP(dst=dst) / TCP(dport=dport, flags="S")
synack = sr1(syn)

# Send the ack following the TCP rules
ack = IP(dst=dst) / TCP(dport=dport, flags="A", seq=synack.ack, ack=synack.seq+1)
send(ack)