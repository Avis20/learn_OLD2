#!/usr/bin/env perl

use uni::perl qw| :dumper |;

my %args = map { /^-(start|end|file|name|crop_x|crop_y|loop)=(.*)/ ? ($1 => $2) : () } @ARGV;

die "Start and end is required" if !$args{'file'} || !$args{'start'} || !$args{'end'};

foreach my $param (qw/start end/) {
    if ( my ($minute, $second, $millisec) = $args{$param} =~ /^(\w+)\.(\w+)\.?(\w+)?/ ) {
        $args{$param} = ( $minute * 60 ) + $second;
        $args{$param} .= ".$millisec" if $millisec;
    };
};

# 1. Снимок первого фрагмента
my $command = "ffmpeg -ss $args{start} -i $args{file} -t 0.01 result/image1.jpg -y";
cmd($command);

# 1.1. Обрезаем изображение
if ( $args{crop_x} ) {
    my $command = "convert result/image1.jpg -gravity north -chop 0x$args{crop_x} result/crop_$args{name}.jpg";
    cmd($command);
};

# 2. Вырезаем mp3

my $duration = $args{end} - $args{start};

$command = "ffmpeg -ss $args{start} -i $args{file} -t $duration result/$args{name}.mp3 -y";
cmd($command);

# 3. Зацикливаем mp3
if ( $args{loop} ) {
    my $mp3 = "result/$args{name}.mp3";
    cmd("mv $mp3 $mp3.tmp");
<<<<<<< HEAD
    my $command = sprintf("cat %s > %s", " $mp3.tmp" x $args{'loop'}, $mp3);
=======
    my $command = sprintf("cat%s > %s", " $mp3.tmp" x $args{'loop'}, $mp3);
>>>>>>> eeb003753c31e84a71c5e07856cf62719389c50f
    cmd($command);
    cmd("rm $mp3.tmp");
}

cmd("rm result/image1.jpg");

exit;

sub cmd {
    my $cmd = shift;
    warn "\n\n";
    say $cmd;
    warn "\n\n";
    my $res = qx| $cmd |;
    return $res;
}
