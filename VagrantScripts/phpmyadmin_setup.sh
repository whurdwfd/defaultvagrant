#!/bin/bash

#Install phpMyAdmin
#############################
if [ ! -f /etc/phpmyadmin/config.inc.php ];
then

	# Used debconf-get-selections to find out what questions will be asked
	# This command needs debconf-utils

	# Handy for debugging. clear answers phpmyadmin: echo PURGE | debconf-communicate phpmyadmin

	export DEBIAN_FRONTEND=noninteractive

	echo 'phpmyadmin phpmyadmin/dbconfig-install boolean true' | debconf-set-selections

	echo 'phpmyadmin phpmyadmin/app-password-confirm password Something@' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/admin-pass password Something@' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/password-confirm password Something@' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/setup-password password Something@' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/database-type select mysql' | debconf-set-selections
	echo 'phpmyadmin phpmyadmin/mysql/app-pass password Something@' | debconf-set-selections

	echo 'dbconfig-common dbconfig-common/mysql/app-pass password Something@' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/mysql/app-pass password' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/password-confirm password Something@' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/app-password-confirm password Something@' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/app-password-confirm password Something@' | debconf-set-selections
	echo 'dbconfig-common dbconfig-common/password-confirm password Something@' | debconf-set-selections

	apt-get -y install phpmyadmin
fi

sudo service php5-fpm restart