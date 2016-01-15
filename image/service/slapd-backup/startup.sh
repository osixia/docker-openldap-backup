#!/bin/bash -e

# set -x (bash debug) if log level is trace
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/log-helper
log-helper level eq trace && set -x


FIRST_START_DONE="${CONTAINER_STATE_DIR}/docker-openldap-backup-first-start-done"

# container first start
if [ ! -e "$FIRST_START_DONE" ]; then

  # install image tools
  ln -s ${CONTAINER_SERVICE_DIR}/slapd-backup/assets/tool/* /sbin/

  # add cron jobs
  ln -s ${CONTAINER_SERVICE_DIR}/slapd-backup/assets/cronjobs /etc/cron.d/slapd-backup
  chmod 600 ${CONTAINER_SERVICE_DIR}/slapd-backup/assets/cronjobs

  # adapt cronjobs file
  sed -i "s|{{ LDAP_BACKUP_CONFIG_CRON_EXP }}|${LDAP_BACKUP_CONFIG_CRON_EXP}|g" ${CONTAINER_SERVICE_DIR}/slapd-backup/assets/cronjobs
  sed -i "s|{{ LDAP_BACKUP_DATA_CRON_EXP }}|${LDAP_BACKUP_DATA_CRON_EXP}|g" ${CONTAINER_SERVICE_DIR}/slapd-backup/assets/cronjobs

  touch $FIRST_START_DONE
fi

exit 0
