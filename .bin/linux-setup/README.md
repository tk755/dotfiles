# Linux Machine Setup Guide

This is my step-by-step guide on how I set up a fresh installation of Linux. This directory contains scripts that automate various parts of the process. Note that you will need Internet connection to follow this guide.

## 1. Enable Sudo

Add your username to the sudo group.

```
su -
usermod -aG sudo tk
exit
```

Then logout and login to gain sudo access.

## 2. Modify Package Sources

### Debian

Open the file `/etc/apt/sources.list` in an editor as root. 

Comment or delete any lines that begin with `deb cdrom`. This will allow packages to be installed from online repositories instead of expecting a CD.

Some packages we will install (e.g. polybar) require [backports](https://wiki.debian.org/Backports). Enable backports by appending the following lines to the bottom of the file:

```
deb http://deb.debian.org/debian/ bullseye-backports main non-free contrib
deb-src http://deb.debian.org/debian/ bullseye-backports main non-free contrib
```

Then update the apt cache.

```
sudo apt-get update
```

## 3. Add GitHub SSH Key

Generate a new SSH key from your email.

```
ssh-keygen -t rsa -b 4096 -C tkbot744@gmail.com
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Copy the SSH public key to your clipboard.

```
sudo apt-get install xclip -y
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Create a new SSH key in [GitHub](https://github.com/settings/keys) and paste the contents of the clipboard into the *Key* field. This will allow you to push commits to GitHub without having to type in your password every time.

## 4. Install Packages

Clone this repository from GitHub into `~/bin`.

```
sudo apt-get install git -y
git clone git@github.com:tk744/bin.git $HOME/bin
```

Automatically install packages by running the following script:

```
sudo ~/bin/linux-setup/packages/install
```

## 5. Set up File System

Automatically create symbolic links and rename directories in the home directory by running the following script:

```
~/bin/linux-setup/setup-dirs/main.py
```

The Dropbox CLI should have been installed in the previous step. Now install the Dropbox daemon, connect your account, and start syncing your files with the single following command:

```
dropbox start -i
```

It may take some time for Dropbox to begin downloading your files but there is no need to wait for it. However you can monitor the progress of this process with the following command:

```
watch -n 1 "df / -h ; echo ; dropbox status"
```

## 6. Look and Feel

Clone and setup the dotfiles bare-respository from GitHub.

```
git clone --bare git@github.com:tk744/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no
dotfiles push --set-upstream origin master

rm ~/.bashrc
dotfiles checkout
```

Launch LXAppearance.

```
lxappearance
```

Below are my default LXAppearance settings. They should all have been downloaded with the dotfiles repository.
- Widget style - **Adapta Nokto** 
- Default font - **Fixedsys Excelsior 3.01-L2** size **12**
- Icon theme - **DamaDamas**

## 7. Login

Logout and select `i3` at the login screen.

Complete the following tasks to finish setting up your new machine:
- Sign into Firefox to sync passwords.
- Sign into Visual Studio Settings Sync.