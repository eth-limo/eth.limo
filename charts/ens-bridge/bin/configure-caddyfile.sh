#!/bin/sh

apk add gettext

ls -alt /etc/caddy/

envsubst </etc/caddy-old/Caddyfile.json > /etc/caddy/Caddyfile.json
chmod 544 /etc/caddy/Caddyfile.json

#mkdir -p /var/www/public_html
#chown -R 10001:10001 /var/www/public_html
#chmod -R 555 /var/www/public_html