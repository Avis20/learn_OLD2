
import gevent
from gevent import socket

hosts = ['google.com', 'ya.ru', 'ddsadsa.com']
jobs = [gevent.spawn(socket.gethostbyname, host) for host in hosts]
gevent.joinall(jobs, timeout=5)
for job in jobs:
    print(job.value)
