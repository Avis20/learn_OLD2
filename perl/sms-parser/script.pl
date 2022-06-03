#!/usr/bin/env perl

use uni::perl       qw| :dumper |;
use DateTime;

my @wdays = qw(Понедельник Вторник Среда Четверг Пятница Суббота Воскресенье);

my %args = map { /^-(file|date_start|date_end|week|year)=(.*)/ ? ($1 => $2) : () } @ARGV;
die "-(file|date_start|date_end|week)" unless %args;

my %COLOR = (
    'orange' => "\e[0;33m%s\e[0m\n",
    'green'  => "\e[0;32m%s\e[0m\n",
    'red'    => "\e[1;31m%s\e[0m\n",
);

my $DEBUG = $ENV{DEBUG};

my $file_path;
unless ( $args{'file'} =~ /^\/home\// ){
    my $pwd = `pwd`;
    $pwd =~ s/\n//;
    $file_path = $pwd.'/'.$args{'file'};
} else {
    $file_path = $args{'file'};
} 

open my $fh, $file_path or die "Can't open $file_path: $!";

my ( @ds, @de );
if ( $args{'date_start'} && $args{'date_end'} ) {
    @ds = split('-', $args{'date_start'} );
    @de = split('-', $args{'date_end'} );
} elsif ( $args{'week'} && $args{'year'} ) {
    $ds[0] = $de[0] = $args{'year'};
    my ( $w1, $w2 ) = split('\/', $args{'week'});
    ( $ds[2], $ds[1] ) = split('-', $w1);
    ( $de[2], $de[1] ) = split('-', $w2);
}

my $date_start = DateTime->new( year => $ds[0], month => $ds[1], day => $ds[2] );
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
    my (undef, $s1, $s2) = m/(Платёж|Оплата|Покупка|Выдача|Снятие) ([0-9]( ?[0-9])+)/;
    # my (undef, $s1, $s2) = m/(зачислено) ([0-9]( ?[0-9])+)/; # Для зп
    my $sum = $s1;
    $sum =~ s/\W//g;
    warn $date_send.' -- '.$wday. " --- ".( $sum >= 1000 ? sprintf($COLOR{green}, $sum) : $sum )."\n\t".$_."\n" if $DEBUG;
    $sum =~ s/р//;
    foreach my $number ( keys %total ){
        $total{$number}->{'sum'} += $sum if $total{$number}->{'wday'} eq $wday;
    }
}

print("\n");
foreach my $number ( 6,7,0,1,2,3,4,5 ){
    next unless defined $total{$number}->{'sum'};
    printf("%s\t%s\n", $total{$number}->{'wday'}, $total{$number}->{'sum'});
}

foreach my $number ( 6,7,0,1,2,3,4,5 ){
    next unless defined $total{$number}->{'sum'};
    printf("%s\n", $total{$number}->{'sum'});
}

foreach my $number ( 6,7,0,1,2,3,4,5 ) {
    next unless defined $total{$number}->{'sum'};
    printf("%s\t", $total{$number}->{'sum'});
}
print("\n");

close $fh;
exit;
