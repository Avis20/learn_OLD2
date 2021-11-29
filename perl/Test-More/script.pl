#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;
use Test::More      qw| no_plan |;

my $got = {
    test  => [{t => 1,  q  => 'w'}],
    test2 => [{t2 => 1, q1 => 'w'}],
};

my $expected = {
    test => { test2 => 2 }
};

is_deeply($got, $expected, "test structure");


__DATA__
pass('test 1 ok');
pass('test 2 ok');
fail('test 3 ok');
fail('test 4 ok');


cmp_ok('1', '<', 2, "Test cmp_ok");


unlike('hello, world!', qr/you/, 'you is not matched');


is('test', 'more', 'fail test!!!');
is('Привет', 'Привет', 'Проверка eq');
isnt('Привет', 'Пока', 'Проверка ne');

ok('Привет' eq 'Привет', 'Проверка строки');
ok( 1 + 1 == 3, '1 + 1 = 3');
