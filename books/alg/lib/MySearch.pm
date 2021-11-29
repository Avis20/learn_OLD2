package MySearch;
use uni::perl qw|:dumper|;

sub recursive_binary_search {
    my ($array, $left, $right, $item) = @_;
    return 'not found' if ( $left > $right );
    warn "left = $left; right = $right\n" if $ENV{DEBUG};
    my $middle = int ( ( $left + $right ) / 2 );
    warn "middle = $middle\n" if $ENV{DEBUG};
    warn "arr el = $array->[$middle] > item = $item\n" if $ENV{DEBUG};
    warn "\n\n" if $ENV{DEBUG};
    return $middle if ( $array->[$middle] == $item );
    if ($array->[$middle] > $item){
        recursive_binary_search($array, $left, $middle, $item);
    } else {
        recursive_binary_search($array, $middle, $right, $item);
    }
}

sub binary_search {
    my ( $array, $length, $item ) = @_;
    my ( $left, $right ) = ( 0, $length );
    my $c = 0;
    while ( $left <= $right ){
        $c++;
        warn "Iter = $c; left = $left; right = $right\n" if $ENV{DEBUG};
        my $middle = int ( ($right + $left) / 2 );
        warn "middle = $middle\n" if $ENV{DEBUG};
        return $middle if $array->[$middle] == $item;
        $array->[$middle] > $item ? $right = $middle : $left = $middle++;
        warn "arr el = $array->[$middle] > item = $item\n" if $ENV{DEBUG};
        warn "\n\n" if $ENV{DEBUG};
    }
    return 'not found';
}

sub recursive_linear_search {
    my ( $array, $length, $index, $item ) = @_;
    return 'not found' if $index > $length;
    return $index if $array->[$index] == $item;
    return recursive_linear_search($array, $length, ++$index, $item);
}

sub sentinel_linear_search {
    my ( $array, $length, $item ) = @_;
    return $length - 1 if $array->[$length - 1] == $item;
    $array->[$length - 1] = $item;
    my $index = 0;
    while ( $array->[$index] != $item ){
        $index++;
    }
    return $index if $index < $length - 1;
    return 'not found';
}

sub better_linear_search {
    my ( $array, $length, $item ) = @_;
    for (my $i = 0; $i < $length; $i++){
        return $i if $array->[$i] == $item;
    }
    return 'not found';
}

sub linear_search {
    my ( $array, $length, $item ) = @_;
    my $answer = 'not found';
    for (my $i = 0; $i < $length; $i++) {
        $answer = $i if $array->[$i] == $item;
    }
    return $answer;
}

1;