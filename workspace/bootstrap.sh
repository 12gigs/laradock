#!/usr/bin/env bash

# change to working directory
cd /var/www

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
