List GPG keys:

```
sudo apt-key list
```

Update an expired GPG key:

```
sudo apt-key adv --keyserver keys.gnupg.net --recv-keys 8C718D3B5072E1F5
```

Remove a GPG key:

```
sudo apt-key del 8C718D3B5072E1F5
```

Show the keyboard layout graphically:

```
gkbd-keyboard-display -g 1
```