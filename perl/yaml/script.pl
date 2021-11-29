#!/usr/local/bin/perl

use uni::perl   qw| :dumper  |;
use YAML::XS    qw| LoadFile |;

my $config = LoadFile('test.yml');

warn dumper $config;

exit;