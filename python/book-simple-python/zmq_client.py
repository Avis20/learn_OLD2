
import zmq

host = '127.0.0.1'
port = 6789
address = "tcp://{}:{}".format(host, port)
print(address)

ctx = zmq.Context()
client = ctx.socket(zmq.REQ)
client.connect(address)

for n in range(1, 5):
    req_msg = "Message #{}".format(n)
    req_bytes = req_msg.encode('utf8')
    client.send(req_bytes)
    reply_bytes = client.recv()
    reply_str = reply_bytes.decode('utf8')
    print("Отправлено: [{}]; Получено: [{}]".format(req_msg, reply_str))
