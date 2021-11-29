#!/usr/bin/env perl

=head SYNOPSIS
    Скачивание файлов из html
=cut 

use uni::perl qw| :dumper |;
use JSON::XS  qw| decode_json encode_json |;

use Mojo::DOM;
use LWP::UserAgent;
use LWP::Simple;

<<<<<<< HEAD
my $url = $ARGV[0];
say $url;

my $dir = './result';
my $tt = '%s/%s-%s.%s';

my ($data_name_pref) = ( split('\/', $url) )[-1];
$data_name_pref =~ s/\.html//;

my $html = send_request($url);
my $dom = Mojo::DOM->new($html);

# img poster
my $post_img = $dom->find('div.post-img')->first;
my $img_src = $post_img->children->first->attr('src');
my $img_path = sprintf($tt, $dir, $data_name_pref, 'poster', 'png');
getstore($img_src, $img_path);

# mp3 bronze, silver
foreach my $p_data ( $dom->find('script.cue-playlist-data')->each ) {
    my $hash = decode_json($p_data->all_text);

    foreach my $item ( @{ $hash->{tracks} || {} } ) {
        my ($mp3_name) = $item->{mp3} =~ m/(\w+)\.mp3$/;
        
        my $preffix;
        if ( $mp3_name =~ /bronze/ ) {
            $preffix = 'bronze';
            $preffix = 'bronzeapp' if ( $mp3_name =~ /bronzeapp/ );
        } elsif ( $mp3_name =~ /silver/ ) {
            $preffix = 'silver';
            $preffix = 'silverapp' if ( $mp3_name =~ /silverapp/ );
        };
        next unless $preffix;
        my $mp3_path = sprintf($tt, $dir, $data_name_pref, $preffix, 'mp3');
        warn sprintf('%s -- %s', $item->{title}, $mp3_path);
        getstore($item->{mp3}, $mp3_path);
    };
};

# img exercise
foreach my $figure ( $dom->find('figure[data-element="main"][data-content-type="image"][data-appearance="full-width"]')->each ) {
    my $img = $figure->find('img')->first;
    next unless $img->attr('src') =~ /Exercise/ig;
    my $img_path = sprintf($tt, $dir, $data_name_pref, 'exercise', 'png');
    getstore($img->attr('src'), $img_path);
=======
my $dir = './result';
my $tt = '%s/%s-%s.%s';

my $type = $ARGV[0];
say $type;

my $url = $ARGV[1];
say $url;

my ($data_name_pref) = ( split('\/', $url) )[-1];
$data_name_pref =~ s/\.html//;
say $data_name_pref;

my $sub = \&{ $type };
$sub->();

sub rhythms {

    my $html = send_request($url);
    my $dom = Mojo::DOM->new($html);

    # img poster
    my $post_img = $dom->find('img.pagebuilder-mobile-hidden')->first;
    warn "\n\n";
    warn dumper $post_img->attr('src');
    warn "\n\n";
    # my $img_src = $post_img->children->first->attr('src');
    # my $img_path = sprintf($tt, $dir, $data_name_pref, 'poster', 'png');
    # getstore($img_src, $img_path);

}

sub rudiments {

    my $html = send_request($url);
    my $dom = Mojo::DOM->new($html);

    # img poster
    my $post_img = $dom->find('div.post-img')->first;
    my $img_src = $post_img->children->first->attr('src');
    my $img_path = sprintf($tt, $dir, $data_name_pref, 'poster', 'png');
    getstore($img_src, $img_path);

    # mp3 bronze, silver
    foreach my $p_data ( $dom->find('script.cue-playlist-data')->each ) {
        my $hash = decode_json($p_data->all_text);

        foreach my $item ( @{ $hash->{tracks} || {} } ) {
            my ($mp3_name) = $item->{mp3} =~ m/(\w+)\.mp3$/;
            
            my $preffix;
            if ( $mp3_name =~ /bronze/ ) {
                $preffix = 'bronze';
                $preffix = 'bronzeapp' if ( $mp3_name =~ /bronzeapp/ );
            } elsif ( $mp3_name =~ /silver/ ) {
                $preffix = 'silver';
                $preffix = 'silverapp' if ( $mp3_name =~ /silverapp/ );
            };
            next unless $preffix;
            my $mp3_path = sprintf($tt, $dir, $data_name_pref, $preffix, 'mp3');
            warn sprintf('%s -- %s', $item->{title}, $mp3_path);
            getstore($item->{mp3}, $mp3_path);
        };
    };

    # img exercise
    foreach my $figure ( $dom->find('figure[data-element="main"][data-content-type="image"][data-appearance="full-width"]')->each ) {
        my $img = $figure->find('img')->first;
        next unless $img->attr('src') =~ /Exercise/ig;
        my $img_path = sprintf($tt, $dir, $data_name_pref, 'exercise', 'png');
        getstore($img->attr('src'), $img_path);
    }

>>>>>>> eeb003753c31e84a71c5e07856cf62719389c50f
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
