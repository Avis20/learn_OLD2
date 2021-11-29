package MySort;
use uni::perl qw|:dumper|;

my $DEBUG = 0;

sub merge_sort {
    my @array = @_;
    warn "origin array = @array" . "\n" if $DEBUG;
    my $lenght = @array;
    return @array if ( $lenght <= 1 );
    my $mid = int ( $lenght / 2 );
    my @left = merge_sort( @array[0..$mid - 1] );
    warn "left = @left" . "\n" if $DEBUG;
    my @right = merge_sort( @array[$mid..$lenght - 1] );
    warn "right = @right" . "\n" if $DEBUG;
    merge(\@left, \@right);
}

sub merge {
    my ($left, $right) = @_;
    my @a1 = @{ $left  || [] };
    my @a2 = @{ $right || [] };
    my @tmp;
    my ($i, $j) = (0, 0);
    while ( $i < @a1 && $j < @a2 ){
        warn "i = $i; j = $j\n" if $DEBUG;
        push @tmp, ( $a1[$i] < $a2[$j] ? $a1[$i++] : $a2[$j++] );
    }

    push @tmp, @a1[$i..$#a1] if ( $i < @a1 );
    push @tmp, @a2[$j..$#a2] if ( $j < @a2 );
    warn "@tmp" . "\n" if $DEBUG;
    @tmp;
}

sub insertion_sort {
    my @array = @_;

    for ( my $i = 1; $i < @array; $i++ ) {
        warn "\ni = $i; el = $array[$i]" if $DEBUG;
        my $tmp = $array[$i];
        my $j = $i - 1;
        while ( $j >= 0 && $array[$j] > $tmp ){
            warn "index = A[".($j + 1)."]($array[$j + 1]) = A[$j]($array[$j])" if $DEBUG;
            $array[$j + 1] = $array[$j];
            $j--;
        }
        warn "j = $j" if $DEBUG;
        warn "@array" if $DEBUG;
        $array[$j + 1] = $tmp;
        warn "@array" if $DEBUG;
    }

    return @array;
}

our %color = (
    red             => "\033[0;31m",
    green           => "\033[0;32m",
    orange          => "\033[0;33m",
    nc              => "\033[0m",
    white           => "\e[1;37m",
    black           => "\e[0;30m",
    blue            => "\e[0;34m",
    light_blue      => "\e[1;34m",
    green           => "\e[0;32m",
    light_green     => "\e[1;32m",
    cyan            => "\e[0;36m",
    light_cyan      => "\e[1;36m",
    red             => "\e[0;31m",
    light_red       => "\e[1;31m",
    purple          => "\e[0;35m",
    light_purple    => "\e[1;35m",
    brown           => "\e[0;33m",
    yellow          => "\e[1;33m",
    gray            => "\e[0;30m",
    light_gray      => "\e[0;37m",
);

1;