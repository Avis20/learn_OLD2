import os
import time
import threading

array = []


def do_this(what):
    time.sleep(4)
    array.append(what)
    print(array)
    whoami(what)


def whoami(text):
    print("Поток %s сказал: %s " % (threading.current_thread(), text))

if __name__ == '__main__':
    whoami("Я основная программа, " + str(os.getpid()))
    for i in range(4):
        proc = threading.Thread(target=do_this, args=("Я поток %s" % i,))
        proc.start()

    print(array)
