package MyApp::Schema::TestDB;
use uni::perl qw/:dumper/;
use lib::abs '../../';

use Moose;
use MooseX::MarkAsMethods autoclean => 1;
extends 'DBIx::Class::Schema';

__PACKAGE__->load_namespaces(
    result_namespace        => '+MyApp::Schema::TestDB::Result',
    resultset_namespace     => '+MyApp::Schema::TestDB::ResultSet',
);

__PACKAGE__->meta->make_immutable(inline_constructor => 0);

1;
