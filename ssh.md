To force an immediate disconnection, press consecutively (not at the same time) the following three keys:  
`Enter`, `~`, `.`  
(The `~` then `.` is the command to disconnect from the hung ssh session. The `Enter` however is here only to guarantee that the two characters are alone in on a new line that could have been dirty otherwise).

The session will eventually time out and disconnect; this will happen faster if you configure `ServerAliveInterval` and `ServerAliveCountMax` in `~/.ssh/config`.
