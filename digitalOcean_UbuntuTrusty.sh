#!/bin/bash
sudo apt-get install -y git
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io  | bash -s stable
source /etc/profile.d/rvm.sh
rvm install 2.3.1
gem update --system
gem install bundler
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install 6.1
sudo apt-get install -y sphinxsearch
sudo apt-get install -y imagemagick
sudo apt-get install -y mysql-server-5.6
#libmysqlclient-dev is needed for the mysql2 gem
sudo apt-get install libmysqlclient-dev
git clone git://github.com/sharetribe/sharetribe.git
cd sharetribe
bundle install
