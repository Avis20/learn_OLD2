#!/usr/bin/perl

use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

use External::Daemon;

use constant {
    SLEEP => 3,
};

my $process = new External::Daemon (
    pidfile     => './test/test.pid',
    name        => 'sleep-d',
);
# $process->start;

my $command = '/usr/bin/perl worker.pl %s';

while (1){
    warn "".localtime(time);

    my $command = sprintf($command, './time_sleep.txt '.' &');
    warn $command;
    system( $command ) == 0 or $process->log->error( 'Can not start worker! : ['.$command.']' );

    sleep SLEEP;
}

exit;
