
import string
import redis

redis = redis.Redis()

with open('mammoth.txt', 'rt') as poem:
    text = poem.read()

for word in text.split():
    word = word.strip(string.punctuation)
