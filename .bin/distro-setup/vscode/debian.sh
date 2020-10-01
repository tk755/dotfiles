# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | apt-key add -
add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
apt-get update -y && apt-get install code -y
