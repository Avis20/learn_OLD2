


select * from
( select count(*) from stat.audios_hyper ) a,
( select pg_size_pretty(pg_table_size('stat.audios_hyper')) as table_size ) b,
( select pg_size_pretty(pg_indexes_size('stat.audios_hyper')) as index_size ) c;

SELECT * FROM hypertable_relation_size_pretty('stat.audios_hyper');


CREATE TABLE stat.audios_hyper (
  audio_id UUID NOT NULL,
  filial_id INTEGER NOT NULL,
  ts_playing TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
  count_chunks INTEGER NOT NULL,
  is_announce BOOLEAN DEFAULT false NOT NULL,
  list_stat_files INTEGER [] NOT NULL,
  is_ts_playing_corrected BOOLEAN DEFAULT false NOT NULL,
  id BIGSERIAL,
  content_subtype_id INTEGER,
  CONSTRAINT audios_pkey2 PRIMARY KEY(id)
) 
WITH (fillfactor = 90, oids = false);

CREATE INDEX audio_id_ts_playing_idx22 ON stat.audios_hyper USING btree (ts_playing, audio_id);
CREATE INDEX audios_audio_idx2 ON stat.audios_hyper USING btree (audio_id);

CREATE INDEX audios_filial_idx2 ON stat.audios_hyper USING btree (filial_id);

CREATE INDEX audios_idx2 ON stat.audios_hyper USING btree (audio_id, filial_id, ts_playing);

CREATE INDEX "audios_idx_fm-35002" ON stat.audios_hyper USING btree (((date_trunc('month'::text, ts_playing))::date), audio_id, filial_id, is_announce);

CREATE UNIQUE INDEX ts_playing_audio_id_filial_id_uniq2 ON stat.audios_hyper USING btree (ts_playing, audio_id, filial_id);

CREATE UNIQUE INDEX audios_hyper_idx ON stat.audios_hyper USING btree (audio_id, filial_id, ts_playing);

SELECT create_hypertable('stat.audios_hyper', 'ts_playing', chunk_time_interval => interval '1 month');

insert into stat.audios_hyper (audio_id, filial_id, ts_playing, count_chunks, is_announce, list_stat_files, is_ts_playing_corrected, content_subtype_id)
select
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as audio_id,
    round( random() * 300 ) as filial_id,
    timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-11-28T23:00:00') as ts_playing,
    round( random() * 50 ) as count_chunks,
    (case when random() > 0.4 THEN true else false end) as is_announce,
    ARRAY[10000, 10000, 10000, 10000] as list_stat_files,
    (case when random() > 0.4 THEN true else false end) as is_ts_playing_corrected,
    round( random() * 10 ) as content_subtype_id
from generate_series(0, 2000000);

SELECT count( distinct(filial_id) ) FROM stat.audios_hyper
WHERE date_trunc('month', ts_playing)::date = '2019-10-01'

SELECT drop_chunks(interval '24 hours', 'stat.audios_hyper');

-- GROUP BY filial_id
-- 28.10.2019 23:40:41


-- select timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-12-28T23:00:00') as request_time,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as secret_key,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as device_key,
--        md5(random()::text) as app_version,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET real_ip,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET ip_address
-- from generate_series(0, 10);


