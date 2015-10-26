FROM osixia/openldap:1.0.3
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Use baseimage's init system.
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/run
CMD ["/container/tool/run"]

# Install baseimage cron service
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service-available

# Use baseimage remove-service tool to remove slapd service
# including process and container start files
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/remove-service
RUN apt-get -y update \
		&& /container/tool/install-service-available cron \
		&& /container/tool/remove-service slapd

# Add service directory to /container/service
ADD service /container/service

# Use baseimage install-service script and clean all
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service
RUN /container/tool/install-service \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add default env variables
ADD env.yaml /container/environment/env.yaml

# Set backup data in a data volume
VOLUME ["/data/backup"]
