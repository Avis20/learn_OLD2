#!/usr/local/bin/perl

use lib::abs        qw| ./lib |;
use uni::perl       qw| :dumper |;
use List::Util      qw| shuffle |;
use Benchmark;
use Test::More;

use MySearch;
use MySort;

my ( $check, $size) = ( 1, 9999 );
my @origin_array = (0..$size);
my $length = scalar(@origin_array);

timethese(0, {
    'insertion' =>  sub {
        my @shuffle_array = shuffle @origin_array;
        my @sort_array = MySort::insertion_sort(\@shuffle_array, $length);
        check_sort(\@sort_array, \@origin_array) if $check;
    },
    'selection' =>  sub {
        my @shuffle_array = shuffle @origin_array;
        my @sort_array = MySort::selection_sort(\@shuffle_array, $length);
        check_sort(\@sort_array, \@origin_array) if $check;
    },
    'origin' => sub {
        my @shuffle_array = shuffle @origin_array;
        my @sort_array = sort { $a <=> $b } @shuffle_array;
        check_sort(\@sort_array, \@origin_array);
    }
});

sub check_sort {
    my ( $origin_array, $sort_array ) = @_;

    foreach my $i ( 0..$length - 1 ){
        die "Array is different! origin_array = $origin_array->[$i]; sort_array = $sort_array->[$i]; "
          if ( $origin_array->[$i] != $sort_array->[$i] );
    }
}

=head

my ( $shuffle, $check, $size ) = (0, 0, 999);

my @origin_array = (0..$size);
my @shuffle_array = shuffle @origin_array;

my $length = scalar(@shuffle_array);

my @sort_array = MySort::selection_sort(\@shuffle_array, $length);

timethese(0, {
    'binary' => sub {
        my $item = int rand @array;
        my $index = MySearch::binary_search( \@array, $length, $item );
        ok( $item == $array[$index] ) if $check;
    },
    'rec_binary' => sub {
        my $item = int rand @array;
        my $index = MySearch::recursive_binary_search( \@array, 0, $length, $item );
        ok( $item == $array[$index] ) if $check;
    },
});

done_testing() if $check; 

exit;