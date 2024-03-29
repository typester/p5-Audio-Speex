use strict;
use Module::Build;
use Module::CPANfile;
use File::Basename;
use File::Spec;

use 5.008005;

my $cpanfile = Module::CPANfile->load('cpanfile');
my $prereqs = $cpanfile->prereq_specs;

my $builder = Module::Build->new(
    license              => 'perl',
    dynamic_config       => 0,

    requires             => {
        perl => '5.008005',
        %{ $prereqs->{runtime}->{requires} || {} },
    },
    configure_requires => {
        %{ $prereqs->{runtime}->{requires}  || {}},
    },
    build_requires => {
        %{ $prereqs->{build}->{requires}  || {}},
        %{ $prereqs->{test}->{requires}   || {}},
    },

    extra_linker_flags => ['-lspeex'],

    no_index    => { 'directory' => [ 'inc' ] },
    name        => 'Audio-Speex',
    module_name => 'Audio::Speex',

    script_files => [glob('script/*')],

    test_files           => ((-d '.git' || $ENV{RELEASE_TESTING}) && -d 'xt') ? 't/ xt/' : 't/',
    recursive_test_files => 1,

    create_readme  => 0,
    create_license => 0,
);
$builder->create_build_script();

