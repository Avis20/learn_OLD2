
import random
import time
import zmq

host = '*'
port = 6789

ctx = zmq.Context()
print(zmq.PUB)
pub = ctx.socket(zmq.PUB)
pub.bind('tcp://{}:{}'.format(host, port))

artists = ['DETACH', 'Orden Ogan', 'Matt Guillory', 'Dragged Under',
           'Radio Tapok', 'Strike', '10 Years', 'A Day To Remember']

tracks = ['Afterglow', 'Heart of the Android',
          'Give Me a Sign', 'Just Like Me',
          'Wrong Side of Heaven', 'Плачь',
          'Never Too Late', 'Sleep In The Fire']

time.sleep(1)
for msg in range(10):
    artist = random.choice(artists)
    track = random.choice(tracks)
    print("Публикация: Группа {} исполняет {}".format(artist, track))
    pub.send_multipart([artist.encode('utf8'), track.encode('utf8')])
