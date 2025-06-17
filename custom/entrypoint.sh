#!/bin/sh
set -e  # Exit if error

# Change file supervisord
envsubst < /etc/supervisord.conf.template > /etc/supervisord.conf
envsubst '${MAX_TIMEOUT} ${MAX_BODY_SIZE}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Run execute supervisord command
exec /usr/bin/supervisord -c /etc/supervisord.conf