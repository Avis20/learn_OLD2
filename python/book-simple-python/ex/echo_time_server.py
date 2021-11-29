
import time
import struct
from datetime import datetime
import socket

max_size = 1024
server_address = ('localhost', 6789)
server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind(server_address)

data, client = server.recvfrom(max_size)
print(data, client)

dt = datetime.now()
timestamp = time.mktime(dt.timetuple())
dt_bytes = struct.pack('<L', int(timestamp))

server.sendto(dt_bytes, client)
