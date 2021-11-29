
from datetime import datetime
import struct
import socket

server_address = ('localhost', 6789)
max_size = 4096
client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
client.sendto(b'time', server_address)

data, server = client.recvfrom(max_size)

timestamp = struct.unpack('<L', data)[0]

print("Сейчас ", datetime.fromtimestamp(timestamp))

client.close()
