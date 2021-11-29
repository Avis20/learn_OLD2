#!/usr/bin/env perl

package MyTest;

sub new {
    my ( $class, %params ) = @_;
    my $self = {};
    bless $self, $class;
    return $self;
};

sub test {
    my ( $self, $params ) = @_;
    warn "AAAAAAAAA";
    0;
}

1;

package main;

use uni::perl       qw| :dumper |;

# my $test = undef;# = MyTest->new();
my $test = MyTest->new();

warn "BBBBBBBB" unless $test && $test->test();



exit;

=head
my ( $cond1, $cond2 ) = (1,0);

warn "ok" unless $cond1 || $cond2;

exit;