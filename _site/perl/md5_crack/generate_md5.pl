#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use Digest::MD5     qw| md5_hex |;

my $str = 'test';
say md5_hex($str);

exit;