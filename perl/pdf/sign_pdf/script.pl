#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

use Image::Magick;

my $image = Image::Magick->new( format => 'pdf' );
$image->Set( density => '300x300' );
$image->Read('pdf:source/Lorem.pdf[0]');
$image->Set( verbose => 'True' );
 
my $status = $image->Write( "pdf:res/Lorem.pdf" );
warn "Write failed: $status" if $status;

=head
sub resize {
    my $image = shift;
    my $blur = 9.999;
    my $width = 2481;
    my $original_width = $image->Get('width');
    my $original_height = $image->Get('height');
    my $aspect_ratio = $original_width/$original_height;
    $image->AdaptiveResize(blur => $blur, width => $width, height => $width / $aspect_ratio);
    return $image;
}

# system("identify ./res/Lorem.png");

=head

my $stamp = Image::Magick->new();
$stamp->Read('png:source/stamp.png');

$pdf->Composite( image => $stamp, compose => 'over' );
$pdf->Set( quality => 100 );

my $resized_width = 2048;
$pdf->Resize( geometry => $resized_width.'x'.$resized_width/2 );

$pdf->Write("pdf:res/Lorem.pdf");


=head

# my $width = 2481;
# my $height = 3509;
# $image->Set('density', '300x300');  # a little extra nudge

# $image->Set(depth=>8);
# $image->Resize(width=>$width, height=>$height);

# Не работает!
# $image->Resample( density => 'geometry', x => 100, y => 100 );
# $image = resize($image);

# Не работает!
# $image->AdaptiveResize( geometry =>'geometry', height => 3509, widht => 2481,  );

# my $status = $image->Write( "pdf:res/Lorem.pdf" );
