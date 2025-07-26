# `packages/`

This program is used to install a set of packages using the appropriate package manager.

`packages/install` selects one of the following scripts to execute depending on the package managers installed on the system:
- `packages/apt-install.sh` - installs packages using the `apt` package manager and `.deb` files.

`packages/packages.txt` is a newline-separated list of package names that are installed simply by package managers without adding repositories.
