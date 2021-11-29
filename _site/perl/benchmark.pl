#!/usr/local/bin/perl

use strict;
use warnings;
use uni::perl qw| :dumper |;
use Benchmark;

my @words = (qw(dsa dsafq fwqnjvreniop jop jop rkej[pb rekop[verw verwkobp[rewmboefr4 )) x 1200;

timethese(0, {
    foreach => sub {
        my %hash;
        foreach my $word ( @words ){
            $hash{ $word }++;
        }
    },
    for     => sub {
        my %hash;
        for ( @words ){
            $hash{ $_ }++;
        }
    }
});

exit;