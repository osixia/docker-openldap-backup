#!/bin/bash -e
# this script is run during the image build

# Install image tools
ln -s /container/service/slapd-backup/assets/tool/* /sbin/
