FROM osixia/openldap:1.0.0
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Use baseimage-docker's init system.
CMD ["/osixia/tool/run"]

# Use baseimage remove-service tool to remove slapd service
# including process and container start files
RUN apt-get -y update && /sbin/add-service-available cron && /sbin/remove-service slapd

# Add service directory to /osixia/service
ADD service /osixia/service

# Use baseimage install-service script and clean all
RUN ./sbin/install-service && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add default env variables
ADD env.yaml /etc/env.yaml

# Set backup data in a data volume
VOLUME ["/data/backup"]
