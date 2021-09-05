# `distro-setup/` v.1.0

This directory contains my scripts for automating the process of setting up and installing applications onto a fresh installation of Linux.

## Distro Setup Process

### Enabling sudo

First add your username to the sudo group with the following:

```
su -
usermod -aG sudo <username>
exit
```

Then logout and login to gain sudo access.

### Installing packages

Next install packages by running the appropriate script in `distro-setup/packages` that matches the correct package manager. 

For example, install packages on a system with the `apt` package manager with the following command:

```
sudo ./packages/apt-install.sh
```

### Setting Up Dropbox

Dropbox will have been installed in the previous step. To 

### Setting Up Home Directory

Set up symbolic links and rename directories in the home directory by running the following script:

```
./setup-dirs/main.py
```
