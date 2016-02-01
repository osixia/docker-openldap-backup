# osixia/openldap-backup

[![Docker Pulls](https://img.shields.io/docker/pulls/osixia/openldap-backup.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/osixia/openldap-backup.svg)][hub]
[![Image Size](https://img.shields.io/imagelayers/image-size/osixia/openldap-backup/latest.svg)](https://imagelayers.io/?images=osixia/openldap-backup:latest)
[![Image Layers](https://img.shields.io/imagelayers/layers/osixia/openldap-backup/latest.svg)](https://imagelayers.io/?images=osixia/openldap-backup:latest)

[hub]: https://hub.docker.com/r/osixia/openldap-backup/

Latest release: 0.1.8 -  [Changelog](CHANGELOG.md) | [Docker Hub](https://hub.docker.com/r/osixia/openldap-backup/) 

An image to backup and restore OpenLDAP data and config.

- [Quick start](#quick-start)
  - [Backup directory and data persistence](#backup-directory-and-data-persistence)
  - [Debug](#debug)
- [Environment Variables](#environment-variables)
	- [Set your own environment variables](#set-your-own environment-variables)
		- [Use command line argument](#use-command-line-argument)
		- [Link environment file](#link-environment-file)
		- [Make your own image or extend this image](#make-your-own image-or-extend-this-image)
- [Advanced User Guide](#advanced-user-guide)
	- [Extend osixia/openldap-backup:0.1.8 image](#extend-osixiaopenldap-backup018-image)
	- [Make your own phpLDAPadmin image](#make-your-own-phpldapadmin-image)
	- [Tests](#tests)
	- [Kubernetes](#kubernetes)
	- [Under the hood: osixia/openldap](#under-the-hood-osixiaopenldap)
- [Changelog](#changelog)

## Quick start

    # Run OpenLDAP image
    docker run --name openldap:1.1.0 --detach osixia/openldap:1.1.0

    # Run OpenLDAP Backup image
    docker run --volumes-from openldap --detach osixia/openldap-backup:0.1.8

### Backup directory and data persistence

Backups are created in the directory `/data/backup` that has been declared as a volume, so your backup files are saved outside the container in a data volume.

For more information about docker data volume, please refer to :

> [https://docs.docker.com/userguide/dockervolumes/](https://docs.docker.com/userguide/dockervolumes/)

### Debug

The container default log level is **info**.
Available levels are: `none`, `error`, `warning`, `info`, `debug` and `trace`.

Example command to run the container in `debug` mode:

	docker run --detach osixia/openldap-backup:0.1.8 --loglevel debug

See all command line options:

	docker run osixia/openldap-backup:0.1.8 --help


## Environment Variables

Environment variables defaults are set in **image/environment/default.yaml**.

See how to [set your own environment variables](#set-your-own-environment-variables)

- **LDAP_BACKUP_CONFIG_CRON_EXP**: Cron expression to schedule OpenLDAP config backup. Defaults to `"0 4 * * *"`. Every days at 4am.

- **LDAP_BACKUP_DATA_CRON_EXP**: Cron expression to schedule OpenLDAP data backup. Defaults to `"0 4 * * *"`. Every days at 4am.

- **LDAP_BACKUP_TTL**: Backup TTL in days. Defaults to `15`.


### Set your own environment variables

#### Use command line argument
Environment variables can be set by adding the --env argument in the command line, for example:

    docker run --env LDAP_BACKUP_CONFIG_CRON_EXP="0 5 * * *" \
    --detach osixia/openldap-backup:0.1.8


#### Link environment file

For example if your environment file is in :  /data/ldap/environment/my-env.yaml

	docker run --volume /data/ldap/environment/my-env.yaml:/container/environment/01-custom/env.yaml \
	--detach osixia/openldap-backup:0.1.8

Take care to link your environment file to `/container/environment/XX-somedir` (with XX < 99 so they will be processed before default environment files) and not  directly to `/container/environment` because this directory contains predefined baseimage environment files to fix container environment (INITRD, LANG, LANGUAGE and LC_CTYPE).

#### Make your own image or extend this image

This is the best solution if you have a private registry. Please refer to the [Advanced User Guide](#advanced-user-guide) just below.

## Advanced User Guide

### Extend osixia/openldap-backup:0.1.8 image

If you need to add your custom environment files you can extends this image.

Dockerfile example:

	FROM osixia/openldap-backup:0.1.8
	MAINTAINER Your Name <your@name.com>

	ADD environment /container/environment/01-custom


### Make your own openldap-backup image

Clone this project:

	git clone https://github.com/osixia/docker-openldap-backup
	cd docker-openldap-backup

Adapt Makefile, set your image NAME and VERSION, for example:

	NAME = osixia/openldap-backup
	VERSION = 0.1.8

	become:
	NAME = cool-guy/openldap-backup
	VERSION = 0.1.0

Add environment files...

Build your image:

	make build

Run your image:

	docker run --detach cool-guy/openldap-backup:0.1.0

### Tests

We use **Bats** (Bash Automated Testing System) to test this image:

> [https://github.com/sstephenson/bats](https://github.com/sstephenson/bats)

Install Bats, and in this project directory run:

	make test

### Kubernetes

Kubernetes is an open source system for managing containerized applications across multiple hosts, providing basic mechanisms for deployment, maintenance, and scaling of applications.

More information:
- http://kubernetes.io
- https://github.com/kubernetes/kubernetes

osixia-openldap-backup kubernetes examples are available in [osixia/docker-openldap](https://github.com/osixia/docker-openldap/tree/stable/example/kubernetes/simple).

### Under the hood: osixia/openldap

This image is based on osixia/openldap.
More info: https://github.com/osixia/docker-openldap

## Changelog

Please refer to: [CHANGELOG.md](CHANGELOG.md)
