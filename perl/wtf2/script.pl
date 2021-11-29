#!/usr/bin/env perl

use uni::perl qw| :dumper |;

my $test1 = 'test1';
$ENV{TEST2} = 'test2';

use constant {
    TEST1 => $test1,
    TEST2 => $ENV{TEST2},
    TEST3 => $ENV{TEST3},
};

say TEST1;
say TEST2;
say TEST3;

exit;