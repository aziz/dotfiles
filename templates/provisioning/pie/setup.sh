sudo apt-get update
sudo apt-get upgrade
sudo apt full-upgrade

# install Cockpit and git
sudo apt-get install -y git cockpit nala

# install pihole
curl -sSL https://install.pi-hole.net | bash

# install IOTstack
git clone https://github.com/SensorsIot/IOTstack.git

# Install Homebridge
curl -sSfL https://repo.homebridge.io/KEY.gpg | sudo gpg --dearmor | sudo tee /usr/share/keyrings/homebridge.gpg  > /dev/null
echo "deb [signed-by=/usr/share/keyrings/homebridge.gpg] https://repo.homebridge.io stable main" | sudo tee /etc/apt/sources.list.d/homebridge.list > /dev/null
sudo apt-get update
sudo apt-get install homebridge

# Clean up
sudo apt clean
sudo apt autoremove
sudo raspi-config
sudo reboot

# Add these to .profile
alias cls="clear"
alias c="clear"
alias u="cd .."
alias w="which"
alias reload="source ~/.profile"
