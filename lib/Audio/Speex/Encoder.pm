package Audio::Speex::Encoder;
use strict;
use warnings;

use Audio::Speex;

sub new {
    my ($class, $mode) = @_;
    init($mode);
}

sub DESTROY {
    $_[0]->destroy;
}

1;

__END__
