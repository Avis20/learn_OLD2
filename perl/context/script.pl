#!/usr/bin/env perl

use uni::perl   qw| :dumper |;
use Want        qw| howmany |;

sub func {
    say howmany() // 'Undefined';
    return;
}

func();                       # 0
my $x = func();               # 1
my ($x1) = func();            # 1
my ($x1, $x2) = func();       # 2
my ($x1, $x2, $x3) = func();  # 3

my @list = func();    # Undefined
my %hash = func();    # Undefined


=head
use Want        qw| want |;

sub func {

    if (want('VOID')) {
        say 'VOID';
        return;
    }
    if (want('ARRAY')) {
        say 'ARRAY';
        return [4, 5, 6];
    }
    if (want('HASH')) {
        say 'HASH';
        return { 'hello' => 'world' };
    }
    if (want('CODE')) {
        say 'CODE';
        return sub { say 'hi' };
    }
    if (want('SCALAR')) {
        say 'SCALAR';
        return 42;
    }
    if (want('LIST')) {
        say 'LIST';
        return (1, 2);
    }

    die 'OTHER';
}

func();                         # VOID
say();
my $x = func();                 # SCALAR
warn $x;
say();
my @a = func();                 # LIST
warn dumper \@a;
say();
my $y = func()->[0];            # ARRAY
warn $y;
say();
my $h = func()->{'hello'};      # HASH
warn $h;
say();
my $f = func()->();             # CODE
warn $f;
say();
print func();                   # LIST
say func();                     # LIST
scalar func();                  # SCALAR
say();
my %hash = (
    res => func(),              # LIST. Все эл. списка превратяться в key:value
);

warn dumper \%hash;

=head
sub func {
    my $context = wantarray();
    my $result;
    if ( defined $context ) {
        if ( $context ) {
            $result = 'list context';
        } else {
            $result = 'scalar context';
        }
    } else {
        say 'void context';
    }
    return $result;
}

func();

my $scalar = func();
warn $scalar;

my @list = func();
warn $list[0];

=head
sub func {
    my ($context) = @_;
    my $result = wantarray;
    say('Context is '.$context);
    say('Defined?'.defined $result ? 'defined' : 'undefined');
    say('Result equals = '.($result eq '' ? 'empty string' : $result));
    say();
}

func('void');
my $x = func('scalar');
my @y = func('list');

=head
# scalar context
my $time = localtime();
say $time;

# undef context
say localtime();

# list context
my @arr = localtime();
warn dumper \@arr;
=cut