
from datetime import datetime
import socket

print("Старт сервера в", datetime.now())
print("Ждем клиентов")

max_size = 1024
server_address = ('localhost', 6789)
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.bind(server_address)
server.listen(5)
client, addr = server.accept()
data = client.recv(max_size)
print("В ", datetime.now(), client, "сказал", data)
client.sendall(b'Are you talking to me?')
client.close()
server.close()
