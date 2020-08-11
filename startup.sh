sudo apt-get update -y 
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common -y 
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update -y
sudo apt-get install docker-ce docker-ce-cli containerd.io -y 
sudo service docker start
sudo docker pull docker.elastic.co/elasticsearch/elasticsearch-oss:7.0.1
#sudo docker pull appbaseio/dejavu
#sudo docker run -p 80:1358 -d appbaseio/dejavu
sudo docker run -p 80:8080  -d cars10/elasticvue

EXTERNAL_IP=$(curl -H "Metadata-Flavor: Google" http://169.254.169.254/computeMetadata/v1/instance/network-interfaces/0/access-configs/0/external-ip)
docker run -d --rm --name elasticsearch -p 9200:9200 -p 9300:9300 -e discovery.type=single-node -e http.cors.enabled=true -e http.cors.allow-origin=http://localhost:1358,http://127.0.0.1:1358,http://$EXTERNAL_IP -e http.cors.allow-headers=X-Requested-With,X-Auth-Token,Content-Type,Content-Length,Authorization -e http.cors.allow-credentials=true docker.elastic.co/elasticsearch/elasticsearch-oss:7.0.1
