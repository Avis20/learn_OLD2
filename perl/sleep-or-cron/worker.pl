#!/usr/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

sleep 1;
open my $fh, '>>', $ARGV[0] or die "Can't open ./time_sleep.txt: $!";
print $fh "".localtime(time)."\n";
close $fh;


exit;