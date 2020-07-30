#!/bin/bash
# This script installs commands and applications for my Debian setup

if [ $USER != 'root' ]; then
    echo -e You must be "\e[1m\e[31mroot\e[0m" to run this script
    exit
fi

apt-get update -y

echo 'Installing packages'
apt-get install `tr '\r\n' ' ' < packages` -y

# install required commands to install applications
apt-get install apt-transport-https ca-certificates curl software-properties-common gnupg-agent -y

# https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
echo 'Installing Google Chrome...'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb

# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
echo 'Installing Visual Studio Code...'
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update -y
apt-get install code -y

# https://www.spotify.com/us/download/linux/
echo 'Installing Spotify...'
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update -y
apt-get install spotify-client -y

# https://docs.docker.com/engine/install/debian/
echo 'Installing Docker...'
apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y
apt-get install docker-ce docker-ce-cli containerd.io -y
usermod -aG docker $USER
