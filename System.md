System
======

Symbol|Meaning
------|-------
-|Regular file
d|Directory
l|Link
c|Special file
s|Socket
p|Named pipe
b|Block device

Directory|Content
---------|-------
/bin|Common programs, shared by the system, the system administrator and the users.
/boot|The startup files and the kernel, vmlinuz. In some recent distributions also grub data. Grub is the GRand Unified Boot loader and is an attempt to get rid of the many different boot-loaders we know today.
/dev|Contains references to all the CPU peripheral hardware, which are represented as files with special properties.
/etc|Most important system configuration files are in /etc, this directory contains data similar to those in the Control Panel in Windows
/home|Home directories of the common users.
/initrd|(on some distributions) Information for booting. Do not remove!
/lib|Library files, includes files for all kinds of programs needed by the system and the users.
/lost+found|Every partition has a lost+found in its upper directory. Files that were saved during failures are here.
/misc|For miscellaneous purposes.
/mnt|Standard mount point for external file systems, e.g. a CD-ROM or a digital camera.
/net|Standard mount point for entire remote file systems
/opt|Typically contains extra and third party software.
/proc|A virtual file system containing information about system resources. More information about the meaning of the files in proc is obtained by entering the command man proc in a terminal window. The file proc.txt discusses the virtual file system in detail.
/root|The administrative user's home directory. Mind the difference between /, the root directory and /root, the home directory of the root user.
/sbin|Programs for use by the system and the system administrator.
/tmp|Temporary space for use by the system, cleaned upon reboot, so don't use this for saving any work!
/usr|Programs, libraries, documentation etc. for all user-related programs.
/var|Storage for all variable files and temporary files created by users, such as log files, the mail queue, the print spooler area, space for temporary storage of files downloaded from the Internet, or to keep an image of a CD before burning it.

Where to put?|Here
-------------|----
aliases|In `~/.bash_aliases`
env vars|In `~/.profile` or `~/.bash_profile` if this env vars are specific to bash (careful if `~/.bash_profile` exists `~/.profile` is not loaded).

## Relevant files

Filename|Comments
--------|--------
/etc/hosts|Local DNS configuration
/etc/sysctl.conf|Kernel configuration file (requires to be reloaded by system with `sudo sysctl -p`)
/etc/sudoers|File that describe users rights restrictions and permissions (also should be set into `/etc/sudoers.d/` folder)
/etc/apt/sources.list|Describe where to fetch packages lists.

## Crypted partitions
Mount a Luks crypted partition (tried on mint installation volume) :
```
$ sudo cryptsetup -v luksOpen /dev/sdc3 external # Change `/dev/sdc3` by your actual partition entry (e.g. for SSD volumes: `/dev/nvme0n1p3`).
$ ls /dev/mapper/ # Confirm that you see `external` here.
$ sudo mkdir -p /media/tmp/
$ sudo mount /dev/mapper/mint--vg-root /media/tmp/ # Do not replace `mint--vg-root` by `external`.
$ # ... Do what you need to do in there...
$ sudo umount /media/tmp/
$ sudo rmdir /media/tmp/ # Not mandatory.
```

## References
- [http://www.tldp.org/LDP/intro-linux/html/sect_03_01.html](http://www.tldp.org/LDP/intro-linux/html/sect_03_01.html)
- [https://forums.linuxmint.com/viewtopic.php?t=198706](https://forums.linuxmint.com/viewtopic.php?t=198706)
