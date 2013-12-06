#!/bin/sh

#This script is designed to start the ruby server, installing software if needs be.

apt-get update

echo "installing required software packages..."
apt-get -y install curl git nodejs postgresql-9.1 postgresqp-server-dev-9.1

#Make sure we have ruby
if command -v ruby >/dev/null ;then
    echo "Ruby is already installed"
else
    echo "Ruby not installed."

    echo "Installing RVM."
    curl -L https://get.rvm.io >> rvmInstall.sh
    chmod +x rvmInstall.sh
    ./rvmInstall.sh
    source ~/.rvm/scripts/rvm
    echo "Intstalling ruby 2.0.0. This may take some time..."
    rvm install ruby-2.0.0
fi


#this stuff always happens
bundle install
rake db:migrate

#populate some initial data

echo "Your Ruby on Rails environment is ready."
echo "Type 'rails server' in the command line to run the server."
echo "Once this is done, use the URL 'localhost:3000' to run the application."