#!/bin/bash
# This script installs commands and applications for my Debian setup

# Verify that script is being executed by root
if [ $USER != 'root' ]; then
    echo -e You must be "\e[1m\e[31mroot\e[0m" to run this script
    exit
fi

# Uninstall Mozilla Firefox
apt-get purge firefox firefox-esr

if [ -d /home/$USER/.mozilla ]; then
    rm -rf /home/$USER/.mozilla
fi
if [ -d /home/$USER/.cache/mozilla ]; then
    rm -rf /home/$USER/.cache/mozilla
fi

# Install packages
apt-get update -y && apt-get install `tr '\r\n' ' ' < packages` -y

# Install packages required to install applications
apt-get install apt-transport-https ca-certificates curl software-properties-common gnupg-agent python3-pip -y

# Install Google Chrome
# https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt-get install ./google-chrome-stable_current_amd64.deb -y
rm -f google-chrome-stable_current_amd64.deb

# Install Visual Studio Code
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update -y && apt-get install code -y

# Install Spotify
# https://www.spotify.com/us/download/linux/
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update -y && apt-get install spotify-client -y

# Install Docker
# https://docs.docker.com/engine/install/debian/
apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y
usermod -aG docker $USER

# Install VirtualBox
# https://linuxize.com/post/how-to-install-virtualbox-on-debian-10/
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
apt-get update -y && apt-get install virtualbox-6.0 -y

# Powerline
wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
wget https://github.com/powerline/powerline/raw/develop/font/10-powerline-symbols.conf
mv PowerlineSymbols.otf /usr/share/fonts/X11/misc/
fc-cache -vf /usr/share/fonts/X11/misc/