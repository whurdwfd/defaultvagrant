#!/bin/bash

sudo cp /vagrant/VagrantScripts/vagrant-nginx.conf /etc/nginx/sites-enabled/vagrant-nginx.conf

sudo rm /etc/nginx/sites-enabled/default

sudo service nginx restart