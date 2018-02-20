# Bash

## Structures

### if managment

Primary|Meaning
-------|-------
[ -a FILE ]|True if FILE exists.
[ -b FILE ]|True if FILE exists and is a block-special file.
[ -c FILE ]|True if FILE exists and is a character-special file.
[ -d FILE ]|True if FILE exists and is a directory.
[ -e FILE ]|True if FILE exists.
[ -f FILE ]|True if FILE exists and is a regular file.
[ -g FILE ]|True if FILE exists and its SGID bit is set.
[ -h FILE ]|True if FILE exists and is a symbolic link.
[ -k FILE ]|True if FILE exists and its sticky bit is set.
[ -p FILE ]|True if FILE exists and is a named pipe (FIFO).
[ -r FILE ]|True if FILE exists and is readable.
[ -s FILE ]|True if FILE exists and has a size greater than zero.
[ -t FD ]|True if file descriptor FD is open and refers to a terminal.
[ -u FILE ]|True if FILE exists and its SUID (set user ID) bit is set.
[ -w FILE ]|True if FILE exists and is writable.
[ -x FILE ]|True if FILE exists and is executable.
[ -O FILE ]|True if FILE exists and is owned by the effective user ID.
[ -G FILE ]|True if FILE exists and is owned by the effective group ID.
[ -L FILE ]|True if FILE exists and is a symbolic link.
[ -N FILE ]|True if FILE exists and has been modified since it was last read.
[ -S FILE ]|True if FILE exists and is a socket.
[ FILE1 -nt FILE2 ]|True if FILE1 has been changed more recently than FILE2, or if FILE1 exists and FILE2 does not.
[ FILE1 -ot FILE2 ]|True if FILE1 is older than FILE2, or is FILE2 exists and FILE1 does not.
[ FILE1 -ef FILE2 ]|True if FILE1 and FILE2 refer to the same device and inode numbers.
[ -o OPTIONNAME ]|True if shell option "OPTIONNAME" is enabled.
[ -z STRING ]|True of the length if "STRING" is zero.
[ -n STRING ] or [ STRING ]|True if the length of "STRING" is non-zero.
[ STRING1 == STRING2 ]|True if the strings are equal. "=" may be used instead of "==" for strict POSIX compliance.
[ STRING1 != STRING2 ]|True if the strings are not equal.
[ STRING1 < STRING2 ]|True if "STRING1" sorts before "STRING2" lexicographically in the current locale.
[ STRING1 > STRING2 ]|True if "STRING1" sorts after "STRING2" lexicographically in the current locale.
[ ARG1 OP ARG2 ]|"OP" is one of -eq, -ne, -lt, -le, -gt or -ge. These arithmetic binary operators return true if "ARG1" is equal to, not equal to, less than, less than or equal to, greater than, or greater than or equal to "ARG2", respectively. "ARG1" and "ARG2" are integers.

Operation|Effect
---------|------
[ ! EXPR ]|True if EXPR is false.
[ ( EXPR ) ]|Returns the value of EXPR. This may be used to override the normal precedence of operators.
[ EXPR1 -a EXPR2 ]|True if both EXPR1 and EXPR2 are true.
[ EXPR1 -o EXPR2 ]|True if either EXPR1 or EXPR2 is true.

### Loops

```
    for planet in Mercury Venus Earth Mars Jupiter Saturn Uranus Neptune Pluto
    do
      echo $planet  # Each planet on a separate line.
    done
```

### Switch case

```
    case "$1" in
        start)
            start
            ;;
        stop)
            stop
            ;;
        status)
            status anacron
            ;;
        restart)
            stop
            start
            ;;
        condrestart)
            if test "x`pidof anacron`" != x; then
                stop
                start
            fi
            ;;
        *)
            echo $"Usage: $0 {start|stop|restart|condrestart|status}"
            exit 1

    esac
```

## Infos

### Determine about a given command

```
    $ type ls
    ls is aliased to `ls --color=auto'
    $ type cd
    cd is a shell builtin
    $ type rm
    rm is /bin/rm
    $ 
    $ command -V ls
    ls is aliased to `ls --color=auto'
```

