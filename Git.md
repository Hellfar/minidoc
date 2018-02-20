Git
===

## Branches

```
    $ # To show the current checked out branch.
    $ git branch
    $ # To list remote-tracking branches (for those that were fetched).
    $ git branch -r
    $ # To list both local and remote branches (for those that were fetched).
    $ git branch -a
    $ # To switch to a named branch (e.g. 'clean_up').
    $ git checkout clean_up
```
    
## Remotes

```
    $ # Gives some information about the remote <name>.
    $ git remote show origin
    * remote origin
      URL: git://github.com/rails/rails.git
      Remote branch merged with 'git pull' while on branch master
        master
      Tracked remote branches
        1-2-stable 2-0-stable 2-1-stable 2-2-stable 3-0-unstable master
    $ # List remote branches.
    $ git ls-remote --heads origin
```