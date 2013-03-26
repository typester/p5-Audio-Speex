package Audio::Speex;
use strict;
use warnings;
use 5.008005;
use parent 'Exporter';

our $VERSION = "0.01";

use Audio::Speex::Encoder;

BEGIN {
    my %constants = (
    #/** Set enhancement on/off (decoder only) */
        SPEEX_SET_ENH => 0,
        #/** Get enhancement state (decoder only) */
        SPEEX_GET_ENH => 1,

        #/*Would be SPEEX_SET_FRAME_SIZE, but it's (currently) invalid*/
        #/** Obtain frame size used by encoder/decoder */
        SPEEX_GET_FRAME_SIZE => 3,

        #/** Set quality value */
        SPEEX_SET_QUALITY => 4,
        #/** Get current quality setting */
        #/* #define SPEEX_GET_QUALITY 5 -- Doesn't make much sense, does it? */

        #/** Set sub-mode to use */
        SPEEX_SET_MODE => 6,
        #/** Get current sub-mode in use */
        SPEEX_GET_MODE => 7,

        #/** Set low-band sub-mode to use (wideband only)*/
        SPEEX_SET_LOW_MODE => 8,
        #/** Get current low-band mode in use (wideband only)*/
        SPEEX_GET_LOW_MODE => 9,

        #/** Set high-band sub-mode to use (wideband only)*/
        SPEEX_SET_HIGH_MODE => 10,
        #/** Get current high-band mode in use (wideband only)*/
        SPEEX_GET_HIGH_MODE => 11,

        #/** Set VBR on (1) or off (0) */
        SPEEX_SET_VBR => 12,
        #/** Get VBR status (1 for on, 0 for off) */
        SPEEX_GET_VBR => 13,

        #/** Set quality value for VBR encoding (0-10) */
        SPEEX_SET_VBR_QUALITY => 14,
        #/** Get current quality value for VBR encoding (0-10) */
        SPEEX_GET_VBR_QUALITY => 15,

        #/** Set complexity of the encoder (0-10) */
        SPEEX_SET_COMPLEXITY => 16,
        #/** Get current complexity of the encoder (0-10) */
        SPEEX_GET_COMPLEXITY => 17,

        #/** Set bit-rate used by the encoder (or lower) */
        SPEEX_SET_BITRATE => 18,
        #/** Get current bit-rate used by the encoder or decoder */
        SPEEX_GET_BITRATE => 19,

        #/** Define a handler function for in-band Speex request*/
        SPEEX_SET_HANDLER => 20,

        #/** Define a handler function for in-band user-defined request*/
        SPEEX_SET_USER_HANDLER => 22,

        #/** Set sampling rate used in bit-rate computation */
        SPEEX_SET_SAMPLING_RATE => 24,
        #/** Get sampling rate used in bit-rate computation */
        SPEEX_GET_SAMPLING_RATE => 25,

        #/** Reset the encoder/decoder memories to zero*/
        SPEEX_RESET_STATE => 26,

        #/** Get VBR info (mostly used internally) */
        SPEEX_GET_RELATIVE_QUALITY => 29,

        #/** Set VAD status (1 for on, 0 for off) */
        SPEEX_SET_VAD => 30,

        #/** Get VAD status (1 for on, 0 for off) */
        SPEEX_GET_VAD => 31,

        #/** Set Average Bit-Rate (ABR) to n bits per seconds */
        SPEEX_SET_ABR => 32,
        #/** Get Average Bit-Rate (ABR) setting (in bps) */
        SPEEX_GET_ABR => 33,

        #/** Set DTX status (1 for on, 0 for off) */
        SPEEX_SET_DTX => 34,
        #/** Get DTX status (1 for on, 0 for off) */
        SPEEX_GET_DTX => 35,

        #/** Set submode encoding in each frame (1 for yes, 0 for no, setting to no breaks the standard) */
        SPEEX_SET_SUBMODE_ENCODING => 36,
        #/** Get submode encoding in each frame */
        SPEEX_GET_SUBMODE_ENCODING => 37,

        #/*#define SPEEX_SET_LOOKAHEAD 38*/
        #/** Returns the lookahead used by Speex */
        SPEEX_GET_LOOKAHEAD => 39,

        #/** Sets tuning for packet-loss concealment (expected loss rate) */
        SPEEX_SET_PLC_TUNING => 40,
        #/** Gets tuning for PLC */
        SPEEX_GET_PLC_TUNING => 41,

        #/** Sets the max bit-rate allowed in VBR mode */
        SPEEX_SET_VBR_MAX_BITRATE => 42,
        #/** Gets the max bit-rate allowed in VBR mode */
        SPEEX_GET_VBR_MAX_BITRATE => 43,

        #/** Turn on/off input/output high-pass filtering */
        SPEEX_SET_HIGHPASS => 44,
        #/** Get status of input/output high-pass filtering */
        SPEEX_GET_HIGHPASS => 45,

        #/** Get "activity level" of the last decoded frame, i.e.
        #how much damage we cause if we remove the frame */
        SPEEX_GET_ACTIVITY => 47,

        #/* Preserving compatibility:*/
        #/** Equivalent to SPEEX_SET_ENH */
        SPEEX_SET_PF => 0,
        #/** Equivalent to SPEEX_GET_ENH */
        SPEEX_GET_PF => 1,
    );

    require constant;
    import constant \%constants;

    our @EXPORT = keys %constants;
};

use XSLoader;
XSLoader::load(__PACKAGE__, $VERSION);

1;
__END__

=head1 NAME

Audio::Speex - It's new $module

=head1 SYNOPSIS

    use Audio::Speex;

=head1 DESCRIPTION

Audio::Speex is ...

=head1 LICENSE

Copyright (C) Daisuke Murase

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Daisuke Murase E<lt>typester@cpan.orgE<gt>

