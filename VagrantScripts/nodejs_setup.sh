
#!/bin/bash

#install NodeJs & Browserify
sudo apt-get -y install nodejs
sudo ln -s /usr/bin/nodejs /usr/bin/node
sudo apt-get -y install npm
sudo npm install -g browserify
sudo npm install -g watchify
sudo npm install hbsfy
sudo npm install handlebars@