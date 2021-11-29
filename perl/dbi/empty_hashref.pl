#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use DBI;

my $dbh = DBI->connect(
    'dbi:Pg:dbname=fonmix_crm_dev;host=crm-database.local;port=5432',
    'fonmix_crm',
    'kei3meeGa9Ph'
);

my $res = $dbh->selectrow_hashref(
    "SELECT 1 AS send where 0 = 1", {}
);

warn dumper $res;
warn "is send = ".( $res ? 1 : 0 );

exit;

