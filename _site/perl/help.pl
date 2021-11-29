#!/usr/local/bin/perl

use uni::perl       qw| :dumper |;

my %str = (
    # 'eng' => "now is the time for all good men to come to the aid of their party", # 8
    # 'rus' => "съешь этих мягких французских булок да выпей чаю", # 4
    'eng' => "the quick brown fox jumps over the lazy dog", # 0
    'rus' => "в чащах юга жил бы цитрус? да, но фальшивый экземпляр!", # 1
);

my %alphabet = ( 
    'eng' => { map { $_ => 0 } ( 'a'..'z' ) },
    'rus' => { map { $_ => 0 } qw( а б в г д е ё ж з и й к л м н о п р с т у ф х ц ч ш щ э ю я ) },
);

foreach my $key ( keys %str ){
    map { $alphabet{$key}{$_}++ } split //, $str{$key};
}

warn dumper map { my $key = $_; grep { !$alphabet{$key}{$_} } keys $alphabet{$key} } keys %alphabet;


__DATA__
my %hash = (
    'X3' => 'Q0',
    'X2' => 'Q1',
    'X1' => 'Q2',
    'X0' => 'Q3',

    'NX3' => 'NQ0',
    'NX2' => 'NQ1',
    'NX1' => 'NQ2',
    'NX0' => 'NQ3',
);

my %arr2 = (
    'D0' => "(NX₃) V (X₀ & X₂) V (X₀ & X₁)",
    'D1' => "(X₀ & X₂) V (X₀ & X₁) V (NX₀ & NX₂ & X₃) V (X₂ & NX₃)",
    'D2' => "(X₀ & X₂) V (X₁ & NX₂) V (X₁ & NX₃) V (X₀ & X₃)",
    'D3' => "(X₀ & X₁) V (NX₁ & X₂ & X₃) V (X₀ & NX₃)",
);

my %arr = (
    'D1' => "(X₀ & X₂) V (NX₁ & X₂ & NX₃) V (NX₀ & X₁ & X₃) V (X₀ & NX₃) V (X₀ & NX₁)",
);

foreach my $key ( sort keys %arr ){
    my $val = $arr{$key};
    my $res = '';
    $val =~ s/X₃/Q0/g;
    $val =~ s/X₂/Q1/g;
    $val =~ s/X₁/Q2/g;
    $val =~ s/X₀/Q3/g;
    # $val =~ s/\(NQ2 & Q1 & NQ0\)//g;
    # $val =~ s/\(Q2 & Q1 & Q0\)//g;
    # $val =~ s/\(Q3 & Q1\)//g;
    # $val =~ s/\(Q2 & Q1\)//g;
    say $key.' = '.$val;
}


=head
my $res;
    foreach ( split(' & ') ){
        my $f = 0;
        if ( $_ =~ m/^\(/ ){
            $res .= ' ( ';
        } elsif ( $_ =~ m/\)$/ ){
            $f = 1;
        }

        my $e = 0;
        $e = 1 if ( $_ =~ m/̅/ );
        $_ =~ s/[̅ ()  ]//;

        warn $_.'--'.$hash{$_};
        $res .= 'n' if $e;
        $res .= $hash{$_};
        $res .= ' ) ' if $f; 
    }
    $res .= ' V ';
};
warn "\n\n";
warn $res;
warn "\n\n";
exit;