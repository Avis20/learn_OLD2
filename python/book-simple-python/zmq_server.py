
import zmq

host = '127.0.0.1'
port = 6789

ctx = zmq.Context()
server = ctx.socket(zmq.REP)
addres = "tcp://{}:{}".format(host, port)
print(addres)
server.bind(addres)

while True:
    req_bytes = server.recv()
    request_str = req_bytes.decode('utf8')
    print("Получен запрос [", request_str, "]", sep='')
    reply_str = "Ответ от сервера: {}".format(request_str)
    reply_bytes = reply_str.encode('utf8')
    server.send(reply_bytes)
