#!/usr/local/env perl

use uni::perl       qw| :dumper |;
use DBI;

my $dbh = DBI->connect(
    'dbi:Pg:dbname=ubuntu_vb;host=ubuntu_vb;port=5432', 'postgres', 1234
);

my $sql = 'EXPLAIN (ANALYZE, BUFFERS) SELECT * FROM foo;';

while (1) {
    my $res = $dbh->selectall_arrayref($sql, { Slice => {} });
    warn dumper $res;
    # system('clear');
    # sleep 1;
}

exit;