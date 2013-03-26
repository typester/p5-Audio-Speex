#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>
#define NEED_newSVpvn_flags
#include "ppport.h"

#include <speex/speex.h>

/* for typemap */
typedef const SpeexMode* Audio__Speex__Mode;
typedef void* Audio__Speex__Encoder;
typedef SpeexBits* Audio__Speex__Bits;

MODULE = Audio::Speex  PACKAGE = Audio::Speex  PREFIX = speex_

PROTOTYPES: DISABLE

Audio::Speex::Mode
speex_nb_mode()
CODE:
{
    RETVAL = &speex_nb_mode;
}
OUTPUT:
    RETVAL


MODULE = Audio::Speex  PACKAGE = Audio::Speex::Bits  PREFIX = speex_bits_

Audio::Speex::Bits
speex_bits_init(SV* class) 
CODE:
{
    SpeexBits* bits;

    Newx(bits, 1, SpeexBits);
    speex_bits_init(bits);
    RETVAL = bits;
}
OUTPUT:
    RETVAL

void
speex_bits_destroy(Audio::Speex::Bits bits)
CODE:
{
    speex_bits_destroy(bits);
    Safefree(bits);
}

void
speex_bits_reset(Audio::Speex::Bits bits)


MODULE = Audio::Speex  PACKAGE = Audio::Speex::Encoder  PREFIX = speex_encoder_

Audio::Speex::Encoder
speex_encoder_init(Audio::Speex::Mode mode)

int
speex_encoder_ctl(Audio::Speex::Encoder state, int request, SV* ptr)
CODE:
{
    int i;

    if (!SvROK(ptr)) {
        croak("ptr is not reference");
    }
    if (SvOK(SvRV(ptr))) {
        if (SvIOK(SvRV(ptr))) {
            i = SvIV(SvRV(ptr));
        }
        else {
            croak("ptr is invalid reference value");
        }
    }

    RETVAL = speex_encoder_ctl(state, request, (void*)&i);
    sv_setiv(SvRV(ptr), i);
}
OUTPUT:
    RETVAL
