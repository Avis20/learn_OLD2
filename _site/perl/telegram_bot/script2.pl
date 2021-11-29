#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use HTTP::Request;
use LWP::UserAgent;

my $ua = new LWP::UserAgent;

$ua->proxy(['http', 'https'], 'http://185.65.192.36:8080');

my $req = new HTTP::Request('GET', 'https://api.telegram.org/bot618964065:AAG8SnRnZcp-cBDJeaWDPpFTrNV-PwXdW9s/sendMessage?chat_id=@fonmix_api_notify&text=123');

my $res = $ua->request($req);

print $res->code, "\n";
print $res->decoded_content, "\n";

exit;