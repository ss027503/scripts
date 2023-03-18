#!/bin/bash

sudo apt update -y
sudo apt install redis-tools stunnel4 -y

# create the tunnel config file
sudo cat <<EOT >> /etc/stunnel/redis-test.conf
fips = no
setuid = root
setgid = root
pid = /var/run/stunnel.pid
debug = 7
delay = yes
options = NO_SSLv3
[redis-cli]
    client = yes
    accept = 127.0.0.1:6379
    connect = REDIS_ENDPOINT_HERE.amazonaws.com:6379
EOT

# run stunnel with the config file
sudo stunnel /etc/stunnel/redis-test.conf

sudo netstat -tulnp | grep -i stunnel
# should show a tunnel listening

# connect to LOCALHOST to use the tunnel
redis-cli -h localhost -p 6379 -a AUTH_KEY_HERE