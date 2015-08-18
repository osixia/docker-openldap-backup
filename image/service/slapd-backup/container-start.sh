#!/bin/bash -e

FIRST_START_DONE="/etc/docker-openldap-backup-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then

  # adapt cronjobs file
  sed -i "s|{{ LDAP_BACKUP_CONFIG_CRON_EXP }}|${LDAP_BACKUP_CONFIG_CRON_EXP}|g" /container/service/slapd-backup/assets/cronjobs
  sed -i "s|{{ LDAP_BACKUP_DATA_CRON_EXP }}|${LDAP_BACKUP_DATA_CRON_EXP}|g" /container/service/slapd-backup/assets/cronjobs

  touch $FIRST_START_DONE
fi

exit 0
