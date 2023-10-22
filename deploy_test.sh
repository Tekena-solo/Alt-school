#!/bin/bash

# Update the package list and upgrade existing packages
sudo apt-get update
sudo apt-get upgrade -y

# Install Apache
sudo apt-get install -y apache2

# Install MySQL Server and set a root password
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server
sudo mysql_secure_installation

# Install PHP and required extensions
sudo apt-get install -y php libapache2-mod-php php-mysql

# Restart Apache to apply changes
sudo systemctl restart apache2

# Clone the PHP application from GitHub
git clone https://github.com/larvel/larvel /var/www/html/yourphpapp
