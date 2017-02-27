#!/usr/bin/env bash

exit 0 ;

echo "Waiting for mysql"

sleep 5 ;


#while ! nc -w 1 -z 172.51.51.2  3306; do sleep 0.1; done


echo -e "\nmysql ready"

exit 0 ;


