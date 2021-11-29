#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

my $response = readline(*STDIN);
chomp($response);

warn dumper $response;

exit;