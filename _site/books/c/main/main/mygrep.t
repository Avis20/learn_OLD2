#!/usr/bin/env perl

use strict;
use warnings;

use Test::More  qw| no_plan |;
use lib::abs    qw| ./lib |;

use constant {
    PATTERN     => 'hell',
    ANTIPATTERN => 'work',
    DEBUG       => $ENV{DEBUG} // 0,
};

my $prog = lib::abs::path('../build-main-Desktop-Debug/main');

open my $fh, '>', './file.txt' or die "Can't create file ./file.txt! $!";
my $text = qq(
hi
hello world
world test alarm
);
print $fh $text;
print "Исходный текст: \n$text\n" if DEBUG;
close $fh;

## Bad case: Start 

subtest "Запуск без параметров; Ожидание = вывод аргументов программы" => sub {
    my $res = cmd("$prog");
    is( $res, "usage: main -x -n pattern\n");
};

subtest "Запуск 2-мя параметрами; Ожидание = вывод аргументов программы" => sub {
    my $res = cmd("$prog ".PATTERN.' '.ANTIPATTERN);
    is( $res, "usage: main -x -n pattern\n");
};

subtest "Запуск 99-ю параметрами; Ожидание = вывод аргументов программы" => sub {
    my $res = cmd("$prog ".( 'test 'x99 ));
    is( $res, "usage: main -x -n pattern\n");
};

subtest "Запуск без ключей но с '-'; Ожидание = вывод аргументов программы" => sub {
    my $res = cmd("$prog -");
    is( $res, "usage: main -x -n pattern\n");
};

subtest "Запуск несуществующими ключами; Ожидание = ошибка ключа" => sub {
    my $res = cmd("$prog -t");
    is( $res, "mygrep: illegal options t\nusage: main -x -n pattern\n");
};


subtest "Поиск '".ANTIPATTERN."' строки; Ожидание = не будет найден" => sub {
    my $res = cmd("$prog ".ANTIPATTERN.' < file.txt');
    is( $res, '');
};

## Good case: Start 
subtest "Поиск '".PATTERN."' строки; Ожидание = будет найден" => sub {
    my $res = cmd("$prog ".PATTERN.' < file.txt');
    is( $res, "hello world\n");
};

### with keys

subtest "Проверка ключа -n; Ожидание = будет найден" => sub {
    my $res = cmd("$prog -n ".PATTERN.' < file.txt');
    is( $res, "3:hello world\n");
};

subtest "Проверка ключа -x; Ожидание = будет выведен весь список кроме тех которые в шаблоне" => sub {
    my $res = cmd("$prog -x ".PATTERN.' < file.txt');
    is( $res, "\nhi\nworld test alarm\n");
};

subtest "Запуск с ключами -n и -x; Ожидание = будет выведен весь список, где не найден шаблон + номера строк" => sub {
    my $res = cmd("$prog -n -x ".PATTERN.' < file.txt');
    is( $res, "1:\n2:hi\n4:world test alarm\n");
};

subtest "Запуск с ключами -nx; Ожидание = будет выведен весь список, где не найден шаблон + номера строк" => sub {
    my $res = cmd("$prog -nx ".PATTERN.' < file.txt');
    is( $res, "1:\n2:hi\n4:world test alarm\n");
};


exit;

sub cmd {
    my $cmd = shift;
    warn $cmd if DEBUG;
    my $res = qx| $cmd |;
    return $res;
}
