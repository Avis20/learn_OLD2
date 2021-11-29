
from datetime import datetime
import socket

print("Старт сервера в", datetime.now())
print("Ждем клиентов")

max_size = 4096
server_address = ('localhost', 6789)
server = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
server.bind(server_address)

data, client = server.recvfrom(max_size)
print("В ", datetime.now(), client, "сказал", data)
server.sendto(b'Are you talking to me?', client)
server.close()
