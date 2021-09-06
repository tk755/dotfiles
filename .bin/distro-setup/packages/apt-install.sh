#!/usr/bin/env bash
# This script installs packages using the apt package manager.

# Verify that script is being executed by root
if [ $USER != 'root' ]; then
    echo -e You must be "\e[1m\e[31mroot\e[0m" to run this script
    exit
fi

# Asks to install package specified by $1
# Returns 0 if 'y'
function ask_install {
    echo -n "Would you like to install $1? [y/n]: "
    read yn
    if [[ $yn == 'y' || $yn == 'Y' ]]; then
        return 0
    else
        return 1
    fi
}

# Prints whether or not package $2 is installed by testing if command $1 exists
function test_install {
    if [ -x "$(command -v $1)" ]; then
        echo -e "\e[1m\e[32m$2 was successfully installed\e[0m"
    else
        echo -e "\e[1m\e[31m$2 failed to install\e[0m"
    fi
}

DEB_CODENAME=$(lsb_release --codename --short)

# Install packages
apt-get update -y || exit
apt-get install `tr '\r\n' ' ' < packages/packages.txt` -y

# Install packages required to install applications below
apt-get install wget apt-transport-https ca-certificates curl software-properties-common gnupg-agent python3-pip -y

# Install Dropbox
# https://vitux.com/how-to-install-dropbox-on-debian-10/
{
    wget -O - "https://www.dropbox.com/download?plat=lnx.x86_64" | tar xzf –
    wget -O /usr/bin/dropbox "https://www.dropbox.com/download?dl=packages/dropbox.py"
    chmod 744 /usr/bin/dropbox
}
test_install "dropbox" "Dropbox"

# Install Visual Studio Code
# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
{
    wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
    add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
    apt-get update -y && apt-get install code -y
}
test_install "code" "Visual Studio Code"

# Install VirtualBox
# https://linuxize.com/post/how-to-install-virtualbox-on-debian-10/
{
    wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | apt-key add -
    wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
    add-apt-repository "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib"
    apt-get update -y && apt-get install virtualbox-6.0 -y
}
test_install "virtualbox" "VirtualBox"

# Install Docker
# https://docs.docker.com/engine/install/debian/
{
    apt-get remove docker docker-engine docker.io containerd runc
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
    apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y
    usermod -aG docker $USER
}
test_install "docker" "Docker"

# # Install Spotify
# # https://www.spotify.com/us/download/linux/
# {
#     curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
#     echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
#     apt-get update
# }
# test_install "spotify" "Spotify"

# Build i3 gaps from source
# https://github.com/Airblader/i3/wiki/Building-from-source
{
    # install dependencies
    apt-get install meson dh-autoreconf libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev xcb libxcb1-dev libxcb-icccm4-dev libyajl-dev libev-dev libxcb-xkb-dev libxcb-cursor-dev libxkbcommon-dev libxcb-xinerama0-dev libxkbcommon-x11-dev libstartup-notification0-dev libxcb-randr0-dev libxcb-xrm0 libxcb-xrm-dev libxcb-shape0 libxcb-shape0-dev -y
    
    # clone the repository
    CWD=$(pwd)
    git clone https://www.github.com/Airblader/i3 /usr/bin/i3-gaps
    cd /usr/bin/i3-gaps
    
    # compile
    mkdir -p build && cd build
    meson ..
    ninja
    ninja install

    cd $CWD
}
test_install "i3" "i3 gaps"

# Install polybar
{
    apt -t "$DEB_CODENAME"-backports install polybar -y
}
test_install "polybar" "polybar"

# Package installations below saved for posterity:

# # Install Google Chrome
# # https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
# {
#     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#     apt-get install ./google-chrome-stable_current_amd64.deb -y
#     rm -f google-chrome-stable_current_amd64.deb
# }

# # Install Sublime Text
# # https://www.sublimetext.com/docs/3/linux_repositories.html
# {
#     wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
#     echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
#     apt-get update -y && apt-get install sublime-text -y
# }