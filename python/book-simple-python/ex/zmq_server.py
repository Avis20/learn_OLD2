
import time
import struct
from datetime import datetime
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
    if request_str == 'time':
        dt = datetime.now()
        timestamp = time.mktime(dt.timetuple())
        dt_bytes = struct.pack('<L', int(timestamp))
        server.send(dt_bytes)
    else:
        server.send(b'')
