#!/bin/bash
apt-get update
apt-get upgrade -y
#MySQL (libmysqlclient-dev is needed for the mysql2 gem)
#-------------------------------------------------------
apt-get install -y mysql-server-5.6
# apt-get install -y libmysqlclient-dev
#Git
#---
apt-get install -y git
#Ruby
#----
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io  | bash -s stable
. /etc/profile.d/rvm.sh
rvm install 2.3.1
gem update --system
gem install bundler
#Node
#----
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.31.7/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install 6.1
#Copy the version of node you just installed to /usr/local so all users can access it
n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local
#apt-get install -y build-essential
#SphinxSearch
#------------
apt-get install -y sphinxsearch
#ImageMagick
#------------
apt-get install -y imagemagick

# #Sharetribe Installation
# #=======================
cd ~
git clone --branch v5.11.0 --depth 1 git://github.com/sharetribe/sharetribe.git
cd sharetribe
bundle install
# npm install --unsafe-perm
cp config/database.example.yml config/database.yml
#Add db details
cp config/config.example.yml config/config.yml
# bundle exec rake db:create
# bundle exec rake db:schema:load
# bundle exec rake ts:index
# bundle exec rake ts:start
