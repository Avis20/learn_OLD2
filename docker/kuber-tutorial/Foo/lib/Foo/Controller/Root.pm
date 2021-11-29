package Foo::Controller::Root;
use Moose;
use namespace::autoclean;

BEGIN { extends 'Catalyst::Controller' }

__PACKAGE__->config(namespace => '');

sub index :Path :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body( "Hello from foo <br />".localtime(time) );
}

sub asd :Path('/asd') :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body( "Hello from foo" );
}

sub foo :Path('foo') :Args(0) {
    my ( $self, $c ) = @_;
    $c->response->body( "IT IS WRONG PATH" );
}

sub default :Path {
    my ( $self, $c ) = @_;
    $c->response->body( 'Page not found. I am catalyst' );
    $c->response->status(404);
}

sub end : ActionClass('RenderView') {}

__PACKAGE__->meta->make_immutable;

1;
