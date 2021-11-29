#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

my $errcode = 405;

warn dumper error_template('custom', 'dsa');

exit;

sub error_template {
    my ( $err_code, $error_message ) = @_;


    my $res = {
        1   =>  [200, 'Ошибка',                                         200],
        100 =>  [100, 'Ошибка валидации',                               200],
        200 =>  [200, 'Пользователь не авторизован',                    200],

        400 =>  [400,   'Bad request',                                  200],
        403 =>  [403,   'Доступ запрещен. Недостаточно прав доступа',   200],
        404 =>  [404,   'Объект не найден',                             200],

        custom =>  ['0', '', 200],
    }->{$err_code} || [999,   'Неизвестная ошибка',                     200];

    # В $res окажется не весь список объектов, а только один т.к. идет обращение к анонимному хешу напрямую

    my $json_data = {
        success     => 0,
        errcode     => $res->[0],
        errmess     => $res->[1] && $error_message ? $res->[1].': '.$error_message : ($res->[1] || $error_message),
    };

    return $json_data;
}