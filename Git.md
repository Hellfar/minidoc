Git
===

## Revision references syntaxe understanding

`HEAD` means your actual position, this does not mean neither a branch nor a commit, but your position on the tree.
You could for instance `checkout` some random commit and your `HEAD` would be positioned on that commit.
This acts as a reference to your position. Use `git show HEAD` to see the commit of a given reference.
Later on this document whenever I talk about a "refs" I indiscriminately talk about branch name, commit hash, keywords such as `HEAD`, tag name and even in some case a blank argument (which would mean `HEAD`, but you still will have to check on the documentation to understand the behavior fully).

| Position            | Description             |
|---------------------|-------------------------|
| `HEAD`              | Current last commit     |
| `HEAD~` or `HEAD~1` | Commit before last      |
| `HEAD~n`            | Nth commits before last |

Further explanations [here](https://stackoverflow.com/a/2222920/5384061).

## Commits

```
    git show HEAD # To see the commit of a given reference (here for example of `HEAD`).
    # Get last commit id from HEAD.
    git log --branches --format="%H" -n 1 # Where `-n 1` is the number of commits you want to be shown from newer to older. `%h` would have print a short hash (matches the start of the long hash).
    # Same with "plumbing" command.
    git rev-parse HEAD # And for short hash use `--short`.
    git rev-list HEAD -n 1 # Same.
    git show HEAD | sed -n 1p | cut -d " " -f 2 # Again the same.
    git log -1 --format=%H # And again the same.
    git rev-parse --abbrev-ref HEAD # Show the refs associated with this commit instead (Branches, tags or even `HEAD` itself).
```

## Resets

```
    # Point yourself on to the given reference.
    git reset --hard # Means remove any staged and unstaged modifications.
    git reset --hard <some_ref>
    # Point self HEAD onto your ref and keep the changes from where you were before the command and staging them.
    git reset --soft <some_ref>
    # Same but not staging the changes ("will reset the index and working directory").
    git reset <some_ref>
```

## Diffs

```
    # Notice that for `git diff` as well as for `git difftool` if there is no diffs to show nothing will happen.

    # Using Meld for visualizing diffs as well as for editing them:
    git difftool --tool=meld # Check out the diffs file after file.
    git difftool -d --tool=meld # Check out the directory structure diff instead of being run file by file by Git.
    git difftool -d --tool=meld <commit1> <commit2> # Compare two commits, if only one commit is provided will compare that commit with the current state of the directory.
    git difftool -d --tool=meld --cached # Compare with staged content.
    git difftool -d --tool=meld <branch> # Compare with a given branch.
```

## Branches

```
    # To show the current checked out branch.
    git branch
    # To list remote-tracking branches (for those that were fetched).
    git branch -r
    # To list both local and remote branches (for those that were fetched).
    git branch -a
    # To switch to a named branch (e.g. 'clean_up').
    git checkout clean_up
    # To move a branch head onto a given commit (without merge or anything).
    git branch -f tmp HEAD # In this example move the "tmp" branch head onto HEAD. You still gonna have to checkout "tmp" after though.
    # To remove on local head branches that no longer exist on the remotes.
    git fetch --prune # Could be used in combination with `--tags --prune-tags`).
    # To clone a single branch (for production reasons for instance).
    git clone --single-branch --branch <branchname> <remote-repo> # In this example you might need to rename the folder you are cloning in, add one last argument being your folder name.
```

## Remotes

```
    # On some Git hubs Git asks you when you push a new branch to the remote to tell what name should that branch be named on the remote.
    git push -u origin master # Or as per the example `git push --up-stream origin master`.
    # Gives some information about the remote <name>.
    git remote show origin
    * remote origin
      URL: git://github.com/rails/rails.git
      Remote branch merged with 'git pull' while on branch master
        master
      Tracked remote branches
        1-2-stable 2-0-stable 2-1-stable 2-2-stable 3-0-unstable master
    # List remote branches.
    git ls-remote --heads origin
    # Print the remotes informations.
    git remote -v
    # To change the remote url.
    git remote set-url origin new.git.url/here # Could also be achieved in `.git/config`.
```

## Rebase

```
    git checkout master # Check yourself out on the branch/commit you want to rebase on to something else.
    git rebase -i --no-ff origin/master # Rebase your current attached commit on to another one (here `origin/master` for instance).
    # `-i` or `--interactive` to have a preview of what's going to happen and have step breaks whenever a conflict is encountered so you can deal with it step by step.
    # `--no-ff` for "no fast forward" means that it wont try to merge if possible, but instead will recreate the commits on top of the commit destination.
```

## Tags

```
    git push origin tag <tag_name> # Push a single tag.
    git push --tags # Push all the tags (not recommanded).
    git fetch --tags --prune-tags # Fetch all tags updates (and remove those that have been deleted on the remotes).
```

## Miscs

```
    git rev-parse --show-toplevel # Displays the top-level directory of your Git repository (such as "E:/Projects/Sites/landing" for example).
    git reflog # Historic of actions made on this repo from newer to older.
    git log # Commit list from newer to older.
    # To display the full git tree, historically descending.
    git log --graph --oneline --all
    # Apparently the same.
    git log --graph --pretty=oneline --abbrev-commit # redirect it to `tig` to make it interactive.

    # Hide you staged and unstaged content away in a LIFO type stack.
    git stash
    # Retrieve last stashed content.
    git stash pop # You may select your stash by appending your stash_ref to it (such as `'stash@{n}'` don't forget the quotes, just the number `n` seems to work as well).
    # Display your stash stack.
    git stash list
    # Remove last stash.
    git stash drop

    # To make some git alias (`git uncommit` in this example).
    git config --global alias.uncommit 'reset HEAD^'

    # To make an archive out of a given ref.
    git archive --format=tgz --prefix=product-1.0 1.0 > product-1.0.tgz # Where `1.0` is a tag name used as a ref here.
    # `tar cf product-1.0.tgz --exclude=.git` would include all binaries, untracked and ignored files. And would need a lot of configuration to work properly.
    # To make an archive out of the unstaged changes.
    tar czvf product-1.0.tar.gz `git diff --name-only`
    # To make an archive out of staged changes.
    tar czvf product-1.0.tar.gz `git diff --cached --name-only`
    # You might also investigate about the following one.
    git archive --output=modified-files.zip HEAD $(git ls-files --modified)

    # The two following commands remain to be explained.
    get show-ref --head
    get show-ref --heads
```

## To investigate further

- This document probably needs to be presented differently.
- Is "cached" and "staged" are terms to be swapped indiscriminately ?
- Is there a way to make a reference to the "unstaged" current content in the same way we use `HEAD` to make reference to the last commit ?
- Is there a way to make a reference to the "staged" current content in the same way we use `HEAD` to make reference to the last commit ?
- Investigate on `HEAD@{0}` and `HEAD@{1}` and so on.
- Investigate on `HEAD^1` and `HEAD^2` and so on.
- Investigate on `@~`, seems to be an alias of `HEAD~`.
- [tig](https://linux.die.net/man/1/tig) or [tig](https://linux.die.net/man/7/tigmanual). Apparently useful for colorizing Git render and/or browse Git tree/diff/commits.
- Git trace [here](https://stackoverflow.com/a/68965888/5384061).
