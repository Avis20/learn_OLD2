package MyApp::Model::TestDB;

use base 'Catalyst::Model::DBIC::Schema';

__PACKAGE__->config(
    schema_class => 'MyApp::Schema::TestDB',
    connect_info => [
        'dbi:Pg:dbname=timescaledb_test;host=localhost;port=5432',
        'postgres',
        1234
    ]
);

1;
