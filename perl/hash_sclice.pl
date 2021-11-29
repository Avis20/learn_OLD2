#!/usr/bin/perl


my %sanitised_values = (
    'test' => 1,
    'test2' => 2,
);

my @allowed_keys = ('test');

warn %input_values{@allowed_keys};

exit;