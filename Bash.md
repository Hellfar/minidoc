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

## Redirection

### Redirect into a choosen file-descriptor

```
    while read -u 5 item
    do
        # something
    done 5< input-file.txt
```

## File managment

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
	dd if=/dev/zero of=/tmp/1Mo.zero bs=1KB count=100000

	# Randomly filled for 100MB by chunk of 1KB.
	dd if=/dev/urandom of=/tmp/1Mo.random bs=1KB count=100000

	# Randomly filled for 100MB by chunk of 1KB moving 99 999 blocks in one time.
	dd if=/dev/urandom of=/tmp/100Mo.random bs=1K seek=99999 count=1

	# Fastest way to randomly filled a file by size function.
	# Will output a base64 formated file of 1GB (2**30) non-formated and *3/4 for Base64 overhead, making the encoded output 1GB.
	openssl rand -out sample.txt -base64 $(( 2**30 * 3/4 ))

	# Allocate for 10GB.
	fallocate -l 10G gentoo_root.img

	# Output readable file with not duplicated content with 100 lines.
	ruby -e 'a=STDIN.readlines;100.times do;b=[];4.times do; b << a[rand(a.size)].chomp end; puts b.join(" "); end' < /usr/share/dict/words > file.txt
```

## Data tricks and parsing

### number the lines

```
    # Will number all lines.
    nl -b a input-file.txt
```

### truncate variables

```
stringZ=abcABC123ABCabc
#       0123456789.....
#       0-based indexing.

echo ${stringZ:0}                            # abcABC123ABCabc
echo ${stringZ:1}                            # bcABC123ABCabc
echo ${stringZ:7}                            # 23ABCabc

echo ${stringZ:7:3}                          # 23A
                                             # Three characters of substring.

# Is it possible to index from the right end of the string?

echo ${stringZ:-4}                           # abcABC123ABCabc
# Defaults to full string, as in ${parameter:-default}.
# However . . .

echo ${stringZ:(-4)}                         # Cabc 
echo ${stringZ: -4}                          # Cabc
# Now, it works.
# Parentheses or added space "escape" the position parameter.

# Thank you, Dan Jacobson, for pointing this out.
```

## Network

```
    lsof -i :portNumber
    lsof -i tcp:portNumber
    lsof -i udp:portNumber
    lsof -i :80
    lsof -i :80 | grep LISTEN
```

## inotify (Monitor file system activity)

[C tutorial](https://www.ibm.com/developerworks/linux/library/l-ubuntu-inotify/index.html)

## References

- [http://wiki.bash-hackers.org](http://wiki.bash-hackers.org)
- [http://man.cx](http://man.cx)
- [tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html](tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html)
- [www.gnu.org/software/coreutils/nl](www.gnu.org/software/coreutils/nl)
- [http://www.cyberciti.biz/faq/what-process-has-open-linux-port/](http://www.cyberciti.biz/faq/what-process-has-open-linux-port/)
