#!/usr/bin/env bash

# change to working directory
cd /var/www

# install java
apt update && apt install -y openjdk-9-jre openjdk-9-jre-headless

# install newman
su -lc /bin/bash -c 'source .bashrc && npm install newman --global' laradock

# create s3 bucket
mc mb minio/server

# create .release file (depreceated, to be removed)
echo -n dev > .release

# remove old vendor dir/libs
rm -rf vendor

# install composer.json
composer install --dev

# migrate database
php artisan migrate:refresh

# seed database
php artisan db:seed

# postman unit tests
# su -lc /bin/bash -c 'source .bashrc && newman run --environment dev --color --delay-request 1000 --reporters cli,html --iteration-count 1 --timeout-request 2500 /var/www/tests/postman.json' laradock