- [type](http://linuxcommand.org/lc3_man_pages/typeh.html)
- [command](http://man.cx/command(1))

### Various commands

#### less

```
    $ # To use less for monitoring a changing file.
    $ less +F yourfile.txt
    $ # Similarly with tail (can handle several files).
    $ tail -f youfile.txt
```

```
    $ # get less directly scrolled to the end
    $ less +G youfile.txt
```

## Redirection

### Redirect into a choosen file-descriptor

```
    while read -u 5 item
    do
        # something
    done 5< input-file.txt
```

## File managment

### read line by line

```
    while read line
    do
      echo "$line"
    done
```

### File opened in choosen file-descriptor

```
    # creation file handle on fd 5.
    exec 5< input-file.txt

    # use it.
    read line <&5
    # The read here wont move the file pointer for other redirections of the same file like "read line < input-file.txt".

    # close handle.
    exec 5<&-
```

### Generate files

#### With size

```
    # Zero filled for 100MB by chunk of 1KB.
    $ dd if=/dev/zero of=/tmp/1Mo.zero bs=1KB count=100000
    
    # Randomly filled for 100MB by chunk of 1KB.
    $ dd if=/dev/urandom of=/tmp/1Mo.random bs=1KB count=100000
    
    # Randomly filled for 100MB by chunk of 1KB moving 99 999 blocks in one time.
    $ dd if=/dev/urandom of=/tmp/100Mo.random bs=1K seek=99999 count=1
    
    # Fastest way to randomly filled a file by size function.
    # Will output a base64 formated file of 1GB (2**30) non-formated and *3/4 for Base64 overhead, making the encoded output 1GB.
    $ openssl rand -out sample.txt -base64 $(( 2**30 * 3/4 ))
    
    # Allocate for 10GB.
    $ fallocate -l 10G gentoo_root.img
    
    # Output readable file with not duplicated content with 100 lines.
    $ ruby -e 'a=STDIN.readlines;100.times do;b=[];4.times do; b << a[rand(a.size)].chomp end; puts b.join(" "); end' < /usr/share/dict/words > file.txt
```

#### Create a Swap file

To add a swap file:

1. Determine the size of the new swap file in megabytes and multiply by 1024 to determine the number of blocks. For example, the block size of a 64 MB swap file is 65536.

2. At a shell prompt as root, type the following command with count being equal to the desired block size:  
`dd if=/dev/zero of=/swapfile bs=1024 count=65536`

3. Setup the swap file with the command:  
`mkswap /swapfile`

4. To enable the swap file immediately but not automatically at boot time:  
`swapon /swapfile`

5. To enable it at boot time, edit /etc/fstab to include the following entry:  
`/swapfile swap swap defaults 0 0`  
The next time the system boots, it enables the new swap file.

6. After adding the new swap file and enabling it, verify it is enabled by viewing the output of the command cat /proc/swaps or free.

[Credits](https://www.centos.org/docs/5/html/5.1/Deployment_Guide/s2-swap-creating-file.html)

## Data tricks and parsing

### number the lines

```
    # Will number all lines.
    $ nl -b a input-file.txt
```

### truncate variables

```
    stringZ=abcABC123ABCabc
    #       0123456789.....
    #       0-based indexing.
    
    $ echo ${stringZ:0}                            # abcABC123ABCabc
    $ echo ${stringZ:1}                            # bcABC123ABCabc
    $ echo ${stringZ:7}                            # 23ABCabc
    
    $ echo ${stringZ:7:3}                          # 23A
                                                 # Three characters of substring.
    
    # Is it possible to index from the right end of the string?

    $ echo ${stringZ:-4}                           # abcABC123ABCabc
    # Defaults to full string, as in ${parameter:-default}.
    # However . . .
    
    $ echo ${stringZ:(-4)}                         # Cabc
    $ echo ${stringZ: -4}                          # Cabc
    # Now, it works.
    # Parentheses or added space "escape" the position parameter.
    
    # Thank you, Dan Jacobson, for pointing this out.
```

### split string

```
    $ IFS=/ read foo bar <<< titi/tutu
    $ echo "$foo"
    titi
    $ echo "$bar"
    tutu
```

```
    $ string="titi-tutu"
    $ IFS=- # use "local IFS=-" inside the function
    $ set $string
    $ echo $1 # >>> titi
    $ echo $2 # >>> tutu
```

## Network

### scp

```
Copy the file "foobar.txt" from a remote host to the local host

    $ scp your_username@remotehost.edu:foobar.txt /some/local/directory 

Copy the file "foobar.txt" from the local host to a remote host

    $ scp foobar.txt your_username@remotehost.edu:/some/remote/directory 

Copy the directory "foo" from the local host to a remote host's directory "bar"

    $ scp -r foo your_username@remotehost.edu:/some/remote/directory/bar 

Copy the file "foobar.txt" from remote host "rh1.edu" to remote host "rh2.edu"

    $ scp your_username@rh1.edu:/some/remote/directory/foobar.txt \
    your_username@rh2.edu:/some/remote/directory/ 

Copying the files "foo.txt" and "bar.txt" from the local host to your home directory on the remote host

    $ scp foo.txt bar.txt your_username@remotehost.edu:~ 

Copy the file "foobar.txt" from the local host to a remote host using port 2264

    $ scp -P 2264 foobar.txt your_username@remotehost.edu:/some/remote/directory 

Copy multiple files from the remote host to your current directory on the local host

    $ scp your_username@remotehost.edu:/some/remote/directory/\{a,b,c\} . 

    $ scp your_username@remotehost.edu:~/\{foo.txt,bar.txt\} .
```

### List program that are working with a specific port

```
    $ lsof -i :portNumber
    $ lsof -i tcp:portNumber
    $ lsof -i udp:portNumber
    $ lsof -i :80
    $ lsof -i :80 | grep LISTEN
```

### Renew DHCP allocation

```
    $ sudo dhclient -v
```

### List open ports and socket informations

```
    $ netstat -tulpn
```

### List listening socket (open port)

```
    $ netstat -nat | grep LISTEN
```

### List open IPv4 connections

```
    $ lsof -Pnl +M -i4
```

### Open/Close port

Open it to a specific IP address:

```
    $ sudo iptables -I INPUT -p tcp -s 10.1.1.2 --dport 22 -j ACCEPT
    $ sudo iptables-save
```

Close the same port to any other IP address:

```
    $ sudo iptables -I INPUT -p tcp -s 0.0.0.0/0 --dport 22 -j DROP
```

Save your changes:

```
    $ sudo iptables-save
```

### network service

```
    $ service networking stop
    $ service networking start
    $ service networking restart
```

```
    $ sudo /etc/init.d/networking stop
    $ sudo /etc/init.d/networking start
    $ sudo /etc/init.d/networking restart
```

### Check domain record location

```
    $ dig +noall +answer example.com
    ;example.com.
    example.com.   73  IN  A 192.30.252.153
    example.com.   73  IN  A 192.30.252.154
```

### mount windows distant point

[Mount samba shares with utf8 encoding using cifs](https://ubuntuforums.org/showthread.php?t=288534)

## inotify (Monitor file system activity)

[C tutorial](https://www.ibm.com/developerworks/linux/library/l-ubuntu-inotify/index.html)

## traps

trap an event into a bash query:

```
    declare -t VARIABLE=value

    trap "echo VARIABLE is being used here." DEBUG
```

```
    #!/bin/bash
    # traptest.sh
    
    trap "echo Booh!" SIGINT SIGTERM
    echo "pid is $$"
    
    while :			# This is the same as "while true".
    do
      sleep 60	# This script is not really doing anything.
    done
```

## cron

The cron jobs run in their own shell.

```
    $ # Know about the cron deamon status.
    $ service cron status
    $ # OR
    $ pgrep cron
    
    $ # Edit your per-user crontab file (/tmp/crontab.:ID/crontab).
    $ crontab -e
    
    $ # restart cron
    $ restart cron
```

System crontabs are located likely : `/etc/cron.daily/` or `/etc/cron.hourly` etc.

[Whenever](https://github.com/javan/whenever) could be a good tool for managing your cron jobs

(You may be interested in crond too).

## Archives

### tar

- v : verbose
- f : archive file name
- x : extract
- c : create
- z : stands for gz stands for gzip stands for gunzip

```
    $ # create
    $ tar -zcvf archive-name.tar.gz directory-name
    $ # extract
    $ tar -xvf archive.tar.gz
```

### others

```
    pacman -U archive-pkg.tar.gz
```

## Misc

### attribute cores to tasks

To run `make test` (for example) in its own cpu's core:

```
   taskset -c 1 make test
```

### crypt files

```
    # encrypt
    openssl enc -in foo.bar \
        -aes-256-cbc \
        -pass stdin > foo.bar.enc

    # decrypt
    openssl enc -in foo.bar.enc \
        -d -aes-256-cbc \
        -pass stdin > foo.bar
```

### Generating a new SSH key

```
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
```

You may want to change the destination/name for the final key file name.

### dialog

```
    {
        for ((i = 0 ; i <= 100 ; i+=20)); do
            sleep 1
            echo $i
        done
    } | dialog --gauge "Please wait while installing" 6 60 0
```

### merge PDFs

```
    gs -dBATCH -dNOPAUSE -q -sDEVICE=pdfwrite -dPDFSETTINGS=/prepress -sOutputFile=merged.pdf file1.pdf file2.pdf
```

### System

#### Install and packages managments

##### Install a program manually

The simplest way to do that (if you haven't any documentation indicating anything of course) is to copy the full program into `/usr/share/program_name/`.
Then create a script as `/usr/bin/program_name` containing:

```
    #!/bin/sh
    #
    
    # for example or whatever you need to do to run your application.
    /usr/bin/firefox --app "/usr/share/pencil/application.ini"
```

##### Install a program from a .deb file package

```
    $ # Most common way.
    $ sudo dpkg -i v3.3.4.deb
    $ sudo apt-get install -f
    $ # The `-f` means `--fix-broken`: "When dpkg install a package and package dependency is not satisfied, it leaves the package in unconfigured state and that package is considered as broken.".
    $ # Using `apt`.
    $ sudo apt install ./name.deb
    $ # There is also a way to install it through GUI via `gdebi`.
```

[Credits](https://unix.stackexchange.com/a/159114/207334)

##### Add backports to your packages manager

Add this line to your `/etc/apt/sources.list` (here for `jessie-backports` example):

```
    deb http://ftp.debian.org/debian jessie-backports main
```

Then you can install from backports (here with `jessie-backports` example):

```
    $ sudo apt-get -t jessie-backports install certbot
```

##### Install sudo

As a sudoers:

```
    apt-get install sudo -y
    adduser USERNAME
```

#### Having problems with Locale

Add to `/etc/environment` or probably best to `/etc/default/locale` the following lines:

```
    LC_ALL=en_US.UTF-8
    LANGUAGE=en_US.UTF-8
    LANG=en_US.UTF-8
```

#### Run a script at boot

Edit the file `/etc/rc.local` and enter the command to run at boot.
Absolute paths are required for example: `/home/pi/myscript.py` rather than `myscript.py`.

### Certificate

Using letsencrypt and certbot:
[https://certbot.eff.org/](https://certbot.eff.org/)

## References

- [http://wiki.bash-hackers.org](http://wiki.bash-hackers.org)
- [http://man.cx](http://man.cx)
- [tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html](tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)
- [www.gnu.org/software/coreutils/nl](www.gnu.org/software/coreutils/nl)
- [http://www.cyberciti.biz/faq/what-process-has-open-linux-port/](http://www.cyberciti.biz/faq/what-process-has-open-linux-port/)
- [https://unix.stackexchange.com/questions/162960/how-can-i-encrypt-a-file](https://unix.stackexchange.com/questions/162960/how-can-i-encrypt-a-file)
- [http://www.hypexr.org/linux_scp_help.php](http://www.hypexr.org/linux_scp_help.php)
- [https://www.vultr.com/docs/how-to-use-sudo-on-debian-centos-and-freebsd](https://www.vultr.com/docs/how-to-use-sudo-on-debian-centos-and-freebsd)