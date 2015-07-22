FROM osixia/light-baseimage:0.1.0
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Use baseimage-docker's init system.
CMD ["/osixia/tool/run"]

# Install cron and OpenLDAP, needed for slapcat util ldap-utils
RUN apt-get -y update && /sbin/install-service-available cron \
	&& LC_ALL=C DEBIAN_FRONTEND=noninteractive apt-get install -y --force-yes --no-install-recommends \
	slapd \
	&& rm -rf /var/lib/ldap /etc/ldap/slapd.d

# Add service directory to /osixia/service
ADD service /osixia/service

# Use baseimage install-service script and clean all
RUN ./sbin/install-service && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add default env variables
ADD env.yaml /etc/env.yaml

# Set backup data in a data volume
VOLUME ["/data/backup"]
