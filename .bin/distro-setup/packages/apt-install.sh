#!/usr/bin/env bash
# This script installs packages using the apt package manager.

# Verify that script is being executed by root
if [ $USER != 'root' ]; then
    echo -e You must be "\e[1m\e[31mroot\e[0m" to run this script
    exit
fi

function ask_install {
    echo -n "Would you like to install $1? [y/n]: "
    read yn
    if [[ $yn == 'y' || $yn == 'Y' ]]; then
        return 0
    else
        return 1
    fi
}

# Install packages
apt-get update -y && apt-get install `tr '\r\n' ' ' < packages` -y

# Install packages required to install applications
apt-get install apt-transport-https ca-certificates curl software-properties-common gnupg-agent python3-pip -y

# Install Google Chrome
# https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
# if ask_install "Google Chrome" ; then
#     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#     apt-get install ./google-chrome-stable_current_amd64.deb -y
#     rm -f google-chrome-stable_current_amd64.deb
# fi

# Install Visual Studio Code
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/

if ask_install "Visual Studio Code" ; then
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    apt-get update -y && apt-get install code -y
fi

# # Install Sublime Text
# # https://www.sublimetext.com/docs/3/linux_repositories.html
# if ask_install "Sublime Text" ; then
#     wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#     echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#     apt-get update -y && apt-get install sublime-text -y
# fi

# Install VirtualBox
# https://linuxize.com/post/how-to-install-virtualbox-on-debian-10/
if ask_install "VirtualBox" ; then
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
    add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
    apt-get update -y && apt-get install virtualbox-6.0 -y
fi

# Install Docker
# https://docs.docker.com/engine/install/debian/
if ask_install "Docker" ; then
    apt-get remove docker docker-engine docker.io containerd runc
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y
    usermod -aG docker $USER
fi

# Install Spotify
# https://www.spotify.com/us/download/linux/
if ask_install "Spotify" ; then
    curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
    echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
    apt-get update -y && apt-get install spotify-client -y
fi
