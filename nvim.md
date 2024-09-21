#Nvim

##Workspace

- To change workplace directory: `:cd yourdir`
- To open a file: `:e yourfile`
- To open a terminal: `:te`

##Splits

- To create a horizontal split:
    - shortcut: `CTRL + w, s`
    - command: `:split`
- To create a vertical split:
    - shortcut: `CTRL + w, v`
    - command: `:vsplit`
- To change the focus of splits:
    - shortcut: `CTRL + w, arrows`

To open several files directly from the starting command: `vim -o file1 file2 file3` (or with `-O` uppercase for vertical splits).
Or `vim file1 file2 file3` then `:all` to open them horizontally or `:vertical all` vertically.
