



select count(*) from stat.filial_activity;
select pg_size_pretty(pg_table_size('stat.filial_activity')) as table_size;
-- 7728 MB
select pg_size_pretty(pg_indexes_size('stat.filial_activity')) as index_size;
-- 2019-11- 6986 MB

insert into stat.filial_activity
select 
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as filial_key,
    timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-12-28T23:00:00') as ts_datetime,
    uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as device_key,
    md5(random()::text) as version,
    round( random() * 300 ) as count_request,
    round( random() * 10 ) as count_bad_request,
    random()::text as project_alias
from generate_series(0, 3000000);

-- select timestamp '2019-11-28T09:00:00' + random() * (timestamp '2019-10-28T00:00:00' - timestamp '2019-12-28T23:00:00') as request_time,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as secret_key,
--        uuid_in(md5(random()::text || clock_timestamp()::text)::cstring) as device_key,
--        md5(random()::text) as app_version,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET real_ip,
--        CONCAT(TRUNC(RANDOM() * 250 + 2), '.' , TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2), '.', TRUNC(RANDOM() * 250 + 2) )::INET ip_address
-- from generate_series(0, 10);


