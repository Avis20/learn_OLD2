#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;

my $test = 1;
if ( 1 && $test++ ){
    warn "if ok";
}
warn "test = $test";

if ( 0 > 0 ){
    warn "WTF???";
}

exit;