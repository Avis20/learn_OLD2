#!/usr/local/bin/perl

use lib::abs        qw| ./lib |;
use uni::perl       qw| :dumper |;
use List::Util      qw| shuffle |;
use Benchmark;
use Test::More;

use MySort;

my @origin_array = (5, 2, 4, 6, 1, 3);
my @shuffle_array = @origin_array; # shuffle @origin_array;

my @sort_array = MySort::merge_sort(@origin_array);

warn "\n\n";
warn "result = @sort_array";
