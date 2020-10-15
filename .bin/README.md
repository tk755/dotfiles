# `~/bin`
This repository is a persistent copy of my `~/bin` directory, which contains all of my setup, configuration, and utility scripts.

### `git`

#### Clone
Using SSH:
```
git clone git@github.com:TusharK54/scripts.git $HOME/bin
```

#### Reset
Revert all files that are being tracked to what is stored in the origin (i.e. GitHub). This is a destructive action.
```
git fetch origin
git reset --hard origin/master
```

## `distro-setup/`
This directory contains scripts that install all of my applications onto a fresh install of a new Linux distribution. More details at `distro-setup/README.md`.
