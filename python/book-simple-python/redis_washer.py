
import redis

redis = redis.Redis()

print("Мойка началась!")

dishes = ['салат', 'суп', 'жаркое', 'бараньи ребрышки']
for dish in dishes:
    print("Мытье", dish)
    msg = dish.encode('utf8')
    redis.rpush('dishes', msg)

redis.rpush('dishes', 'quit')
print("Мойка закончилась!")
