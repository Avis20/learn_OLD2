
from datetime import datetime
import socket

server_address = ('localhost', 6789)
max_size = 1024
print("Старт клиента в ", datetime.now())
client = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
client.connect(server_address)
client.sendall(b'HEy!')
data = client.recv(max_size)
print("В ", datetime.now(), "сказал", data)
client.close()
