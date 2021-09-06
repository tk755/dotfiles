# New Distro Setup

This is my step-by-step guide on how I set up a fresh installation of Linux. This directory contains scripts that automate various parts of the process. Note that you will need Internet connection to follow this guide.

### 1. Enable Sudo

Add your username to the sudo group with the following:

```
su -
usermod -aG sudo <username>
exit
```

Then logout and login to gain sudo access.

### 2. Modify Debian Package Sources

Open the file `/etc/apt/sources.list/` in an editor as root. 

Comment or delete any lines that begin with `deb cdrom`. This will allow packages to be installed from online repositories instead of expecting a CD.

Some packages we will install (e.g. polybar) require [backports](https://wiki.debian.org/Backports). To enable backports, append the following line to the bottom of the file:

```
deb http://deb.debian.org/debian/ bullseye-backports main non-free contrib
deb-src http://deb.debian.org/debian/ bullseye-backports main non-free contrib
```

Finally update the apt cache with the following:

```
sudo apt update
```

### 3. Clone Linux Repos from GitHub

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

### 4. Install Packages

Install packages by running the appropriate script in `distro-setup/packages` that matches the correct package manager. 

For example, install packages on a system with the `apt` package manager with the following command:

```
sudo ./packages/apt-install.sh
```

### 5. Set up Dropbox

Dropbox should have been installed in the previous step. Run the run the following command to connect your account to it:

```
~/.dropbox-dist/dropboxd
```

Start Dropbox and begin syncing your files with the following command:

```
dropbox start
```

You can monitor the progress of your file downloads with the following command:

```
watch -n 1 dropbox status
```

### 6. Set up File System

After Dropbox is finished syncing, automatically rename directories and set up symbolic links in the home directory by running the following script:

```
./setup-dirs/main.py
```

### 7. Look and Feel

Open LXAppearance by running the following command:

```
lxappearance
```

My default settings are **Adapta Nokto** for widget style, **Fixedsys Excelsior 3.01-L2** for default font, and **DamaDamas** for icon theme. They should all have been downloaded with the dotfiles repository.

### 8. Reboot

Finally reboot the computer. Select `i3` as the desktop environment and make sure that it works.

Welcome to your new machine.
