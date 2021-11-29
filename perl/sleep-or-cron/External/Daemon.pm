package External::Daemon;
use uni::perl qw/:dumper/;
use POSIX qw(setsid uname getpid);
use Log::Dispatch;

sub __init__ {
    my $self = shift;
    $| = 1;
# check args
    my %args = @_;
    $self->{'pidfile'} = $args{'pidfile'}   || die 'param pidfile is requered!';
    $self->{'name'} = $args{'name'}         || die 'param name is requered!';

    $self->{'key'} = '';
    $self->{'key'} .= (0..9,'a'..'z')[ int rand 36 ] for 0..7;
# init log
    my $prepend_timestamp = sub {
        my %p = @_;
        return sprintf "[%s][%s] %s", scalar( localtime ), uc $p{level}, $p{message};
    };

    $self->{log} = Log::Dispatch->new(
        outputs => [
            [
                'Syslog',
                min_level => 'debug',
                facility  => 'local0',
                ident     => $self->{name}
            ],
            [
                'Screen',
                min_level => 'debug',
                newline   => 1
            ],
        ],
        callbacks => $prepend_timestamp
    );
    $SIG{__WARN__} = sub { $self->log->warning(@_) };

    $self->log->info( 'Start init daemon' );

# check pid
    if (-e $self->{pidfile}) {
        my $PDF;
        unless (open($PDF, $self->{pidfile})) {
            $self->log->error( 'Can not open pid file! [ '.$self->{pidfile}.' ]' ); exit;
        }
        my $oldpid=<$PDF>;
        close $PDF;
        if ($oldpid > 1 && kill(0,$oldpid)) {
            $self->log->warning( 'Process enabled, exit [ '.$oldpid.' ]' ); exit;
        } else {
            $self->log->info( 'No found other process. We can start.' );
        }
    }
    return $self;
}

sub new {
    my $class = shift;
    my $self = {};
    bless $self, $class;
    $self->__init__(@_);
    return $self;
}

sub start {
# TODO: $self->log
    my $self = shift;
    $self->log->info( 'Start process' );
    
#    open STDIN, '/dev/null' or die "Can't read /dev/null: $!";
#    open STDOUT, '>/dev/null' or die "Can't write to /dev/null: $!";
    
    defined(my $pid = fork) or die "Can't fork: $!";
    exit if $pid;
    die "Can't start a new session: $!" if setsid == -1;
    open STDERR, '>&STDOUT' or die "Can't dup stdout: $!";

    open(my $PFH, '>', $self->{pidfile}) or die "Can't open $self->{pidfile}: $!";
    flock $PFH, 2;
    print $PFH getpid();

}

sub log { return $_[0]->{'log'} }
sub key { return $_[0]->{'key'} }

1;
