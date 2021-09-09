# Linux Machine Setup Guide

This is my step-by-step guide on how I set up a fresh installation of Linux. This directory contains scripts that automate various parts of the process. Note that you will need Internet connection to follow this guide.

## 1. Enable Sudo

Add your username to the sudo group with the following commands:

```
su -
usermod -aG sudo <username>
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

Finally update the apt cache with the following command:

```
sudo apt-get update
```

## 3. Add GitHub SSH Key

Generate a new SSH key from your email with the following commands:

```
ssh-keygen -t rsa -b 4096 -C '<email>'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Copy the SSH public key to your clipboard with the following command:

```
sudo apt-get install xclip -y
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Create a new SSH key in [GitHub](https://github.com/settings/keys) and paste the contents of the clipboard into the *Key* field. This will allow you to push commits to GitHub without having to type in your password every time.

## 4. Install Packages

Clone this repository from GitHub into `~/bin` with the following commands:

```
sudo apt-get install git -y
git clone git@github.com:TusharK54/bin.git $HOME/bin
```

### Debian

Automatically install packages by running the following script:

```
sudo ~/bin/linux-setup/packages/apt-install.sh
```


## 5. Look and Feel

Clone and setup the dotfiles bare-respository from GitHub with the following:

```
git clone --bare git@github.com:TusharK54/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no
dotfiles push --set-upstream origin master

rm ~/.bashrc
dotfiles checkout
```

Open LXAppearance with the following command:

```
lxappearance
```

Below are my default LXAppearance settings. They should all have been downloaded with the dotfiles repository.
- Widget style - **Adapta Nokto** 
- Default font - **Fixedsys Excelsior 3.01-L2** size **12**
- Icon theme - **DamaDamas**

## 6. Set up File System

Automatically create symbolic links and rename directories in the home directory by running the following script:

```
~/bin/linux-setup/setup-dirs/main.py
```

Dropbox should have been installed in the previous step. Install the Dropbox daemon, connect your account, and start syncing your files with the following command:

```
dropbox start -i
```

It may take some time for Dropbox to begin downloading your files but there is no need to wait for it. You can monitor the progress of this process with the following command:

```
watch -n 1 "df / -h ; echo ; dropbox status"
```

## 7. Login

Logout and select `i3` at the login screen.

Finally:
- Sign into Firefox to sync passwords
- Sign into Visual Studio Settings Sync
