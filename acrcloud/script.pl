#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

my @music = `ls -1 ./music/`;

for ( @music ){
    s/\n//;
    say;
    cmd($_);
};

exit;


sub cmd {
    my $file = shift;
    my $pwd = `pwd`;
    $pwd =~ s/\n//;
    my $cmd = "docker run --rm -v $pwd:/tmp -v $pwd/music/:/music/ acrcloud/python_scan_tool -f \"/music/$file\" -o /tmp";
    say $cmd;
    system($cmd);
}