
import os
import time
import multiprocessing as mp
import redis

COUNT_DRYERS = 3
TIMEOUT = 20
redis = redis.Redis()


def drying():
    pid = os.getpid()
    print("Сушка началась! процесс {}".format(pid))
    while True:
        msg = redis.blpop('dishes', TIMEOUT)
        if not msg:
            break
        value = msg[1].decode('utf8')
        if value == 'quit':
            break
        print("{}: сушка {}".format(pid, value))
        time.sleep(0.3)
    print("Сушка закончилась! процесс {}".format(pid))


if __name__ == '__main__':
    for dryer in range(COUNT_DRYERS):
        proc = mp.Process(target=drying)
        proc.start()
