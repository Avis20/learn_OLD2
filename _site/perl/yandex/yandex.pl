#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;
use Digest::MD5     qw| md5_hex |;
use LWP::UserAgent;
use HTTP::Request;

my %conf = (
    root    => 'https://payment.yandex.net/api/v3/payments',
    uri     => {
        create  => "/",
        get     => "/%s",
        capture => "/%s/capture",
    }, 
);

my $order = 332;
# warn md5_hex('create::'.$order);
warn dumper yandex();

sub yandex {
    my $host = 'https://qa2.fonmix.ru';
    my $url = $conf{root}.$conf{uri}{create};
    my $header = [
        'Content-Type' => 'application/json; charset=UTF-8',
        'Idempotence-Key' => md5_hex('create::'.$order),
    ];
    my $data = {
        "payment_method_data" => {
            "type" => "bank_card",
        },
        "amount"=> {
          "value"=> 15,
          "currency"=> 'RUB',
        },
        "confirmation"=> {
          "type"=> "redirect",
          "return_url"=> $host."/static/demo/thx.html",
        },
        "description"=> 'Заказ №'.$order,
    };
    my $encoded_data = encode_json($data);

    warn $encoded_data;

    # my $r = HTTP::Request->new('POST', $url, $header, $encoded_data);
    $r->authorization_basic(537722, 'test_9Twlco_KEnrQla8OdQN8nXhLsomDM2qcMNOc_Di3pCI');

    # my $ua = LWP::UserAgent->new();
    # my $h = HTTP::Headers->new();

    # my $response = $ua->request($r);
    # my $json_response = decode_json($response->content);

    # return $json_response;
}

exit;