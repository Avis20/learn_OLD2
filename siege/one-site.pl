#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

my $site = $ARGV[0];

# my $command = "siege -b -c50 -t60S -v $site";
my $command = "siege -b -c10 -v http://$site";

curl --location --request GET 'http://fonmix.local//api/yellow/player/info?with=contracts&with=services' \
--header 'X-Player-Secret-Key: 5a65fbe1-dc89-55d7-03de-0f0903da29db' \
--header 'X-Player-Device-Key: 111' \
--header 'X-Player-Version: 1'

cmd($command);

exit;

sub cmd {
    my $cmd = shift;
    warn $cmd;
    my $res = system( $cmd );
    return $res;
}
