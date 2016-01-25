#!/bin/bash

#install php5-xdebug

sudo apt-get -y install php5-xdebug

#configure xdebug
echo "xdebug.remote_enable = on" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.remote_connect_back = on" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.remote_autostart = 0" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.profiler_enable = 0" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.profiler_output_dir = \"/tmp\"" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.remote_handler=\"dbgp\"" | sudo tee --append /etc/php5/mods-available/xdebug.ini
echo "xdebug.max_nesting_level=300" | sudo tee --append /etc/php5/mods-available/xdebug.ini