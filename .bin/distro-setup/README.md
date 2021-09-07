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
sudo apt-get update
```

### 3. Install Packages

Clone this repository from GitHub into `~/bin` with the following:

```
sudo apt-get install git -y
git clone https://github.com/TusharK54/scripts.git $HOME/bin
```

Install packages by running the appropriate script in `~/bin/distro-setup/packages` that matches the correct package manager. For example, install packages on a system with the `apt` package manager with the following command:

```
sudo ~/bin/distro-setup/packages/apt-install.sh
```

### 4. Set up Dropbox and File System

Dropbox should have been installed in the previous step. Run the following command to install the Dropbox daemon, connect your account to it, and start syncing your files:

```
dropbox start -i
```

It may take some time for Dropbox to begin downloading your files. You can monitor the progress of your file downloads with the following command:

```
watch -n 1 "df / -h ; echo ; dropbox status"
```

After Dropbox is finished syncing, automatically rename directories and set up symbolic links in the home directory by running the following script:

```
~/bin/distro-setup/setup-dirs/main.py
```

### 5. Add GitHub SSH Key

Generate a new SSH key with the following:

```
ssh-keygen -t rsa -b 4096 -C '<email>'
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa
```

Copy the SSH public key to your clipboard with the following:

```
xclip -sel clip < ~/.ssh/id_rsa.pub
```

Create a new SSH key in [GitHub](https://github.com/settings/keys) and paste the contents of the clipboard into the *Key* field. This will allow you to push commits to GitHub without having to type in your password every time.

### 6. Look and Feel

Clone and setup the dotfiles bare-respository from GitHub with the following:

```
git clone --bare https://github.com/TusharK54/dotfiles.git $HOME/.dotfiles

alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

dotfiles config --local status.showUntrackedFiles no
dotfiles push --set-upstream origin master

rm ~/.bashrc
dotfiles checkout
```

Open LXAppearance by running the following command:

```
sudo apt-get install lxappearance -y
lxappearance
```

My default settings are **Adapta Nokto** for widget style, **Fixedsys Excelsior 3.01-L2** for default font, and **DamaDamas** for icon theme. They should all have been downloaded with the dotfiles repository.

### 7. Reboot

Finally reboot the computer. Select `i3` as the desktop environment and make sure that it works.

Remove any trace of the desktop environment you download by running something like the following:

```
sudo apt-get purge xfce*
```

Welcome to your new machine.
