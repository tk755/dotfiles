
apt-get update -y

echo 'Installing commands'
apt-get install `tr '\r\n' ' ' < commands.txt` -y

echo 'Installing applications'
apt-get install `tr '\r\n' ' ' < applications.txt` -y

# https://linuxize.com/post/how-to-install-google-chrome-web-browser-on-debian-10/
echo 'Installing Google Chrome...'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
apt install ./google-chrome-stable_current_amd64.deb -y
rm google-chrome-stable_current_amd64.deb

# https://linuxize.com/post/how-to-install-visual-studio-code-on-ubuntu-18-04/
echo 'Installing Visual Studio Code'
apt install software-properties-common apt-transport-https -y
wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
add-apt-repository 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'
sudo apt update
apt install code
