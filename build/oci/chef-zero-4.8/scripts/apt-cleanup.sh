#!/usr/bin/env bash
# 
# Used by Begley Brothers Inc. container build scripts in Dockerfiles.
# Modifications are transitory.
# 

apt-get clean || true
apt-get autoclean || true
rm -rf /var/cache/apt/archives/*
rm -rf /var/lib/apt/lists/*
rm -rf /tmp/*
rm -rf /var/tmp/*
truncate -s 0 /var/log/*log || true
