#!/bin/sh
set -e  # Exit if error

# Run execute supervisord command
exec /usr/bin/supervisord -c /etc/supervisord.conf