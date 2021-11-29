#!/usr/local/env perl

use uni::perl qw| :dumper |;
use lib::abs  qw| ./lib |;

use MyHandler;

main() if not caller; # for testing in test script

sub main {

    # say "Основная функия скрипта";

    # say MyHandler::sub_in_pm();
    # say MyHandler::sub_in_pm(1);
};

exit 1;