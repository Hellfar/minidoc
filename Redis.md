# Redis

## Use

### Installation

```
    $ wget http://download.redis.io/redis-stable.tar.gz
    $ tar -xvzf redis-stable.tar.gz
    $ cd redis-stable
    $ # if on Debian
    $ cd deps
    $ make hiredis lua jemalloc linenoise geohash-int
    $ cd -
    $ # endif0
    $ make
    $ sudo make install
```

### Running

```
    $ redis-server &
    $ redis-cli ping
    PONG
```

### Shutting down

```
    $ redis-cli shutdown
    $ redis-cli ping
    Could not connect to Redis at 127.0.0.1:6379: Connection refused
    Could not connect to Redis at 127.0.0.1:6379: Connection refused
```

### Ruby

```
    require 'redis'
    
    redis = Redis.new
    redis.ping # => "PONG"
    redis.set('foo','bar')
    redis.get('foo') # => "bar"
```

## Shortened commands list

For the full list go here: [https://redis.io/commands](https://redis.io/commands)

### A Value

```
    > set foo bar
    "OK"
    > get foo
    "bar"
```

### A List

Simple use:

```
    > rpush foo bar
    (integer) 1
    > rpush foo barbar
    (integer) 2
    > lpop foo
    "bar"
    > lpush foo coco
    (integer) 2
    > lpop foo
    "coco"
```

Advanced use:

```
    > rpush foo bar barbar
    (integer) 2
    > lpop foo
    "bar"
    > rpush foo coco
    (integer) 2
    > lrange foo 0 -1
    "barbar"
    "coco"
    > llen foo
    (integer) 2
    > blpop foo 1 # waiting 1 seconde (poping one element only)
    "barbar"
    > llen foo
    (integer) 1
    > blpop foo 0 # waiting forever until something is right or left pushed into the list
    ...
    > rpush bar tutu tutu
    (integer) 2
    > lrange bar 0 -1
    "tutu"
    "tutu"
```

### A Set

A set is a list of elements in which each elements appears only once.

Simple use:

```
    > sadd foo bar barbar
    (integer) 2
    > sadd foo tutu tutu
    (integer) 1
    > spop foo # returns a random element in the set
    "bar"
    > spop foo
    "tutu"
    > spop foo
    "barbar"
    > spop foo
    (nil)
```

Advanced use:

```
    > sadd foo bar barbar
    (integer) 2
    > sadd foo tutu tutu
    (integer) 1
    > scard foo
    (integer) 3
    > smembers foo
    1) "tutu"
    2) "barbar"
    3) "bar"
    > spop foo 2
    1) "tutu"
    2) "barbar"
    > spop foo 2
    1) "bar"
    > spop foo 2
    (empty list or set)
```