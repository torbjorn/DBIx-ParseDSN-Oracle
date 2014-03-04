
use strict;
use warnings;
use Module::Build;

my $builder = Module::Build->new(
    module_name         => 'DBIx::ParseDSN::Oracle',
    license             => 'artistic',
    dist_author         => 'Torbjørn Lindahl <torbjorn.lindahl@gmail.com>',
    dist_version_from   => 'lib/DBIx/ParseDSN/Oracle.pm',
    build_requires => {
        'Test::Most' => 0,
    },
    requires => {

    },
    add_to_cleanup      => [ 'DBIx-ParseDSN-Oracle-*' ],
    # sign => 1,
    dynamic_config => 0,
);

$builder->create_build_script();
