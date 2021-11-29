#!/usr/bin/env perl

use MIME::Base64 qw( decode_base64 encode_base64 );

my $params = {
    file => $ARGV[0],
};

my $b64_file;
open my $fh, $params->{'file'} or return { rc => 0, msg => "Can't open $params->{'file'}: $!" };
while ( my $buf = <$fh> ) {
    $b64_file .= decode_base64( $buf );
};
close $fh;

print $b64_file;

=head
warn "\n\n";
warn "\n\n";
# =cut

local($/) = undef;  # slurp

open my $fh, $params->{'file'} or return { rc => 0, msg => "Can't open $params->{'file'}: $!" };

my $var;
while ( my $buf = <$fh> ) {
    # print decode_base64($buf);
    $var .= decode_base64($buf);
}

print $var;

close $fh;

=head

open(FILE, $file) or die "$!";

my $var;
while (read(FILE, $buf, 60*57)) {
   print decode_base64($buf);
   # $var .= decode_base64($buf);
};

print $var;

exit;