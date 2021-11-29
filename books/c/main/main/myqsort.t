#!/usr/bin/env perl

use strict;
use warnings;

use Test::More  qw| no_plan |;
use lib::abs    qw| ./lib |;

use constant {
    DEBUG => $ENV{DEBUG} // 0,
};

my $prog = lib::abs::path('../build-main-Desktop-Debug/main');

open my $fh, '>', './file.txt' or die "Can't create file ./file.txt! $!";
my $text = qq(
Nostalgia
4LYN
Sin Shake Sin
Automatic
Deadset Society
Pensieri di Maria Giuliano
Paolo Vivaldi
Deception
Shurro
);
print $fh $text;
print "Исходный текст: \n$text\n" if DEBUG;
close $fh;

## Bad case: Start 

# subtest "Запуск без параметров; Ожидание = вывод аргументов программы" => sub {
#     my $res = cmd("$prog");
#     is( $res, "usage: main -n\n");
# };

subtest "Тест сортировки по убыванию; Ожидание = текст сортирован по убыванию" => sub {
    my $res = cmd("$prog < file.txt");
    my $expected = "\n4LYN\nAutomatic\nDeadset Society\nDeception\nNostalgia\nPaolo Vivaldi\nPensieri di Maria Giuliano\nShurro\nSin Shake Sin\n";
    
    warn "Got = \n$res\n; Expected = \n$expected\n;" if DEBUG > 1;
    is( $res, $expected );
};


exit;

sub cmd {
    my $cmd = shift;
    warn $cmd if DEBUG;
    my $res = qx| $cmd |;
    return $res;
}
