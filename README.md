# osixia/openldap-backup

[![](https://badge.imagelayers.io/osixia/openldap-backup:latest.svg)](https://imagelayers.io/?images=osixia/openldap-backup:latest 'Get your own badge on imagelayers.io')

An image to backup and restore OpenLDAP data and config.

## Quick start

    # Run OpenLDAP image
    docker run --name openldap -d osixia/openldap

    # Run OpenLDAP Backup image
    docker run --volumes-from openldap -d osixia/openldap-backup

#### Backup directory and data persitance

Backups are created in the directory `/data/backup` that has been declared as a volume, so your backup files are saved outside the container in a data volume.

For more information about docker data volume, please refer to :

> [https://docs.docker.com/userguide/dockervolumes/](https://docs.docker.com/userguide/dockervolumes/)

## Environment Variables

Environement variables defaults are set in **image/env.yaml**. You can modify environment variable values directly in this file and rebuild the image ([see manual build](#manual-build)). You can also override those values at run time with -e argument or by setting your own env.yaml file as a docker volume to `/container/environment/env.yaml`. See examples below.

- **LDAP_BACKUP_CONFIG_CRON_EXP**: Cron expression to schedule OpenLDAP config backup. Defaults to `"0 4 * * *"`. Every days at 4am.

- **LDAP_BACKUP_DATA_CRON_EXP**: Cron expression to schedule OpenLDAP data backup. Defaults to `"0 4 * * *"`. Every days at 4am.

- **LDAP_BACKUP_TTL**: Backup TTL in days. Defaults to `15`.

### Set environment variables at run time :

Environment variable can be set directly by adding the -e argument in the command line, for example :

	docker run -e LDAP_BACKUP_CONFIG_CRON_EXP="0 5 * * *" -d osixia/openldap-backup

Or by setting your own `env.yaml` file as a docker volume to `/container/environment/env.yaml`

	docker run -v /data/my-env.yaml:/container/environment/env.yaml \
	-d osixia/openldap-backup

## Manual build

Clone this project :

	git clone https://github.com/osixia/docker-openldap-backup
	cd docker-openldap-backup

Adapt Makefile, set your image NAME and VERSION, for example :

	NAME = osixia/openldap-backup
	VERSION = 0.1.0

	becomes :
	NAME = billy-the-king/openldap-backup
	VERSION = 0.1.0

Build your image :

	make build

Run your image :

	docker run -d billy-the-king/openldap-backup:0.1.0

## Tests

We use **Bats** (Bash Automated Testing System) to test this image:

> [https://github.com/sstephenson/bats](https://github.com/sstephenson/bats)

Install Bats, and in this project directory run :

	make test
