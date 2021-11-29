

select date_trunc('month', ts_playing) as month, count(*) from stat.audios
group by month order by month

SELECT date_trunc('month', ts_playing) as month, COUNT(*) FROM stat.audios
GROUP BY month ORDER BY month
LIMIT 50;

select * from stat.audios where date_trunc('month', ts_playing) = '2019-02-01';
delete from stat.audios where date_trunc('month', ts_playing) = '2019-02-01';

select * from
( select count(*) from stat.audios ) a,
( select pg_size_pretty(pg_table_size('stat.audios')) as table_size ) b,
( select pg_size_pretty(pg_indexes_size('stat.audios')) as index_size ) c;


select * from
( select count(*) from stat.audio_scope ) a,
( select pg_size_pretty(pg_table_size('stat.audio_scope')) as table_size ) b,
( select pg_size_pretty(pg_indexes_size('stat.audio_scope')) as index_size ) c;


explain analyze
SELECT count( distinct(filial_id) ) FROM stat.audios;

explain analyze
SELECT count(*) FROM stat.audios
WHERE date_trunc('month', ts_playing)::date = '2019-10-01'

/*
CREATE TABLE stat.audios (
  audio_id UUID NOT NULL,
  filial_id INTEGER NOT NULL,
  ts_playing TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
  count_chunks INTEGER NOT NULL,
  is_announce BOOLEAN DEFAULT false NOT NULL,
  list_stat_files INTEGER [] NOT NULL,
  is_ts_playing_corrected BOOLEAN DEFAULT false NOT NULL,
  id BIGSERIAL,
  content_subtype_id INTEGER,
  CONSTRAINT audios_pkey PRIMARY KEY(id)
) 
WITH (fillfactor = 90, oids = false);
*/

insert into stat.audios (audio_id, filial_id, ts_playing, count_chunks, is_announce, list_stat_files, is_ts_playing_corrected, content_subtype_id)
select
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as audio_id,
    round( random() * 3000 ) as filial_id,
    timestamp '2019-11-01T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-11-28T23:00:00') as ts_playing,
    round( random() * 300 ) as filial_id,
    timestamp '2019-01-01T00:00:00' + random() * (timestamp '2019-01-01T00:00:00' - timestamp '2019-02-01T00:00:00') as ts_playing,
    round( random() * 50 ) as count_chunks,
    (case when random() > 0.4 THEN true else false end) as is_announce,
    ARRAY[10000, 10000, 10000, 10000] as list_stat_files,
    (case when random() > 0.4 THEN true else false end) as is_ts_playing_corrected,
    round( random() * 10 ) as content_subtype_id
from generate_series(0, 100);

SELECT count(filial_id) FROM stat.audios
WHERE date_trunc('month', ts_playing)::date = '2019-01-01'

from generate_series(0, 100 000);

Query OK, 100001 rows affected (execution time: 15,689 sec; total time: 15,708 sec)

-- SELECT count(filial_id) FROM stat.audios
-- WHERE date_trunc('month', ts_playing)::date = '2019-10-01'


--GROUP BY filial_id

-- 28.10.2019 23:40:41


-- select timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-12-28T23:00:00') as request_time,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as secret_key,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as device_key,
--        md5(random()::text) as app_version,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET real_ip,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET ip_address
-- from generate_series(0, 10);


