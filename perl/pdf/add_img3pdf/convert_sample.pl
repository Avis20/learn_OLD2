# Convert TG3 rendered spherical image to PNG24
# perl convert_sample.pl -i ~/temp.0001.exr -w 8192 -o test

use 5.012;
use warnings;
use utf8;
use Image::Magick;
use Time::Piece;

use Getopt::Long qw/:config posix_default no_ignore_case gnu_compat bundling/;

if ($0 eq __FILE__) {
  main();
}

sub main {

  my %opts = (
    width => 8192,
    output => 'out',
  );
  GetOptions(\%opts, qw(
    width|w|x=i
    input|i=s
    output|o=s
  ));

  use Data::Dumper;
  print Dumper \%opts;

  my $input_file_name = $opts{input};
  die "File not exist" unless -e $input_file_name;

  my $resized_width = $opts{width};
  die "Width parameter shall be even"
                          if $resized_width % 2 != 0;

  say "--- load the file ---\n".localtime->time;
  my $image = Image::Magick->new;
  $image->Read($input_file_name);

  my $image_x_size = $image->[0]->Get('x-resolution');
  my $image_y_size = $image->[0]->Get('y-resolution');

  # TG3のバグ回避。
  say "--- crop ---\n".localtime->time;
  $image->[0]->Crop(geometry =>
          $image_x_size.'x'.$image_y_size.'+'.'1x1');

  # Resize
  say "--- resize ---\n".localtime->time;
  $image->[0]->Resize(geometry =>
          $resized_width.'x'.$resized_width/2);

  #これやらないとpngがうまく吐けない
  say "--- gamma correction ---\n".localtime->time;
  $image->[0]->Gamma(gamma => 2.2, channel => 'All');

  say "--- write ---\n".localtime->time;
  my $output_file_name_wo_extension = $opts{output};
  $image->[0]->Write('png24:'.$output_file_name_wo_extension.'.png');

  undef $image;

  say "--- complete ---\n".localtime->time;
}

__END__
