Windows
=======

## Users and Groups

SIDs is a user ID.]
`S-1-5-32-544` is a "well-known SID" referencing the built-in Administrators group. More "well-known SID" following this [link](https://learn.microsoft.com/en-us/windows/win32/secauthz/well-known-sids).
`S-1-12-1-1347659835-1128888854-2982737882-1111120199` is an example of a user ID. More information following this [link](https://woshub.com/convert-sid-to-username-and-vice-versa/).

You might encounter some issue using git if you copied a repo accross several computers. Here's why:
https://medium.com/@thecodinganalyst/git-detect-dubious-ownership-in-repository-e7f33037a8f

To change the ownership of a folder you can use `takedown` command in PowerShell where `/r` stands for "recursively" ([doc](https://learn.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/cc753024(v=ws.10)?redirectedfrom=MSDN)):
(You will need to have your admin account elevated to use this).

```
    takeown /f "c:\folder\subfolder" /r
```