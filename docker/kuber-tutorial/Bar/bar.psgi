use strict;
use warnings;

use Bar;

my $app = Bar->apply_default_middlewares(Bar->psgi_app);
$app;

