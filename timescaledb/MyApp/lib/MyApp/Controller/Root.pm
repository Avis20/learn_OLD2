package MyApp::Controller::Root;
use Moose;
use namespace::autoclean;
use uni::perl       qw| :dumper |;
use Encode          qw| encode decode |;
use JSON::XS        qw| decode_json encode_json |;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub monitor :Path('monitor/player') :Args(0) {
    my ( $self, $c ) = @_;

    my $params;
    $params->{'secret_key'}     = $c->req->header('X-Player-Secret-Key');
    $params->{'device_key'}     = $c->req->header('X-Player-Device-Key');
    $params->{'app_version'}    = $c->req->header('X-Player-Version');
    $params->{'real_ip'}        = $c->req->headers->header('x-real-ip');
    $params->{'request_time'}   = time;
    $params->{'json_data'}      = decode( 'utf-8', encode_json($c->req->params()) );
    warn "\n\n";
    warn dumper $params;
    warn "\n\n";
    my $rs = $c->model('TestDB')->resultset('Public::Monitor')->create($params);
    # warn dumper $rs->hash_api();

    $c->res->body(1);
}
=head
sub monitor2 :Chained('base') :PathPart('monitor2/player') :Args(0) {
    my ( $self, $c ) = @_;
    # warn dumper $c->req->headers();
    # warn "---" . $c->req->header('X-Player-Secret-Key');

    my $params;
    $params->{'secret_key'}     = $c->req->header('X-Player-Secret-Key');
    $params->{'device_key'}     = $c->req->header('X-Player-Device-Key');
    $params->{'app_version'}    = $c->req->header('X-Player-Version');
    $params->{'real_ip'}        = $c->req->headers->header('x-real-ip');
    $params->{'request_time'}   = time;
    $params->{'json_data'}      = $c->req->params();
    warn "\n\n";
    warn dumper $params;
    warn "\n\n";
    my $rs = $c->model('TestDB')->resultset('Public::Monitor2')->create($params);
    warn dumper $rs->hash_api();

    $c->res->body(1);
}

sub monitor3 :Chained('base') :PathPart('monitor3/player') :Args(0) {
    my ( $self, $c ) = @_;

    my $params;
    $params->{'secret_key'}     = $c->req->header('X-Player-Secret-Key');
    $params->{'device_key'}     = $c->req->header('X-Player-Device-Key');
    $params->{'app_version'}    = $c->req->header('X-Player-Version');
    $params->{'real_ip'}        = $c->req->headers->header('x-real-ip');
    $params->{'request_time'}   = time;
    $params->{'json_data'}      = $c->req->params();
    $params->{'time'}           = localtime(time() + 3600);
    my $rs = $c->model('TestDB')->resultset('Public::Monitor3')->create($params);

    $c->res->body(1);
}


sub monitor :Path('devel/monitor/player') :Args(0) {
    my ( $self, $c ) = @_;
    # warn dumper $c->req->headers();
    # warn "---" . $c->req->header('X-Player-Secret-Key');
    my $params = $c->req->params;
    $params->{'secret_key'} = $c->req->header('X-Player-Secret-Key');
    $params->{'device_key'} = $c->req->header('X-Player-Device-Key');
    $params->{'app_version'} = $c->req->header('X-Player-Version');
    warn "\n\n";
    warn dumper $params;
    warn "\n\n";

    my $rs = $c->model('TestDB')->resultset('Public::Monitor')->create($params);
    warn $rs;
    # warn dumper $rs->hash_api();

    $c->res->body(1);
}
=cut
sub index :Path :Args(0) {
    my ( $self, $c ) = @_;

    # Hello World
    $c->response->body( $c->welcome_message );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
