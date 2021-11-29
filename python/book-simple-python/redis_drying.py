
import redis

redis = redis.Redis()

print("Сушка началась!")

while True:
    msg = redis.blpop('dishes')
    if not msg:
        break
    value = msg[1].decode('utf8')
    if value == 'quit':
        break
    print("Сушка", value)

print("Сушка закончилась!")
