#!/bin/bash
sudo apt-get update

#password for mySQL
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password Something@'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password Something@'

#Install nginx, php, mysql memcached, and other important things.
sudo apt-get -y install nginx php5-fpm php5-mysql sendmail php5-cli git mcrypt php5-mcrypt php5-intl curl libcurl3 libcurl3-dev php5-curl php5-gd php5-imagick php5-dev entr php5-memcache php5-memcached memcached mysql-server mysql-client php5-sqlite

#handle mcrypt issues
sudo ln -s /etc/php5/conf.d/mcrypt.ini /etc/php5/mods-available/mcrypt.ini
sudo php5enmod mcrypt

#configure git
git config --global user.email "vagrant@wesleyhurd.com"
git config --global user.name "Vagrant"

#Install/Setup php5-xdebug
/vagrant/VagrantScripts/xdebug_setup.sh

#Install/Setup phpmyadmin
/vagrant/VagrantScripts/phpmyadmin_setup.sh

#Install/Setup elasticsearch
/vagrant/VagrantScripts/elasticsearch_setup.sh

#Install/Setup NodeJS scripts
/vagrant/VagrantScripts/nodejs_setup.sh

#configure nginx
/vagrant/VagrantScripts/nginx_configure.sh

#install composer globally
/vagrant/VagrantScripts/composer_setup.sh