FROM osixia/openldap:1.1.1
MAINTAINER Bertrand Gouny <bertrand.gouny@osixia.net>

# Install cron from baseimage and remove .cfss and slapd services inherited from openldap image
# remove also previous default environment files, they are not needed.
# sources: https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/add-service-available
#          https://github.com/osixia/docker-light-baseimage/blob/stable/image/service-available/:cron/download.sh
RUN apt-get -y update \
		&& /container/tool/add-service-available :cron \
		&& rm -rf /container/service/:cfssl \
		&& rm -rf /container/service/slapd \
		&& rm -rf /container/environment/99-default \
		&& apt-get clean \
		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Add service directory to /container/service
ADD service /container/service

# Use baseimage install-service script
# https://github.com/osixia/docker-light-baseimage/blob/stable/image/tool/install-service
RUN /container/tool/install-service

# Add default env variables
ADD environment /container/environment/99-default

# Set backup data in a data volume
VOLUME ["/data/backup"]
