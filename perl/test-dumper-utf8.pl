
#!/usr/bin/env perl

# use uni::perl qw| :dumper |;
use Encode          qw| encode decode |;
use Data::Dumper;


my $VAR1 = {
    'success' => 0,
    'errcode' => 404,
    'errmess' => "\x{41e}\x{431}\x{44a}\x{435}\x{43a}\x{442} \x{43d}\x{435} \x{43d}\x{430}\x{439}\x{434}\x{435}\x{43d} test",
    'params' => {
        'project_id' => '10000000-0000-0000-0000-000000000019',
        'content_type_id' => '3',
        'object_id' => '5f3ce706-0000-0000-0000-00007097b8c4'
    },
};

# warn Dumper( encode("UTF-8", $VAR1, 1) );
warn encode("UTF-8", $VAR1->{errmess}, 1);
