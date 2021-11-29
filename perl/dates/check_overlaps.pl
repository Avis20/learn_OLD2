#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use Test::More      qw| no_plan |;
use DateTime;

my @variants = (
    # ok
    # {
    #     p1  => '2020-09-01/2020-09-10',
    #     p2  => '2020-09-15/2020-09-20',
    #     res => 'ok',
    # },
    # {
    #     p1  => '2020-09-20/2020-09-30',
    #     p2  => '2020-09-01/2020-09-19',
    #     res => 'ok',
    # },
    # {
    #     p1  => '2020-09-01/2020-09-10',
    #     p2  => '2020-09-11/2020-09-15',
    #     res => 'ok',
    # },
    # {
    #     p1  => '2020-09-17/2020-12-31',
    #     p2  => '2021-01-01/2021-03-31',
    #     res => 'ok',
    # },
    {
        p1  => '2020-09-17/2020-12-31',
        p2  => '2021-01-01/',
        res => 'ok',
    },

    # not ok
    # {
    #     p1  => '2020-09-17/2020-12-31',
    #     p2  => '2020-12-01/2021-03-31',
    #     res => 'not ok',
    # },
    # {
    #     p1  => '2020-09-01/2020-09-10',
    #     p2  => '2020-09-10/2020-09-15',
    #     res => 'not ok',
    # },
    # {
    #     p1  => '2020-09-01/2020-09-10',
    #     p2  => '2020-09-05/2020-09-15',
    #     res => 'not ok',
    # },
    {
        p1  => '2020-09-01/',
        p2  => '2020-09-05/2020-09-15',
        res => 'not ok',
    },
);

foreach my $var ( @variants ) {

    my %periods;
    foreach my $p ( qw/p1 p2/ ) {
        my ($d1, $d2) = split('/', $var->{$p});
        my @date1 = split('-', $d1);
        $d1 = DateTime->new( year => $date1[0], month => $date1[1], day => $date1[2] );
        my @date2 = split('-', $d2) if $d2;
        $d2 = DateTime->new( year => $date2[0], month => $date2[1], day => $date2[2] ) if $d2;
        $periods{$p} = {
            date_start => $d1,
            date_end => $d2,
        };
    };

    my $res = check_overlaps( $periods{p1}, $periods{p2} );
    warn "res=$res";

    ok( ( $var->{res} eq 'ok' ? $res == 0 : $res == 1 ), $var->{p1}.' == '.$var->{p2});
}

exit;

sub check_overlaps {
    my @periods = @_;
    
    my $prev_row;
    foreach my $period ( @periods ) {
        $period->{date_end} = DateTime->now()->add(years => 1000) unless $period->{date_end};
        warn $period->{date_start}.'/'.$period->{date_end};
        if ( $prev_row ) {
            if ( $period->{date_start} <= $prev_row->{date_start} || $period->{date_end} <= $prev_row->{date_start} || 
                 $period->{date_start} <= $prev_row->{date_end}   || $period->{date_end} <= $prev_row->{date_end}
                ) {
                return 1;
            };
        };
        $prev_row = $period;
    }
    return 0;
}