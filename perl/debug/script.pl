#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;

print "Hello";
print "world";

my $hello = {
    test => 1,
};
warn dumper $hello;
test();

sub test {
    print 1;
    die;
}

exit;