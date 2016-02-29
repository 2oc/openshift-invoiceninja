#!/bin/bash

cd /tmp

wget https://dl.dropboxusercontent.com/u/2909575/ninja-v2.5.0.3.zip
cd /app
unzip /tmp/ninja-v2.5.0.3.zip

php artisan optimize
