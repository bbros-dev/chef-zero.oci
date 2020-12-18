#!/usr/bin/env bash
# 
# Used by Begley Brothers Inc. container build scripts in Dockerfiles.
# Modifications are transitory.
# 

## NOTE:
# Variables defined in the Dockerfile:
#
# * ${CHEFDK_PACKAGE}
# * ${CHEFDK_URL}
#
apt update
apt install --yes build-essential curl unzip
apt list --upgradable
apt upgrade --yes

## Ensure consistent busybox across the Chef0-<name>-<num> containers.
#
curl --output /usr/sbin/busybox https://busybox.net/downloads/binaries/1.27.1-i686/busybox
chmod a+x /usr/sbin/busybox

busybox wget --output-document ${CHEFDK_PACKAGE} ${CHEFDK_URL}${CHEFDK_PACKAGE}

echo "${CHEFDK_SHA256}  ${CHEFDK_PACKAGE}" | busybox sha256sum -c

dpkg -i ${CHEFDK_PACKAGE}

chef0-license-accept.sh

source /etc/profile.d/chefdk.sh

chef exec gem install 'inspec'

apt purge --yes --auto-remove build-essential curl

rm -rf ${CHEFDK_PACKAGE}
