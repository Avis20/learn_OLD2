#!/usr/bin/perl

use uni::perl       qw| :dumper |;

my $answer;
my $count_try = 0;
while ( $count_try < 5 ){
    $answer = <>;
    chomp $answer;
    if ( $answer ne 1 ){
        $count_try++;
        warn "BAD";
    } else {
        last;
    }
}

die "BAD 2" unless $answer;

warn "END";

exit;