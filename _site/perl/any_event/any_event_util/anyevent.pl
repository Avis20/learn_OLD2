#!/usr/bin/env perl

use Mojolicious::Lite;
use EV;
use AnyEvent;
use AnyEvent::Util;

get '/' => sub {
  my $self = shift;

  # Run Perl oneliner in separate process and capture STDOUT
  fork_call {
    open my $fh, '-|', qq/perl -E'say "hi!"'/ or die "Oneliner: $!";
    local $/;
    return <$fh>;
  }
  sub {
    my $result = shift;
    $self->render(text => "Result: $result");
  };
};

app->start;