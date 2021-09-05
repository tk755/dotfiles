# `distro-setup/` v.1.0

This directory contains my scripts for automating the process of setting up and installing applications onto a fresh installation of Linux.

## Distro Setup Process

This is my step-by-step guide on how I set up a new installation of Linux.

### 1. Enable sudo

Add your username to the sudo group with the following:

```
su -
usermod -aG sudo <username>
exit
```

Then logout and login to gain sudo access.

### 2. Modify Debian package sources

Edit the file `/etc/apt/sources.list/` as root to remove line that begins with `deb cdrom`. This will allow packages to be installed from online repositories instead of expecting a CD.

### 3. Clone scripts and dotfiles from GitHub

Clone this repository from GitHub with the following:

```
sudo apt install git
git clone https://github.com/TusharK54/scripts.git $HOME/bin
```

Clone and setup the dotfiles bare-respository from GitHub with the following:

```
git clone --bare https://github.com/TusharK54/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no
dotfiles push --set-upstream origin master

dotfiles checkout
```

### 4. Install packages

Install packages by running the appropriate script in `distro-setup/packages` that matches the correct package manager. 

For example, install packages on a system with the `apt` package manager with the following command:

```
sudo ./packages/apt-install.sh
```

### 5. Set up Dropbox

Dropbox will have been installed in the previous step. To connect your account to it, run the following command and follow the prompts:

```
dropbox start
```

Set Dropbox to automatically start at login with the following command:

```
dropbox autostart
```

### 6. Set up home directory

After Dropbox is finished syncing, set up symbolic links and rename directories in the home directory by running the following script:

```
./setup-dirs/main.py
```

### TODO

- git
- i3 gaps
