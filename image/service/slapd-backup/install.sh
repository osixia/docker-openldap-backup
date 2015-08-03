#!/bin/bash -e
# this script is run during the image build

# install image tools
ln -s /container/service/slapd-backup/assets/tool/* /sbin/

# add cron jobs
ln -s /container/service/slapd-backup/assets/cronjobs /etc/cron.d/slapd-backup
chmod 600 /container/service/slapd-backup/assets/cronjobs
