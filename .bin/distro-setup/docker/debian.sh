# https://docs.docker.com/engine/install/debian/
apt-get remove docker docker-engine docker.io containerd runc
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable"
apt-get update -y && apt-get install docker-ce docker-ce-cli containerd.io -y
usermod -aG docker $USER
