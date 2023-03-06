#!/bin/bash

# Request user input for domain name and project directory
read -p "Enter domain name: " domain_name
read -p "Enter project directory: " project_dir

# Create .conf file in Apache sites-available folder
conf_file="/etc/apache2/sites-available/${domain_name}.conf"
echo "<VirtualHost *:80>
    ServerName ${domain_name}
    DocumentRoot ${project_dir}
</VirtualHost>" > $conf_file

# Enable site and restart Apache server
a2ensite $domain_name
systemctl restart apache2

echo "New domain created successfully!"