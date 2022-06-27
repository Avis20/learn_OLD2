#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

use Mojo::DOM;
use LWP::UserAgent;
use LWP::Simple;

my $url = $ARGV[0];
die "url is required " unless $url;

my $html = send_request($url);
my $dom = Mojo::DOM->new($html);

my $playlist = $dom->find('div.page-playlist__tracks-list')->first;
foreach my $track ( $playlist->find('div.d-track')->each ) {
    my $artist = $track->find('span.d-track__artists')->first();
    $artist = $artist->children->first->attr('title');
    my $name = $track->find('div.d-track__name')->first()->attr('title');
    $name =~ s/из игры(.*)//;
    $name =~ s/Original(.*)//i;
    $name =~ s/^\s+|\s+$//g;
    $artist = clean_str($artist);
    $name = clean_str($name);
    printf("%s - %s\n", $artist, $name);
}


exit;

sub send_request {
    my $url = shift;
    my $ua = LWP::UserAgent->new();
    my $res = $ua->get($url);
    my $str = clean_str($res->decoded_content);
    return $str;
}

sub clean_str {
    my $str = shift;
    $str =~ s/[\t\n]//g;
    $str =~ s/\\\"//g;
    return $str;
}
