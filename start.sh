#! /bin/bash

grunt clean
grunt build

sudo service nginx restart
