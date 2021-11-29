import os
import threading
import queue
import time


def washer(dishes, dish_queue):
    for dish in dishes:
        print("Мытье ", dish, time.localtime().tm_sec)
        time.sleep(10)
        dish_queue.put(dish)


def dryer(dish_queue):
    while True:
        dish = dish_queue.get()
        print("Сушка ", dish, time.localtime().tm_sec)
        time.sleep(5)
        dish_queue.task_done()


print(os.getpid())
dish_queue = queue.Queue()
for n in range(2):
    thread = threading.Thread(target=dryer, args=(dish_queue, ))
    thread.start()

dishes = ['салат', 'суп', 'жаркое', 'бараньи ребрышки']
washer(dishes, dish_queue)
dish_queue.join()
