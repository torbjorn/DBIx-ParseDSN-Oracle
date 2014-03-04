#!/usr/bin/perl

use strict;
use warnings;
use utf8::all;
use Test::Most;
use Test::FailWarnings;

use t::lib::TestUtils;

use DBIx::ParseDSN;
use DBIx::ParseDSN::Oracle;

my $dsn = parse_dsn("dbi:Oracle:host=foobar;sid=DB;port=1521");
isa_ok( $dsn, "DBIx::ParseDSN::Oracle" );

## dbi:Oracle:DB
test_dsn_basics(
    "dbi:Oracle:host=foobar;sid=DB;port=1521",
    "Oracle",
    {
        database => "DB",
        port => 1521,
        host => "foobar",
    },
    {
        sid => "DB",
        port => 1521,
        host => "foobar",
    },
    undef, undef,
    "host=foobar;sid=DB;port=1521"
);

## dbi:Oracle://myhost:1522/ORCL
test_dsn_basics(
    "dbi:Oracle://myhost:1522/ORCL",
    "Oracle",
    {
        database => "ORCL",
        port => 1522,
        host => "myhost",
    },
    {
        "//myhost:1522/ORCL" => undef,
    },
    undef, undef,
    "//myhost:1522/ORCL"
);

## dbi:Oracle:host=foobar;sid=ORCL;port=1521;SERVER=POOLED
test_dsn_basics(
    "dbi:Oracle:host=foobar;sid=ORCL;port=1521;SERVER=POOLED",
    "Oracle",
    {
        database => "ORCL",
        port => 1521,
        host => "foobar",
    },
    {
        sid => "ORCL",
        port => 1521,
        host => "foobar",
    },
    undef, undef,
    "host=foobar;sid=ORCL;port=1521;SERVER=POOLED"
);

## dbi:Oracle:DB:POOLED
test_dsn_basics(
    "dbi:Oracle:DB:POOLED",
    "Oracle",
    {
        database => "DB",
    },
    {
        "DB:POOLED" => undef,
    },
    undef, undef,
    "DB:POOLED"
);

done_testing;
