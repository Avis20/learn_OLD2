#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

my @arr = (
314632,
321108,
331720,
343120,
343448,
343448,
343448,
);

for ( @arr ) {
    my $mm = $_ / 1024;
    say $mm;
}