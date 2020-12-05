sudo wget http://goo.gl/vewCLL -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y ncdu rpimonitor curl
# for home assistant
sudo apt-get install network-manager apparmor-utils
git clone https://github.com/SensorsIot/IOTstack.git
curl -sSL https://install.pi-hole.net | bash
sudo apt autoremove
sudo raspi-config
sudo reboot
