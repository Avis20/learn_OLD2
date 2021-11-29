#!/usr/bin/env perl

use uni::perl       qw| :dumper |;

open(my $fh, '<', $ARGV[0]) or die "Not found $ARGV[0]";

my $text;
while (<$fh>) {
    $text .= $_;
};

$text =~ s#\<(.*)\>#&lt;$1&gt;#g;
$text =~ s#\`\`\`\w+#<pre><code class="python">#g;
$text =~ s#\`\`\`#</code></pre>#g;

print $text;

$fh->close();

exit;