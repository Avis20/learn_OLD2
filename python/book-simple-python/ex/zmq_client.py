
import struct
from datetime import datetime
import zmq

host = '127.0.0.1'
port = 6789
address = "tcp://{}:{}".format(host, port)
print(address)

ctx = zmq.Context()
client = ctx.socket(zmq.REQ)
client.connect(address)

client.send('time'.encode('utf8'))
reply_bytes = client.recv()
timestamp = struct.unpack('<L', reply_bytes)[0]
print("Сейчас ", datetime.fromtimestamp(timestamp))
