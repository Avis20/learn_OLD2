#!/usr/bin/env bash


########### 
##### NEW


# siege -b -c50 -t60S -v --mark="50 rps" -lmy.txt \
siege -g \
'http://192.168.1.68:3000/monitor/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
-H 'X-Player-Device-Key: d2d22fe64ed635c' \
-H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
-H 'X-Player-Version: test-044';




# qa2.fonmix


# siege -b -c50 -t60S \
# -v --mark="50 rps" -llog.txt \

## Transactions:              30435 hits
## Availability:             100.00 %
## Elapsed time:             179.72 secs

# siege -b -c100 -t180S \
# -v --mark="100 rps" -lqa2_fonmix.log \

## Transactions:              29703 hits
## Availability:              99.72 %
## Elapsed time:             179.97 secs

# siege -b -c500 -t180S \
# -v --mark="500 rps" -lqa2_fonmix.log \
# 'http://qa2.fonmix.ru/monitor/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message= playlist [adverts] saving failed↵Throwable: org.sqlite.SQLiteException: [SQLITE_BUSY]  The database file is locked (database s locked)&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044'


# curl -X POST \
# http://localhost:3000/devel/monitor/player \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044' \
# -F real_ip=79.98.212.82 \
# -F request_time=1564469398

# siege -b -c1 -t60S -v -lrelease.txt --mark="1 rps" \

### GET 
# siege -g http://localhost:3000/devel/monitor/player \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044'

### POST

######################## Loggered table
# ok
# siege -b -c5 -t60S \
# -v --mark="5 rps" -llog.txt \

# siege -b -c15 -t60S \
# -v --mark="15 rps" -llog.txt \

## Transactions:               1518 hits
## Availability:             100.00 %
## Elapsed time:             179.13 secs

# siege -b -c1 -t180S \
# -v --mark="1 rps" -lpostgres.log \

## Transactions:               6616 hits
## Availability:             100.00 %
## Elapsed time:             179.75 secs

# siege -b -c50 -t180S \
# -v --mark="50 rps" -lpostgres.log \

## Transactions:               6733 hits
## Availability:             100.00 %
## Elapsed time:             179.81 secs
# siege -b -c100 -t180S \
# -v --mark="100 rps" -lpostgres.log \

## Transactions:              71866 hits
## Availability:             100.00 %
## Elapsed time:             179.37 secs
# siege -b -c100 -t180S \
# -v --mark="100 rps" -lpostgres.log \

## Transactions:              71421 hits
## Availability:             100.00 %
## Elapsed time:             179.40 secs
# siege -b -c200 -t180S \
# -v --mark="200 rps" -lpostgres.log \

## Transactions:               4767 hits
## Availability:              81.87 %
## Elapsed time:              20.49 secs
# siege -b -c250 -t180S \
# -v --mark="250 rps" -lpostgres.log \

# siege -g \
# siege -b -c100 -t180S \
# -v --mark="100 rps" -lpostgres.log \
# 'http://orlov.qa2.fonmix.ru/monitor/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044'

###########
## Unlogered


## Transactions:              79886 hits
## Availability:             100.00 %
## Elapsed time:             179.61 secs
# siege -b -c100 -t180S \
# -v --mark="100 rps" -lpostgres2.log \


## Transactions:              15287 hits
## Availability:              93.48 %
## Elapsed time:              89.51 secs
# siege -b -c250 -t180S \
# -v --mark="250 rps" -lpostgres2.log \

# siege -b -c250 -r100 \
# -v --mark="250 rps" -lpostgres4.log \
# 'http://orlov.qa2.fonmix.ru/monitor2/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044';


# siege -b -c250 -t60S \
# -v --mark="250 rps" -lpostgres2.log \
# 'http://orlov.qa2.fonmix.ru/monitor2/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044'

###########
## TimescaleDB

# siege -b -c250 -r1000 \
# -v --mark="250 rps" -lpostgres2.log \
# 'http://orlov.qa2.fonmix.ru/monitor3/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044';



# siege -b -c250 -t360S \
# -v --mark="250 rps" -lpostgres2.log \
# 'http://orlov.qa2.fonmix.ru/monitor3/player POST play_status=1&play_status_code=player is paused&cache_status=2&ip_address=26.45.167.191:8081&real_ip=79.98.212.82&local_time=1564469397125&os_info=windows 1010.0&real_timezone=Europe/Moscow&real_timezone_offset=3:00&request_time=1564469398&up_time=4 дн. назад&version=windows 1010.0_3.0.1.81&cache_allocated_size=138191&cache_available_size=138191&cache_errcode=2&cache_errmess=Все подборки скачаны в кеш.&cache_free_disk_size=124864&cache_free_size=114808&cache_total_track_downloaded_size=23382&cache_total_track_size=23382&cache_used_size=23451&current_playlist=Звуки Природы&current_playlist_id=2097&current_second=556&current_singer=Nature Sound Series&current_track=Mountain Brook Soundscape Bedtime Music For Baby Sleep, Natural Stress Relief&current_track_id=585ce146-0000-0019-0000-0000f496cb37&geoip_timezone=Europe/Moscow&geoip_timezone_offset=3&last_err_code=-2&last_err_message=1&last_err_time=2019-07-30T07:56:48' \
# -H 'X-Player-Device-Key: d2d22fe64ed635c' \
# -H 'X-Player-Secret-Key: 56813eb4-9d21-d0ab-05cd-636005cd6334' \
# -H 'X-Player-Version: test-044';
