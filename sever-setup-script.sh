#!/bin/bash

# Update package lists
sudo apt-get update

sudo apt-get upgrade

# Install Apache
sudo apt-get install apache2 -y

# Install MySQL
sudo apt-get install mysql-server -y

# Install Node.js
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PHP 7.4
sudo apt-get install php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml php7.4-zip -y

# installing extra php scripts.
sudo apt install libapache2-mod-php #this resoles the issue of reading the php files as text files.

sudo apt install pm2 # this package helps you run node scripts in the background.


# Install Composer
# curl -sS https://getcomposer.org/installer | php
# sudo mv composer.phar /usr/local/bin/composer

# install composer 
sudo apt install composer

systemctl reload apache2
