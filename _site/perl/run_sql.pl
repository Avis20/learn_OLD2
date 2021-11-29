#!/usr/bin/env perl

use lib::abs        qw| ../../lib |;
use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

# my $sql = <<START;
# SELECT "me"."contract_id", "me"."user_id", "me"."project_id", "me"."ts_create", "me"."ts_modify", "me"."is_enabled" FROM "contract"."items" "contract_item__row"  JOIN "contract"."agents" "me" ON ( "me"."contract_id" = "contract_item__row"."id" AND "me"."is_enabled" = ? ) WHERE ( ( "contract_item__row"."id" = ? AND "project_id" = ? AND "user_id" = ? ) ): '1', '59775113-0000-0000-0000-0000c890cb21', '1', '15760'
# START

my $sql = $ARGV[0];
my ($sql, $var_str) = split(':', $sql);
my @var = map { clean_str($_) } split(',', $var_str);
$sql =~ s/\?/%s/g;
printf($sql."\n", @var);

exit;

sub clean_str {
    my $str = shift;
    $str =~ s/[ \n]//g;
    return $str;
}