#!/usr/bin/env perl

use MIME::Base64 qw( decode_base64 encode_base64 );

local($/) = undef;  # slurp
print decode_base64(<STDIN>);
