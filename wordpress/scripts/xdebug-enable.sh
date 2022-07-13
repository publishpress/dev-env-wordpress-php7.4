#!/usr/bin/env bash

file_path="/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini"

new_content=$(cat "${file_path}" | sed 's/xdebug.mode=off/xdebug.mode=develop,debug/g')
echo "${new_content}" > $file_path

service apache2 reload
