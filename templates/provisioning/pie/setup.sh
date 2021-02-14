sudo apt-get update
sudo apt-get upgrade
sudo apt-get install dirmngr
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 2C0D3C0F
sudo wget https://raw.githubusercontent.com/XavierBerger/RPi-Monitor/master/src/etc/apt/sources.list.d/rpimonitor.list -O /etc/apt/sources.list.d/rpimonitor.list
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y ncdu rpimonitor curl git
# for home assistant
sudo apt-get install network-manager apparmor-utils
git clone https://github.com/SensorsIot/IOTstack.git
curl -sSL https://install.pi-hole.net | bash
sudo apt autoremove
sudo raspi-config
sudo reboot
