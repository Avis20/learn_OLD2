#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

use LWP::UserAgent;
use HTTP::Request;

my $config = {
    'proxy' => {
        'use_proxy' => 1,
        'ip' => '193.150.107.150',
        'port' => '47898',
    }
};

open my $fh, '<', './work.txt';

for ( <$fh> ){
    chomp($_);
    my ( $ip, $port ) = split ':', $_;
    $config->{proxy}->{ip} = $ip;
    $config->{proxy}->{port} = $port;
    warn dumper $config;
    send_request();
}

close $fh;

# send_request();

sub send_request {
    my $message = shift;

    my $ua = new LWP::UserAgent;
    $ua->proxy(['http', 'https'], 'http://' . $config->{proxy}->{ip} . ':' . $config->{proxy}->{port})
      if $config->{proxy} && $config->{proxy}->{use_proxy};

    my $uri = URI->new('http://api.ipify.org?format=json');

    my $req = new HTTP::Request('GET', $uri->as_string);

    my $res = $ua->request($req);

    warn dumper $res->decoded_content;

    return 1;
}



__DATA__

BEGIN {
  $ENV{HTTPS_PROXY} = 'https://59.91.122.1:54086'; #Valid HTTPS proxy taken from http://hidemyass.com/proxy-list/
  $ENV{HTTPS_DEBUG} = 1;
}

send_request();

sub send_request {
    my $ua = LWP::UserAgent->new();
    # $ua->proxy('https', 'connect://proxyhost.domain:3128/');
    # $ua->proxy('http', 'http://105.235.197.190:8080');
    my $res = $ua->get('http://api.ipify.org?format=json');
    # my $res = $ua->get('http://10minutemail.com');

    # $req->header(
    #     'accept'          => 'application/json',
    #     'content-type'    => 'application/json',
    #     'authorization'   => 'Basic ' . encode_base64($config{Sign_in}->{login} . ':' . $config{Sign_in}->{password}),
    # );


    warn $res->decoded_content;

    # my $res_hash;
    # eval { $res_hash = decode_json($res->decoded_content) };
    # warn dumper $res_hash;
}

exit;