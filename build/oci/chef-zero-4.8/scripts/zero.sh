#!/usr/bin/env bash
# 
# Used by Begley Brothers Inc. container build scripts in Dockerfiles.
# Modifications are transitory.
# 

# This script sets up and executes the Chef-Zero coobook profile on the machine
# it is run on.
# The script is usually RUN in a Dockerfile.  For example:
# 
# ```bash
# RUN zero.sh \
#     && uninstall-chef.sh \
#     && rm -rf /usr/local/bin/zero.sh \
#     && rm -rf /usr/local/bin/uninstall-chef.sh \
#     && apt-cleanup.sh
# ```
source /etc/profile.d/chefdk.sh

pushd ${CHEF_CONFIG_PATH}
  mkdir -p backup cache checksums cookbooks data_bags environments nodes policy_groups/local/policies/${POLICY_NAME} roles /var/chef
  touch template.erb
  find /opt/chefdk/embedded/bin/ruby -type f -name chef-full.erb -exec cat {} \; > template.erb
  /opt/chefdk/embedded/bin/erb /var/chef/solo.json.erb > /var/chef/solo.json
  /opt/chefdk/bin/chef install --config /etc/chef/client.rb ./policyfiles/${POLICY_NAME}.rb
  /opt/chefdk/bin/chef export --force ./policyfiles/${POLICY_NAME}.rb ./policy_groups/local/policies/${POLICY_NAME}
  pushd ./policy_groups/local/policies/${POLICY_NAME}
    /opt/chefdk/bin/chef-client --local-mode
  popd
popd

apt-get clean

rm -rf /var/cache/*
rm -rf /var/log/*
rm -rf /tmp/*

# Remove the following and apt purge does not kow what to remove.
#
#rm -rf /var/lib/apt/lists/*
#rm -rf /var/lib/dpkg/info/*
