use strict;
use warnings;

use lib::abs qw| ./lib |;

use MyApp;

my $app = MyApp->apply_default_middlewares(MyApp->psgi_app);
$app;

