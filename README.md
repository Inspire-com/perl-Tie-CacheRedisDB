# NAME

Tie::CacheRedisDB - Tie a hash to a Cache::RedisDB

# SYNOPSIS

    use Tie::CacheRedisDB;

    tie %hash, 'Tie::CacheRedisDB', 'myrediskey';
    tie %hash, 'Tie::CacheRedisDB', 'myrediskey',
      { can_miss => 0, expiry => 60, namespace => 'junk' };

# DESCRIPTION

Tie::CacheRedisDB is to simplify using key-value storage by presenting
a familiar interface while using a Redis backing store.

Arguments to the tie should be presented in a single hash reference.

- can\_miss
The number of updates allowed between persisting to the backing store.
Defaults to 2.  The structure will still be synced upon destroy.
- expiry
The number of seconds (since last update) after which the key should be culled.
Defaults to \`undef\` (no expiration) .
- namespace
**Cache::RedisDB** namespace for the associated keys.

# AUTHOR

Inspire.com

# COPYRIGHT

Copyright 2016- Inspire

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# SEE ALSO
