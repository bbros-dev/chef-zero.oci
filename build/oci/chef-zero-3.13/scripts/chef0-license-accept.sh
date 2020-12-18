#!/usr/bin/env bash
#
# Accept Chef license: output chef environment as a side effect, so we 
# redirect this to syslog.
# See journalctl -f
exec &> >(tee /dev/stderr "/chef-license-accept.log" | logger -t chef-license-accept)
chef env --chef-license accept
