#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use DateTime;

my @wdays = qw(Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье);

my %args = map { /^-(file|date_start|date_end)=(.*)/ ? ($1 => $2) : () } @ARGV;
die "-(file|date_start|date_end)" unless %args;

my $DEBUG = $ENV{DEBUG};

my $file_path;
unless ( $args{'file'} =~ /^\/home\// ){
    my $pwd = `pwd`;
    $pwd =~ s/\n//;
    $file_path = $pwd.'/'.$args{'file'};
} 

open my $fh, $file_path or die "Can't open $file_path: $!";

my @ds = split('-', $args{'date_start'} );
my $date_start = DateTime->new( year => $ds[0], month => $ds[1], day => $ds[2] );

my @de = split('-', $args{'date_end'} );
my $date_end = DateTime->new( year => $de[0], month => $de[1], day => $de[2] )->add( days => 1 );

my %total = map { $_ => { wday => $wdays[$_], sum => 0 } } 0..$#wdays;
while (<$fh>) {
    my ($date_send_epoch) = m/date_sent=\"(\w+)\"/;
    next unless $date_send_epoch;
    my $date_send = DateTime->from_epoch( epoch => $date_send_epoch/1000 )->set_time_zone('Europe/Moscow');
    next if $date_send < $date_start;
    next if $date_send > $date_end;
    next unless m/(Баланс|Карта)/;

    my $wday = $wdays[$date_send->wday()-1];

    my (undef, $sum) = m/(Платёж|Оплата|Покупка) (\w+)/;
    warn $date_send.' -- '.$wday. " --- ".$sum."\n\t".$_."\n" if $DEBUG;
    $sum =~ s/р//;
    foreach my $number ( keys %total ){
        $total{$number}->{'sum'} += $sum if $total{$number}->{'wday'} eq $wday;
    }
}

say;
foreach my $number ( sort keys %total ){
    printf("%s\t%s\n", $total{$number}->{'wday'}, $total{$number}->{'sum'});
}

close $fh;

exit;