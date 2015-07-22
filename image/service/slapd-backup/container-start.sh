#!/bin/bash -e

FIRST_START_DONE="/etc/docker-openldap-backup-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then

  # Adapt cronjobs file
  sed -i "s|{{ CRON_EXP_BACKUP_CONFIG }}|${CRON_EXP_BACKUP_CONFIG}|g" /osixia/service/slapd-backup/assets/cronjobs
  sed -i "s|{{ CRON_EXP_BACKUP_DATA }}|${CRON_EXP_BACKUP_DATA}|g" /osixia/service/slapd-backup/assets/cronjobs

  touch $FIRST_START_DONE
fi

exit 0
