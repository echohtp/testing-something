# Add Kali Linux Key
curl  -q archive.kali.org/archive-key.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install kali-linux
