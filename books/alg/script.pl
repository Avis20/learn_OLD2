#!/usr/local/bin/perl

use lib::abs        qw| ./lib |;
use uni::perl       qw| :dumper |;
use List::Util      qw| shuffle |;
use Benchmark;
use Test::More;

use MySearch;
use MySort;

my @origin_array = (12, 9, 7, 7, 10, 5, 7);
my @shuffle_array = @origin_array; # shuffle @origin_array;

my $length = scalar(@shuffle_array);
# my @sort_array = MySort::merge_sort(\@shuffle_array, 0, $length - 1);
my @sort_array = MySort::merge_sort(@shuffle_array);

warn "\n\n";
warn "result = @sort_array";


__DATA__
int[] a1 = new int[] {21, 23, 24, 40, 75, 76, 78, 77, 900, 2100, 2200, 2300, 2400, 2500};
int[] a2 = new int[] {10, 11, 41, 50, 65, 86, 98, 101, 190, 1100, 1200, 3000, 5000};

=head
my $check = 1;
my @origin_array = (0..999);
my @shuffle_array = shuffle @origin_array;

my $length = scalar(@shuffle_array);
my @sort_array = MySort::insertion_sort(\@shuffle_array, $length);

if ( $check ){
    foreach my $i ( 0..$length - 1 ){
        die "Array is different! origin_array = $origin_array[$i]; != $sort_array[$i]" if ( $origin_array[$i] != $sort_array[$i] );
    }
}


# warn dumper \@is_diff;

=head

my ( $shuffle, $check, $size ) = (0, 1, 99);

my @array = $shuffle ? shuffle (0..$size) : (0..$size);
my $length = scalar(@array);

my $item = int rand @array;
my $index = MySearch::recursive_binary_search( \@array, 0, $length, $item );
warn "item = $item; index = $index; check = $array[$index]" if $check;
ok( $item == $array[$index] ) if $check;

done_testing() if $check;

exit;



