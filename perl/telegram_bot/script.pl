#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

use LWP::UserAgent;
use HTTP::Request;

my $config = {
    'host' => 'api.telegram.org',
    'protocol' => 'https',
    'token' => 'bot618964065:AAG8SnRnZcp-cBDJeaWDPpFTrNV-PwXdW9s', # bot?
    'channel_id' => '-1001181519360',
    'proxy' => {
        'use_proxy' => 1,
        'ip' => '185.65.192.36',
        'port' => '8080',
    }
};

send_to_telegram('Привет');

sub send_to_telegram {
    my $message = shift;

    my $ua = new LWP::UserAgent;
    $ua->proxy(['http', 'https'], 'http://' . $config->{proxy}->{ip} . ':' . $config->{proxy}->{port})
      if $config->{proxy} && $config->{proxy}->{use_proxy};

    my $data = {
        chat_id => $config->{channel_id},
        text => $message,
    };
    my $uri = URI->new( $config->{protocol}.'://'.$config->{host}.'/'.$config->{token}.'/SendMessage' );
    $uri->query_form($data);

    my $req = new HTTP::Request('GET', $uri->as_string);

    my $res = $ua->request($req);

    if ($res->is_success) {
        my $json = decode_json( $res->decoded_content );
    }

    return 1;
}

__DATA__

my $ua = new LWP::UserAgent;

$ua->proxy(['http', 'https'], 'http://185.65.192.36:8080');

my $req = new HTTP::Request('GET', 'https://api.telegram.org/bot618964065:AAG8SnRnZcp-cBDJeaWDPpFTrNV-PwXdW9s/sendMessage?chat_id=@fonmix_api_notify&text=123');

my $res = $ua->request($req);

print $res->code, "\n";
print $res->decoded_content, "\n";

