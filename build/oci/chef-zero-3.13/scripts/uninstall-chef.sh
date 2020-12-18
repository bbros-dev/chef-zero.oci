#!/usr/bin/env bash
# 
# Used by Begley Brothers Inc. container build scripts in Dockerfiles.
# Modifications are transitory.
# 

chef exec gem uninstall --all --force --ignore-dependencies --executables 'inspec'
chef exec gem uninstall --all --force --ignore-dependencies --executables 'kitchen-inspec'
chef exec gem uninstall --all --force --ignore-dependencies --executables 'kitchen-dokken'
chef exec gem uninstall --all --force --ignore-dependencies --executables 'test-kitchen'

sudo apt --purge --yes auto-remove chefdk

rm -rf /etc/chef
rm -rf /opt/chefdk
rm -rf /root/.chefdk
rm -rf ${CHEF_CONFIG_PATH}
rm -rf /etc/profile.d/chefdk.sh
rm -rf /var/chef

# Cleanup any Begley Brothers install scripts
rm -rf /usr/local/bin/install-chef0-*.sh
