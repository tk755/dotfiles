# https://www.spotify.com/us/download/linux/
curl -sS https://download.spotify.com/debian/pubkey.gpg | apt-key add -
echo "deb http://repository.spotify.com stable non-free" | tee /etc/apt/sources.list.d/spotify.list
apt-get update -y && apt-get install spotify-client -y
