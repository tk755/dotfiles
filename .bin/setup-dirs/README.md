# `setup-dirs`

This program is used to create and rename the directories and symbolic links in my home directory. It also renames the variables in the XDG configuration file accordingly. The program does not delete non-empty directories, and will move the contents of a non-empty directory before deleting it if needed. A log of all file operations is printed to standard output.

Run the program with either of the following commands:
```
./main.py
```
```
python3 main.py
```

## `config` syntax

To create a directory:
```
'path'
```

To create a directory from a symbolic link:
```
'dst-path' = 'src-path'
```

To set an XDG directory:
```
XDG-DIR: 'path'
```

To set an XDG directory from a symbolic link:
```
XDG-DIR: 'dst-path' = 'src-path'
```