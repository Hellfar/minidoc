# Bash

## File managment

### File opened in choosen file-descriptor
```
    # creation file handle on fd 5
    exec 5< input-file.txt
    
    # use
    read line <&5
    # The read here wont move the file pointer for other redirections of the same file like "read line < input-file.txt".
    
    # close handle
    exec 5<&-
```