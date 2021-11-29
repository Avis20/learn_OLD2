#!/usr/bin/env perl


use uni::perl       qw| :dumper |;

my @arr = (1..10);

my %hash = map { test => $_ }, @arr;

warn dumper %hash;


exit;