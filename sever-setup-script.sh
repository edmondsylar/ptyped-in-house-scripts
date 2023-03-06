#!/bin/bash

# Update package lists
sudo apt-get update

# Install Apache
sudo apt-get install apache2 -y

# Install MySQL
sudo apt-get install mysql-server -y

# Install Node.js
curl -sL https://deb.nodesource.com/setup_lts.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PHP 7.4
sudo apt-get install php7.4 libapache2-mod-php7.4 php7.4-mysql php7.4-curl php7.4-gd php7.4-intl php7.4-mbstring php7.4-soap php7.4-xml php7.4-zip -y

# Install Composer
# curl -sS https://getcomposer.org/installer | php
# sudo mv composer.phar /usr/local/bin/composer

# install composer 
sudo apt install composer
