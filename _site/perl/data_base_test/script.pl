#!/usr/local/env perl

use uni::perl       qw| :dumper |;

use DBI;

my $dbh = DBI->connect(
    'dbi:Pg:dbname=test;host=localhost;port=5432',
    'postgres',
    1234
);

my @header = qw/ID sname status city/;
my $format = ( "%s\t" x (scalar @header) )."\n";
printf $format, @header;

my @header_p = qw/ID jname city/;
my $format_p = "\t".( "%s\t" x (scalar @header_p) )."\n";

foreach my $supplier ( $dbh->selectall_array('select * from suppliers order by supplier_id asc', { Slice => {} } ) ) {
    printf $format,
        $supplier->{'supplier_id'},
        $supplier->{'sname'},
        $supplier->{'status'},
        $supplier->{'city'};

    my @projects = $dbh->selectall_array('
        select projects.* from projects
        join spj on spj.project_id = projects.project_id and supplier_id = ?
        group by projects.project_id
        order by projects.project_id asc
    ', { Slice => {} }, $supplier->{'supplier_id'} );

    printf $format_p, @header_p;
    foreach my $project ( @projects ) {
        printf $format_p, $project->{'project_id'},
            $project->{'jname'},
            $project->{'city'};
    };
}

exit;