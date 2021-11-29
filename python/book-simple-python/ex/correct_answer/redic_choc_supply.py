
from time import sleep
import redis
import random

redis = redis.Redis()
varieties = ['трюфель', 'вишня', 'карамель', 'нуга']

while True:
    sleep(random.random())
    piece = random.choice(varieties)
    print('Add', piece, 'to redis')
    redis.rpush('choc', piece)
