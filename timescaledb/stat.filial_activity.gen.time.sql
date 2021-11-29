/*
CREATE TABLE stat.filial_activity2 (
    filial_key UUID NOT NULL,
    ts_datetime TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    device_key TEXT,
    version TEXT,
    count_request INTEGER DEFAULT 0 NOT NULL,
    count_bad_request INTEGER,
    project_alias TEXT DEFAULT 'fonmix.ru'::text,
    CONSTRAINT filial_activity_filial_key_datetime_project2 UNIQUE(filial_key, ts_datetime, project_alias)
);

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;
SELECT create_hypertable('stat.filial_activity2', 'ts_datetime', chunk_time_interval => interval '1 hour');

select count(*) from stat.filial_activity2;
select pg_size_pretty(pg_table_size('stat.filial_activity2')) as table_size;
select pg_size_pretty(pg_indexes_size('stat.filial_activity2')) as index_size;

SELECT * FROM hypertable_relation_size_pretty('stat.filial_activity2');

insert into stat.filial_activity2
select 
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as filial_key,
    timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-12-28T23:00:00') as ts_datetime,
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as device_key,
    md5(random()::text) as version,
    round( random() * 300 ) as count_request,
    round( random() * 10 ) as count_bad_request,
    random()::text as project_alias
from generate_series(0, 100 000);

*/

explain analyze
select * from stat.filial_activity
where filial_key = '6afd0c92-e86e-317f-0f3c-6f4ea9d62398' or filial_key = '01e7c666-a477-fab0-5ef4-3e88cdcd944b'
-- where date_trunc('day', ts_datetime) = '2019-11-28'
limit 10;

