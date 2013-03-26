package Audio::Speex::Bits;
use strict;
use warnings;

sub new {
    my ($class) = @_;
    $class->init;
}

sub DESTROY {
    $_[0]->destroy;
}

1;

__END__
