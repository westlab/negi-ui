#! /bin/bash

grunt clean
grunt build

BASEDIR=$(dirname $0)
sudo rm -rf /var/www/2015/dist
sudo cp -rf $BASEDIR/dist /var/www/2015/
sudo service nginx restart
