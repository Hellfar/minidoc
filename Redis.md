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
    1
    > rpush foo barbar
    2
    > lpop foo
    "bar"
    > lpush foo coco
    2
    > lpop foo
    "coco"
```

Advanced use:

```
    > rpush foo bar barbar
    2
    > lpop foo
    "bar"
    > rpush foo coco
    2
    > lrange foo 0 -1
    "barbar"
    "coco"
    > llen foo
    2
    > blpop foo 1 # waiting 1 seconde
    "barbar"
    > llen foo
    1
    > blpop foo 0 # waiting forever until something is right or left pushed into the list
    ...
```