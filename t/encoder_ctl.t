use strict;
use warnings;
use Test::More;

use Audio::Speex;

my $encoder = Audio::Speex::Encoder->new( Audio::Speex::nb_mode() );
isa_ok $encoder, 'Audio::Speex::Encoder';

my $r = $encoder->ctl(SPEEX_GET_FRAME_SIZE, \my $size);
is $r, 0;
is $size, 160;

done_testing;
