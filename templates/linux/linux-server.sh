#!/bin/bash

sudo wget --no-check-certificate https://github.com/joshfng/railsready/raw/master/railsready.sh && bash railsready.sh

sudo apt-get install sqlite3 libsqlite3-dev 
sudo apt-get install git curl vim
rvm use 1.9.2 --default

git clone git://github.com/aziz/dotfiles.git
cd dotfiles/bash/ && git clone git://github.com/aziz/bash-it.git .
cd .. && ./install.sh
source ~/.bashrc

## install mysql
# add solarized to repo (update janus)


# TODO: 
# 1. dotfiles
# 2. dotfiles requirements
# 3. node.js
# 4. ssh server
# 5. php
# 6. Apache
# 7. Nginx
# 8. MySQL
# 9. MongoDB
# 10. sqlite and mysql ruby gems
# 11. Tools: sudo apt-get -y install vim tmux ack htop dialog curl zip unzip

