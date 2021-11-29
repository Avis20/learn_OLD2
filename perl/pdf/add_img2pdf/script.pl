#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use Image::Magick;

my $pdf = Image::Magick->new();
$pdf->Read('pdf:source/Lorem.pdf');

my $stamp = Image::Magick->new();
$stamp->Read('png:source/stamp.png');

$pdf->Composite( image => $stamp, compose => 'over' );
$pdf->Set( quality => 100 );

my $resized_width = 2048;
$pdf->Resize( geometry => $resized_width.'x'.$resized_width/2 );

# $pdf->Display();

$pdf->Write("pdf:res/Lorem.pdf");

