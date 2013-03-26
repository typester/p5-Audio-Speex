#define PERL_NO_GET_CONTEXT /* we want efficiency */
#include <EXTERN.h>
#include <perl.h>
#include <XSUB.h>
#define NEED_newSVpvn_flags
#include "ppport.h"

#include <speex/speex.h>

MODULE = Audio::Speex  PACKAGE = Audio::Speex  PREFIX = speex_

PROTOTYPES: DISABLE

SpeexMode*
speex_nb_mode()
CODE:
{
    RETVAL = (SpeexMode*)&speex_nb_mode;
}
OUTPUT:
    RETVAL

void
hello()
CODE:
{
    ST(0) = newSVpvs_flags("Hello, world!", SVs_TEMP);
}
