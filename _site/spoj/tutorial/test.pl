#!/usr/local/bin/perl

__DATA__

# https://www.spoj.com/problems/SMPWOW/

my $count = <>;
print "W";
print "o" for (1..$count);
print "w";

__DATA__

my @result;
while (<>){
    $_ == 42 ? last : push @result, $_;
}

print "$_" for @result;

__DATA__

# test 1 https://www.spoj.com/problems/TESTINT/

my $a = <>;
my $b = <>;
print $a + $b;
