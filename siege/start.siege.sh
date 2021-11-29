#!/usr/bin/env bash

siege -b -c3 -t300S -v -lsaqa.txt \
  -H 'Cookie: uid=jlsK7F1monixmkQFBaR4Ag==; rsid=dff55af1336b5b6b4dd924b16ba8d185' \
  -H 'Host: qa2.fonmix.ru' \
  -H 'cache-control: no-cache' \
'http://qa2.fonmix.ru/api/yellow/cabinet/playlist/list?source=project&category_id=18&limit=8&with=cover'


# siege -b -c3 -t100S -v -llog_qa.txt \
# -H 'X-Player-Secret-Key:5b7bd042-2f7d-0a62-0264-7d4302605a44' \
# -H 'X-Player-Device-Key:D17E7B9AFCEB788D29FD04E9161B83CE78900A316AA8C9CA8F' \
# -H 'X-Player-Version:win_7_1.1.0.26' \
# http://orlov.qa2.fonmix.ru/api/yellow/player/info

# http://orlov.qa2.fonmix.ru/api/orange/filial/item/music/playlist/list?filial.item.id=158211


# siege -b -c3 -t10S -v -llog_qa.txt \
# -H 'X-Player-Secret-Key:5b7bd042-2f7d-0a62-0264-7d4302605a44' \
# -H 'X-Player-Device-Key:D17E7B9AFCEB788D29FD04E9161B83CE78900A316AA8C9CA8F' \
# -H 'X-Player-Version:win_7_1.1.0.26' \
# http://qa2.fonmix.ru/api/yellow/player/info

# http://orlov.qa2.fonmix.ru/api/orange/filial/item/music/playlist/list?filial.item.id=158211


