package App;
use uni::perl qw|:dumper|;

sub sub_in_pm {
    my $p = shift;
    return $p->{'text2'} == 1 ? 'ok' : 'not ok';
}

1;