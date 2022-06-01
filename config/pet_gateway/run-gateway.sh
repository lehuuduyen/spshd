#!/bin/bash

# Make sure we're not confused by old, incompletely-shutdown httpd
# context after restarting the container.  httpd won't start correctly
# if it thinks it is already running.
rm -rf /run/httpd/* /tmp/httpd*

/usr/sbin/httpd &>/dev/null &

# /etc/init.d/httpd start
cd /src/pet_gateway && npm run dev &>/dev/null