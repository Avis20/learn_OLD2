#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use Image::Magick;

use constant {
    DENSITY => 100,
    QUALITY => 100,
};

my $pdf = Image::Magick->new();
$pdf->Read('pdf:source/Lorem.pdf');

my $stamp = Image::Magick->new();
stamp->Read('png:source/stamp.png');

$pdf->Composite( image => $stamp, compose=>'over' );
$pdf->Set( quality => 100 );

$pdf->Write("pdf:res/Lorem.pdf");


=head

$image = change($image);

my $filename = 'res/Lorem.png';
# system("rm -rf res && mkdir res");
open my $fh, '>', $filename or die "Can't open $filename: $!";
$image->Write(file => \*$fh, filename => $filename, density => "240x240");
close $fh;

system("identify $filename -verbose");

sub change {
    my $img = shift; 

    # $image->Set(density => DENSITY);
    # $image->Set(quality => QUALITY);

    # my $resized_width = 2048;
    # $image->Resize(geometry => $resized_width.'x'.$resized_width/2);

    # my $status = $image->Resample('992x1403');
    # warn "\n\n";
    # warn $image->get('density');
    # warn "\n\n";
    # warn dumper $status;
    return $image;
}

=head
$p->Read("imagefile");
$p->Set(attribute => value, ...)
($a, ...) = $p->Get("attribute", ...)
$p->routine(parameter => value, ...)
$p->Mogrify("Routine", parameter => value, ...)
$p->Write("filename");

