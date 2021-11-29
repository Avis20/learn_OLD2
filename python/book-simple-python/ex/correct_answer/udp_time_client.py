
import socket

address = ('localhost', 6789)
max_size = 1024

client = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
client.sendto(b'time', address)
data, server = client.recvfrom(max_size)
print("Client get: ", data, "from", server)
client.close()
