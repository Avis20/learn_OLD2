from redis import Redis

redis = Redis()

# redis.mset(["test1", "val1"], ["test2", "val2"])
print(help(redis.mset))
# print(redis.get("test1"))
# print(redis.get("test2"))
