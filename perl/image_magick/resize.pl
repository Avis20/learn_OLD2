#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use Image::Magick;

my ( $input, $output ) = ( 'source/toys.jpg', 'res/toys.jpg' );

my $size = 250;

my $image = Image::Magick->new();
$image->Read($input);

# определяем ширину и высоту изображения
my ($ox, $oy) = $image->Get('base-columns','base-rows');

warn "\n\n";
warn dumper [$ox, $oy];
warn "\n\n";

my $nx = int( ($ox/$oy) * $size ); # вычисляем ширину, если высоту сделать $size

# Делаем resize (изменения размера)
$image->Resize( geometry => 'geometry', width => $nx, height => $size );

my $res = $image->Write(filename => $output);

system("identify $output -verbose");
