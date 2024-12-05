Static new server
=================

**All those could be aliased of course to prevent looking all around for it or making errors.**

## Using Node

Watch static content (need `reload` module installed) :

```
    $(npm bin)/reload -d app/
```

Serve static content :

```
    npm install -g node-static
    static app/
```

## Using Python

```
    python3 -m http.server
```
