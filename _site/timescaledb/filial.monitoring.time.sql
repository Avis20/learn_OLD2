
create table filial.monitoring (
    secret_key uuid not null,
    device_key text not null,
    request_time integer not null, 
    app_version text not null,
    real_ip text,
    json_data jsonb default '{}'::jsonb,
    primary key (secret_key, device_key, request_time)
);

CREATE EXTENSION IF NOT EXISTS timescaledb CASCADE;

SELECT create_hypertable('filial.monitoring', 'request_time', chunk_time_interval => interval '1 day');


select * from
( select count(*) from filial.monitoring ) a,
( select pg_size_pretty(pg_table_size('filial.monitoring')) as table_size ) b,
( select pg_size_pretty(pg_indexes_size('filial.monitoring')) as index_size ) c;

select * from
( select count(*) from filial.monitoring ) a,
( select pg_size_pretty(pg_table_size('filial.monitoring')) as table_size ) b,
( select pg_size_pretty(pg_indexes_size('filial.monitoring')) as index_size ) c;

