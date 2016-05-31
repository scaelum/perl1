package BBS::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

any '/' => sub {
    my ($c) = @_;

    my @entries = $c->db->search(
        entry => {
        }, {
            order_by => 'entry_id ASC',
            limit    => 50,
        }
    );
    return $c->render( "index.tx" => { entries => \@entries, } );
};

post '/post' => sub {
    my ($c) = @_;

    if (my $body = $c->req->param('body')) {
        $c->db->insert(
            entry => +{
                body => $body,
            }
        );
    }
     $c->redirect('/');
};

post '/post' => sub {
    my ($c) = @_;

    if (my $body2 = $c->req->param('body2')) {
        $c->db->insert(
            entry => +{
                body2 => $body2,
            }
        );
    }
     $c->redirect('/');
};

1;
