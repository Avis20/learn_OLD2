
from datetime import datetime
from time import sleep
import redis

redis = redis.Redis()
timeout = 10

while True:
    sleep(0.5)
    msg = redis.blpop('choc', timeout)
    remaining = redis.llen('choc')
    if msg:
        piece = msg[1].decode('utf8')
        print("Люси получила", piece, "в", datetime.now(),
              "Осталось", remaining)
