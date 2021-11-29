use strict;
use warnings;

use Avis20;

my $app = Avis20->apply_default_middlewares(Avis20->psgi_app);
$app;

