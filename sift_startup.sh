sudo apt-get update -y 
sudo apt-get git gpg -y
sudo curl -Lo /usr/local/bin/sift https://github.com/sans-dfir/sift-cli/releases/download/v1.8.5/sift-cli-linux
sudo curl -Lo /tmp/sift.sha256.asc https://github.com/sans-dfir/sift-cli/releases/download/v1.8.5/sift-cli-linux.sha256.asc
sudo chmod +x /usr/local/bin/sift
gpg --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 22598A94
gpg --verify /tmp/sift.sha256.asc
sift install

