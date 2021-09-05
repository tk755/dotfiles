# New Distro Setup

This is my step-by-step guide on how I set up a fresh installation of Linux. This directory contains scripts that automate various parts of the process. Note that you will need Internet connection.

### 1. Enable sudo

Add your username to the sudo group with the following:

```
su -
usermod -aG sudo <username>
exit
```

Then logout and login to gain sudo access.

### 2. Modify Debian package sources

Open the file `/etc/apt/sources.list/` in an editor as root. 

Comment or delete any lines that begins with `deb cdrom`. This will allow packages to be installed from online repositories instead of expecting a CD.

Some packages we will install (e.g. polybar) require backports, which are packages from testing and unstable that are recompiled to run without new libraries on a stable Debian distribution. To enable backports, append the following line to the bottom of the file:

```
deb http://deb.debian.org/debian/ bullseye-backports main non-free contrib
deb-src http://deb.debian.org/debian/ bullseye-backports main non-free contrib
```

Finally update the apt cache with the following:

```
sudo apt update
```

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

Dropbox will have been installed in the previous step. Run the run the following command to connect your account to it:

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

### 6. Set up home directory

After Dropbox is finished syncing, set up symbolic links and rename directories in the home directory by running the following script:

```
./setup-dirs/main.py
```

### 7. Set up i3 gaps





### TODO

- git
- i3 gaps
