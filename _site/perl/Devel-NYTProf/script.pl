#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

use LWP::UserAgent;

my $ua = LWP::UserAgent->new();
sleep 3;
my $res = $ua->get("https://ya.ru/");

exit;