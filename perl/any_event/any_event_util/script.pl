#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use AnyEvent::Util  qw| fork_call |;

# макс. кол-во воркеров 
$AnyEvent::Util::MAX_FORKS = 3;

my $cv = AnyEvent->condvar;

foreach my $item ( 0..100 ) {
    $cv->begin();
    fork_call {
        warn "\tSTART - $$; ";
        process();
    } sub {
       # my ($passwd) = @_;
       say dumper ( \@_ );
       say $@;
       $cv->end();
    };
}


$cv->recv;
undef $cv;

exit;

sub process {
    sleep 3;
    die 'ERRORRR!!!';
    return "END - $$";
}