
import redis

redis = redis.Redis()

topics = ['Radio Tapok', 'A Day To Remember']

sub = redis.pubsub()
sub.subscribe(topics)
for msg in sub.listen():
    if msg['type'] == 'message':
        artist = msg['channel']
        track = msg['data']
        print("Подписка: Группа {} исполняет {}".format(
            artist.decode('utf8'),
            track.decode('utf8')
        ))
