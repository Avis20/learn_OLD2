#!/usr/local/bin/perl

use uni::perl qw|:dumper|;

# my @a1 = (1, 3, 4, 6, 9, 10);
# my @a2 = (2, 5, 7, 8, 11);

my @a1 = (9, 12);
my @a2 = (2);

my @a3;
my ($i, $j) = (0, 0);

while ( $i < @a1 && $j < @a2 ){
    warn "i = $i; j = $j\n";
    push @a3, ( $a1[$i] < $a2[$j] ? $a1[$i++] : $a2[$j++] );
}

push @a3, @a1[$i..$#a1] if ( $i < @a1 );
push @a3, @a2[$j..$#a2] if ( $j < @a2 );

warn "@a3";

__DATA__

int i=0, j=0, k=0;
while(i < a1.length && j < a2.length) {
  a3[k++] = a1[i] < a2[j] ? a1[i++] : a2[j++];
}
if(i< a1.length) {
  arraycopy(a1, i, a3, k, a1.length - i);
} else if(j< a2.length) {
  arraycopy(a2, j, a3, k, a2.length - j);
}

=head
# my @arr1 = (21, 23, 24, 40, 75, 76, 78, 77, 900, 2100, 2200, 2300, 2400, 2500);
# my @arr2 = (10, 11, 41, 50, 65, 86, 98, 101, 190, 1100, 1200, 3000, 5000);
my @arr1 = (12, 9, 3, 7, 14);
my @arr2 = (11, 6, 2, 10, 5);
my @arr3;

my $i = 0;
my $j = 0;
my $k = 0;
while ( $i < @arr1 && $j < @arr2 ){
    warn "k = $k; i = $i; j = $j";
    $arr3[$k++] = $arr1[$i] < $arr2[$j] ? $arr1[$i++] : $arr2[$j++];
}

warn "\n\n";
warn dumper \@arr3;

__DATA__
int i=0, j=0, k=0;
while(i < a1.length && j < a2.length) {
  a3[k++] = a1[i] < a2[j] ? a1[i++] : a2[j++];
}
if(i< a1.length) {
  arraycopy(a1, i, a3, k, a1.length - i);
} else if(j< a2.length) {
  arraycopy(a2, j, a3, k, a2.length - j);
}


my $lenght = scalar @arr1 + scalar @arr2;

my $i = 0;
my $j = 0;
for (my $k = 0; $k < $lenght; $k++) {
    warn "k = $k; i = $i; j = $j";
    if ( $i > scalar @arr1 - 1 ){
        my $tmp = $arr2[$j];
        $arr3[$k] = $tmp;
        $j++;
    } elsif ( $j > scalar @arr2 - 1 ){
        my $tmp = $arr1[$i];
        $arr3[$k] = $tmp;
        $i++;
    } elsif ( $arr1[$i] < $arr2[$j] ){
        my $tmp = $arr1[$i];
        $arr3[$k] = $tmp;
        $i++;
    } else {
        my $tmp = $arr2[$j];
        $arr3[$k] = $tmp;
        $j++;
    }
}

warn dumper \@arr3;
warn "\n\n";

__DATA__
int[] a1 = new int[] {21, 23, 24, 40, 75, 76, 78, 77, 900, 2100, 2200, 2300, 2400, 2500};
int[] a2 = new int[] {10, 11, 41, 50, 65, 86, 98, 101, 190, 1100, 1200, 3000, 5000};
int[] a3 = new int[a1.length + a2.length];

int i=0, j=0;
for (int k=0; k<a3.length; k++) {

    if (i > a1.length-1) {
        int a = a2[j];
        a3[k] = a;
        j++;
    }
    else if (j > a2.length-1) {
        int a = a1[i];
        a3[k] = a;
        i++;
    }
    else if (a1[i] < a2[j]) {
        int a = a1[i]; 
        a3[k] = a;
        i++;
    }
    else {
        int b = a2[j];
        a3[k] = b;
        j++;
    }
}


exit;