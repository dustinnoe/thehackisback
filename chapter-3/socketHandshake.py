import socket
import time

s = socket.socket()
s.connect(('scanme.nmap.org', 80))
time.sleep(5)
s.close()