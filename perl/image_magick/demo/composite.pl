#!/usr/bin/perl

use Image::Magick;

#$font = '-adobe-helvetica-medium-r-normal--25-180-100-100-p-130-iso8729-1';
#$font = 'Times';
my $font = 'Generic.ttf';

my $image = Image::Magick->new();
my $smile = Image::Magick->new();
$smile->Read( 'smile.gif' );
$smile->Set( background => 'none' );

my $x = 100;
my $y = 100;

for ( $angle=0; $angle < 360; $angle+=30 ) {
  my ( $thumbnail );

  print "angle $angle\n";
  my $thumbnail = Image::Magick->new( size => "600x600", pointsize => 24, font => $font,  fill => 'black' );
  $thumbnail->Read( "xc:white" );
  $thumbnail->Draw( primitive => 'line', points => "300, 100 300, 500", stroke => '#600' );
  $thumbnail->Draw( primitive => 'line', points => "100, 300 500, 300", stroke => '#600' );
  $thumbnail->Draw( primitive => 'rectangle', points => "100, 100 500, 500",  fill => 'none', stroke => '#600' );
  $thumbnail->Composite( image => $smile, gravity => "NorthWest", x => $x, y => $y,  rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "North", y => $y, rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "NorthEast", x => $x, y => $y, 
    rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "West", x => $x, rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "Center", rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "East", x => $x, rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "SouthWest", x => $x, y => $y, 
    rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "South", y => $y, rotate => $angle );
  $thumbnail->Composite( image => $smile, gravity => "SouthEast", x => $x, y => $y, 
    rotate => $angle );
  push( @$image, $thumbnail );
}
$image->Set( delay => 20 );
$image->Write( "composite.miff" );
$image->Animate();
