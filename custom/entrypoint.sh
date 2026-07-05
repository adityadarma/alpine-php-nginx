#!/bin/sh
set -e  # Exit if error

# Set opcache JIT buffer size based on CPU architecture
# AArch64 (ARM64) has a hard limit of 128M; use 64M to avoid PHP warning
ARCH=$(uname -m)
if [ "$ARCH" = "aarch64" ] || [ "$ARCH" = "arm64" ]; then
    export JIT_BUFFER_SIZE=64M
else
    export JIT_BUFFER_SIZE=128M
fi

# Process php.ini template
envsubst '${JIT_BUFFER_SIZE}' < /etc/php-ini.template > /etc/php${PHP_NUMBER}/conf.d/custom.ini

# Change file supervisord
envsubst < /etc/supervisord.conf.template > /etc/supervisord.conf
envsubst '${MAX_TIMEOUT} ${MAX_BODY_SIZE} ${APP_ROOT}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Run execute supervisord command
exec /usr/bin/supervisord -c /etc/supervisord.conf