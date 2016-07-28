use strict;
use warnings;

use Test::FailWarnings;
use Test::Most;

use Tie::CacheRedisDB;

subtest 'constructor' => sub {

    my %test;

    throws_ok { tie %test, 'Tie::CacheRedisDB'; } qr/supply a lookup/, 'Need to supply a key for Redis';
    lives_ok { tie %test, 'Tie::CacheRedisDB', 'dakey'; } 'Solitary key is ok';
    throws_ok { tie %test, 'Tie::CacheRedisDB', 'dakey', []; } qr/supplied as a hash/, 'Need to supply args in a hash reference';

};

subtest 'defaults' => sub {

    {    # Test block.
        my %test;

        lives_ok { tie %test, 'Tie::CacheRedisDB', 'dakey'; } 'Ties';
        lives_ok { $test{'this'} = 'that'; } 'Stores';
        cmp_ok $test{this}, 'eq', 'that', 'Retrieves';
    }
    note 'Original tie destroyed.';

    {    # Otest block
        my %otest;

        lives_ok { tie %otest, 'Tie::CacheRedisDB', 'dakey'; } 'Re-Ties';
        cmp_ok $otest{this}, 'eq', 'that', 'Re-Retrieves';
        lives_ok { tied(%otest)->delete } 'Deletes';
    }
};

done_testing;
