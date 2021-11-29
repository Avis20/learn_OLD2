package MySort;
use uni::perl qw|:dumper|;

my $DEBUG = 1;

my $call = 0;

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
    my @a1 = @{ $left || [] };
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

sub merge_sort_old {
    my ( $array, $left, $right ) = @_;
    warn "origin array = @{$array}";
    warn "Call = " . ++$call if $DEBUG;
    warn "left = $left, right = $right; array = " . $color{light_cyan} if $DEBUG;
    warn map $array->[$_] . " ", $left..$right if $DEBUG;
    warn $color{nc} . "\n" if $DEBUG;
    return if $left >= $right;

    my $middle = int ( ($right + $left) / 2 );
    warn "middle = $middle\n" if $DEBUG;

    merge_sort( $array, $left, $middle );
    warn $color{red} . "first done!" . $color{nc} if $DEBUG;
    merge_sort( $array, $middle + 1, $right );
    warn "second done!" if $DEBUG;
    warn $color{orange} . "Call merge!" . $color{nc} if $DEBUG;
    merge2($array, $left, $middle, $right);
}

sub merge2 {
    my ($array, $left, $middle, $right) = @_;
    warn "left = $left, middle = $middle, right = $right" if $DEBUG;
    my @a1 = @{ $array || {} }[$left..$middle];
    my @a2 = @{ $array || {} }[( $middle + 1 )..$right];
    my @a3;
    warn "a1 = @a1, a2 = @a2";
    my ($i, $j) = (0, 0);
    while ( $i < @a1 && $j < @a2 ){
        warn "i = $i; j = $j\n";
        push @a3, ( $a1[$i] < $a2[$j] ? $a1[$i++] : $a2[$j++] );
    }

    push @a3, @a1[$i..$#a1] if ( $i < @a1 );
    push @a3, @a2[$j..$#a2] if ( $j < @a2 );
    warn "@a3" . "\n";
    @a3;
}


sub merge1 {
    my ($array, $left, $middle, $right) = @_;
    warn "left = $left, middle = $middle, right = $right" if $DEBUG;
    my $n1 = $middle - $left + 1;
    my $n2 = $right - $middle;
    warn "n1 = $n1; n2 = $n2" . "\n" if $DEBUG;
}

sub insertion_sort {
    my ( $array, $length ) = @_;
    for (my $i = 1; $i < $length; $i++) {
        warn "i = $i; curr el = $array->[$i]" if $DEBUG;
        my $tmp = $array->[$i];
        my $j = $i - 1;
        while ( $j >= 0 && $array->[$j] > $tmp ){
            warn "index = ".($j + 1)." = $array->[$j]" if $DEBUG;
            $array->[$j + 1] = $array->[$j];
            $j--;
        }
        warn "j = $j" if $DEBUG;
        warn "@{$array}" if $DEBUG;
        $array->[$j + 1] = $tmp;
        warn "@{$array}" if $DEBUG;
        warn "\n" if $DEBUG;
    }
    return @{ $array || [] };
}

sub selection_sort {
    my ( $array, $size ) = @_;
    for (my $i = 0; $i < $size; $i++) {
        warn "i = $i\n" if $ENV{DEBUG};
        my $small = $i;
        warn "i small = $small; el = $array->[$small]\n" if $ENV{DEBUG};
        for (my $j = $i + 1; $j < $size; $j++) {
            warn "j = $j" if $ENV{DEBUG};
            $small = $j if ( $array->[$j] < $array->[$small] );
        }
        warn "j small = $small; el = $array->[$small]\n" if $ENV{DEBUG};
        ( $array->[$i], $array->[$small] ) = ( $array->[$small], $array->[$i] );
    }
    return @{ $array || [] };
}

1;