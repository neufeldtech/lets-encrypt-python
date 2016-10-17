#!/bin/sh
echo "$(date) Helloo from cron.sh!" >> /var/log/cron.log
cd /opt/le
bash letsencrypt.sh --cron -f config/config.sh >> /var/log/cron.log 2>&1