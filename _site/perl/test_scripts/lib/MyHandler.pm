package MyHandler;

sub sub_in_pm {
    my $p = shift;
    return  $p ? 'ok' : 'not ok';
}

1;