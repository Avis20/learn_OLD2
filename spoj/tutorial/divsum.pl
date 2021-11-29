#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;

my @result;
while (<>){
    my $number = $_;
    my $sum = 0;
    for (my $i = 1; $i < $number; $i++) {
        $sum += $i unless $number % $i;
    }
    push @result, $sum;
}

print "$_\n" for @result;

exit;