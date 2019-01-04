from scapy.all import *
conf.verb = 0

dst = 'scanme.nmap.org'
src = '78.78.78.78'
sport = 12
dport = 80
payload = "The Hack is Back"

p = IP(dst=dst, src=src) / TCP(sport=sport, dport=dport) / payload
print(p.summary())
send(p)
