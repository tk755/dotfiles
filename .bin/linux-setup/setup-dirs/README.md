# `setup-dirs/`

This program is used to create and rename the directories and symbolic links in my home directory. It also renames the variables in the XDG configuration file accordingly. The program does not delete non-empty directories, but will move the contents of a non-empty directory before deleting it if necessary. A log of all file operations is printed to standard output.

## `setup-dirs/main.py`

This script is the entrypoint of the program. It can be run as a script:

```bash
./main.py
```

## `setup-dirs/xdg.py`

This script retrieves the path of a XDG directory from the `$HOME/.config/user-dirs.dirs` specification file. It can be imported as a Python module or used as a script:

```bash
./xdg.py XDG_DOWNLOAD_DIR XDG_DOCUMENTS_DIR
```

## `setup-dirs/config`

This is the configuration file that the program uses to create directories and symbolic links.

### Syntax

To create a directory:
```
'path'
```

To create a directory from a symbolic link:
```
'dst-path' = 'src-path'
```

To create an XDG directory:
```
XDG-DIR: 'path'
```

To create an XDG directory from a symbolic link:
```
XDG-DIR: 'dst-path' = 'src-path'
```
