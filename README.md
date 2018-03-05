# osixia/openldap-backup

[![Docker Pulls](https://img.shields.io/docker/pulls/osixia/openldap-backup.svg)][hub]
[![Docker Stars](https://img.shields.io/docker/stars/osixia/openldap-backup.svg)][hub]
[![](https://images.microbadger.com/badges/image/osixia/openldap-backup.svg)](http://microbadger.com/images/osixia/openldap-backup "Get your own image badge on microbadger.com")

[hub]: https://hub.docker.com/r/osixia/openldap-backup/

Latest release: 1.2.0 -  [Changelog](CHANGELOG.md) | [Docker Hub](https://hub.docker.com/r/osixia/openldap-backup/) 

**A docker image to run OpenLDAP, and make periodic backups.**

- [Contributing](#contributing)
- [Quick start](#quick-start)
  - [Backup directory and data persistence](#backup-directory-and-data-persistence)
  - [Debug](#debug)
- [Environment Variables](#environment-variables)
	- [Set your own environment variables](#set-your-own environment-variables)
		- [Use command line argument](#use-command-line-argument)
		- [Link environment file](#link-environment-file)
		- [Make your own image or extend this image](#make-your-own image-or-extend-this-image)
- [Advanced User Guide](#advanced-user-guide)
	- [Extend osixia/openldap-backup:1.2.0 image](#extend-osixiaopenldap-backup120-image)
	- [Make your own phpLDAPadmin image](#make-your-own-phpldapadmin-image)
	- [Tests](#tests)
	- [Kubernetes](#kubernetes)
	- [Under the hood: osixia/openldap](#under-the-hood-osixiaopenldap)
- [Security](#security)
- [Changelog](#changelog)

## Contributing

If you find this image useful here's how you can help:

- Send a pull request with your kickass new features and bug fixes
- Help new users with [issues](https://github.com/osixia/docker-openldap-backup/issues) they may encounter
- Support the development of this image and star this repo !

## Quick start

This image is based on osixia/openldap please refer to:
[https://github.com/osixia/docker-openldap](https://github.com/osixia/docker-openldap) 

Here just the backup extension will be described.

### Backup directory and data persistence

Backups are created in the directory `/data/backup` that should be mapped has volume so your ldap files are saved outside the container.

      docker run --env LDAP_BACKUP_CONFIG_CRON_EXP="0 5 * * *" \
      --volume /data/openldap/backup:/data/backup \
      --detach osixia/openldap-backup:1.2.0


For more information about docker data volume, please refer to :

> [https://docs.docker.com/userguide/dockervolumes/](https://docs.docker.com/userguide/dockervolumes/)

### Debug

The container default log level is **info**.
Available levels are: `none`, `error`, `warning`, `info`, `debug` and `trace`.

Example command to run the container in `debug` mode:

	docker run --detach osixia/openldap-backup:1.2.0 --loglevel debug

See all command line options:

	docker run osixia/openldap-backup:1.2.0 --help


## Environment Variables

Environment variables defaults are set in **image/environment/default.yaml**.

See how to [set your own environment variables](#set-your-own-environment-variables)

- **LDAP_BACKUP_CONFIG_CRON_EXP**: Cron expression to schedule OpenLDAP config backup. Defaults to `0 4 * * *`. Every days at 4am.

- **LDAP_BACKUP_DATA_CRON_EXP**: Cron expression to schedule OpenLDAP data backup. Defaults to `0 4 * * *`. Every days at 4am.

- **LDAP_BACKUP_TTL**: Backup TTL in days. Defaults to `15`.


### Set your own environment variables

#### Use command line argument
Environment variables can be set by adding the --env argument in the command line, for example:

    docker run --env LDAP_BACKUP_CONFIG_CRON_EXP="0 5 * * *" \
    --detach osixia/openldap-backup:1.2.0


#### Link environment file

For example if your environment file is in :  /data/ldap/environment/my-env.yaml

	docker run --volume /data/ldap/environment/my-env.yaml:/container/environment/01-custom/env.yaml \
	--detach osixia/openldap-backup:1.2.0

Take care to link your environment file to `/container/environment/XX-somedir` (with XX < 99 so they will be processed before default environment files) and not  directly to `/container/environment` because this directory contains predefined baseimage environment files to fix container environment (INITRD, LANG, LANGUAGE and LC_CTYPE).

#### Make your own image or extend this image

This is the best solution if you have a private registry. Please refer to the [Advanced User Guide](#advanced-user-guide) just below.

## Advanced User Guide

### Extend osixia/openldap-backup:1.2.0 image

If you need to add your custom environment files you can extends this image.

Dockerfile example:

	FROM osixia/openldap-backup:1.2.0
	MAINTAINER Your Name <your@name.com>

	ADD environment /container/environment/01-custom


### Make your own openldap-backup image

Clone this project:

	git clone https://github.com/osixia/docker-openldap-backup
	cd docker-openldap-backup

Adapt Makefile, set your image NAME and VERSION, for example:

	NAME = osixia/openldap-backup
	VERSION = 1.1.9

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

## Security
If you discover a security vulnerability within this docker image, please send an email to the Osixia! team at security@osixia.net. For minor vulnerabilities feel free to add an issue here on github.

Please include as many details as possible.

## Changelog

Please refer to: [CHANGELOG.md](CHANGELOG.md)
