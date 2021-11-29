#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use DateTime;


my %dates = (
    # date_start => '[2020_02_11-16_46.7z] WORK BEGINS: BANKF.txt Tue Feb 11 18:20:08 2020',
    # date_end => 'WORK ENDS: URL.txt -> Tue Feb 11 20:50:59 2020 Tue Feb 11 20:54:12 2020',
    date_start => '[2020_02_03-01_13.7z] WORK BEGINS: BANKF.txt Mon Feb  3 03:20:09 2020',
    date_end => 'WORK ENDS: URL.txt -> Mon Feb  3 05:52:01 2020 Mon Feb  3 05:54:51 2020',
);

my $start = ( split(' ', $dates{'date_start'} ))[-2];
my $end = ( split(' ', $dates{'date_end'} ))[-2];

my ($h, $m, $s) = split(':', $start);

my $dt_start = DateTime->new(
    year => 2020,
    hour => $h,
    minute => $m,
    second => $s,
);

warn $dt_start;

my ($h, $m, $s) = split(':', $end);

my $dt_end = DateTime->new(
    year => 2020,
    hour => $h,
    minute => $m,
    second => $s,
);

warn $dt_end;

my $diff = $dt_end - $dt_start;

say "hours = ".$diff->hours."; minutes = ".$diff->minutes."; seconds = ".$diff->seconds;

exit;