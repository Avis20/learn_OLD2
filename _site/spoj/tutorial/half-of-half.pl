#!/usr/local/bin/perl

my $count = <>;
my @result;
for (1..$count){
    chomp( my $str = <> );
    my $str_half = '';
    my @array = split '', $str;
    for (my $i = 0; $i < int(@array / 2); $i++) {
        $str_half .= $array[$i] unless $i % 2;
    }
    push @result, $str_half;
}

print "$_\n" for @result;

exit;