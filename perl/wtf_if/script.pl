#!/usr/bin/env perl
use strict;
use warnings;


my $s = 'hello';
if ( $s =~ m/^h(.+)/ && $1 ) {
    my $p = $1;
    if ( $p =~ m/e.*/ ) {
        warn $p;
    }
}


=head
my $lbuff = '#за 12/16 //авторское вознаграждение по дог 933/09-рн от 05.03.09 Сумма 12312-00 Без НДС#DBO#_SIGN_#';

if ( $lbuff =~ m/^\#(.+)\#$/ && $1 && $1 =~ m/\#/) {
    my $part = $1;
    warn "before =$lbuff---$part---$1" unless $part;
    my $old_part = quotemeta $part;
    $part =~ s/\#/&&35;/g;
    $lbuff =~ s/$old_part/$part/;
}

warn "after = $lbuff";


exit;