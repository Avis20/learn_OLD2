
import gevent
from gevent import monkey
import socket

monkey.patch_all()

hosts = ['google.com', 'ya.ru', 'dads.com']
jobs = [gevent.spawn(socket.gethostbyname, host) for host in hosts]
gevent.joinall(jobs, timeout=5)
for job in jobs:
    print(job.value)
