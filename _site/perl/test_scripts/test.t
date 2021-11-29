#!/usr/local/env perl

use strict;
use warnings;
use Test::More      qw| no_plan |;

require 'script.pl';

ok(main(), 1);