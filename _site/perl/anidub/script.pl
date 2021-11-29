#!/usr/local/env perl

use utf8;
use strict;
use warnings;

use LWP::UserAgent;
use Mojo::DOM;

use constant {
    DEBUG    => 1,
    MAX_RATE => 4.8,
    MAX_PAGE => 30,
    # URL_TT   => 'https://online.anidub.com/anime_movie/page/%s/',
    URL_TT   => 'https://online.anidub.com/anime/full/page/%s/',
};

$| = 1;

for (1..MAX_PAGE){
    my $page = sprintf(URL_TT, $_);
    warn "GET $page" if DEBUG;
    my $html = send_request($page);
    search($html);
}

exit;

sub search {
    my $html = shift;
    my $dom = Mojo::DOM->new( $html );
    for my $e ($dom->find('div.news_short')->each){
        my $name = $e->find('span.newsmore')->first;
        my $poster = $e->find('div.poster_img')->first;
        my ($image) = map {$_->attr('data-original')} $poster->find('img')->first;
        for my $rate_box ( $e->find('div.rate_box')->each ){
            for my $rate ( $rate_box->find('b')->each ){
                if ( $rate->text >= MAX_RATE ){
                    my ($title) = map {$_->attr('title')} $name->children->first;
                    $title =~ s/Смотреть //g;
                    my ($href) = map {$_->attr('href')} $name->children->first;
                    printf("%s %s - %s ![Картинка](%s)\n", $rate->text, $title, $href, $image);
                }
            }
        }
    }
}

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
