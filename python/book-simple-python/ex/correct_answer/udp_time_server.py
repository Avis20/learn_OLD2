
from datetime import datetime
import socket

address = ('localhost', 6789)
max_size = 1024

server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind(address)
while True:
    data, client = server.recvfrom(max_size)
    if data == b'time':
        now = str(datetime.now())
        data = now.encode('utf8')
        server.sendto(data, client)
        print("Server send:", data, "to client", client)

server.close()
