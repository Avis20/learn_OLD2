package MyApp::Schema::TestDB::Result::Public::Monitor;
use uni::perl       qw| :dumper |;
use lib::abs        qw| ../../../../../../lib |;

use base 'DBIx::Class::Core';

__PACKAGE__->load_components('InflateColumn::DateTime');
__PACKAGE__->table('public.monitor');
__PACKAGE__->add_columns(
    'secret_key',
        {
            data_type           => 'uuid',
            is_nullable         => 0,
        },
    'device_key',
        {
            data_type           => 'text',
            is_nullable         => 1,
        },
    'app_version',
        {
            data_type           => 'text',
            is_nullable         => 1,
        },
    'real_ip',
        {
            data_type           => 'text',
            is_nullable         => 1,
        },
    'request_time',
        {
            data_type           => 'integer',
            is_nullable         => 1,
        },
    'json_data',
        {
            data_type           => 'json',
            is_nullable         => 1,
        },
);

__PACKAGE__->set_primary_key('secret_key');

1;
