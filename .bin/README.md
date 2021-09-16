# `~/bin/`

This repository is a persistent copy of my `~/bin/` directory, which contains all of my personal setup, configuration, and utility scripts.

## Using this Repository

### Clone

Using SSH:
```
git clone git@github.com:TusharK54/bin.git $HOME/bin
```

### Reset

Revert all files that are being tracked to what is stored in the origin (i.e. GitHub). This is a locally destructive action.
```
git fetch origin
git reset --hard origin/master
```

## Scripts

`laptopkb` checks if an OLKB keyboard is connected, and automatically enables or disables the laptop keyboard appropriately.

`sc` launches an screenshot selection tool.

`setdisplay` configures connected monitors and sets wallpaper image based on the hostname of the machine.
