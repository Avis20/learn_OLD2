#!/usr/bin/env perl

use strict;
use warnings;

my $file_name = 'test.txt';
open my $fh, '+<', $file_name or die "Can't open $file_name: $!";
while ( <$fh> ) {
    print $_;
    $_ = 'dsadsa';
    print $fh $_;
};
close $fh;

