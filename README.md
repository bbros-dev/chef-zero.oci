# Open Container Initiative Container: Chef-Zero

This container is a base for building OCI images configured with
Policyfiles using Chef-Zero.

A Chef-Zero OCI image is built using [busybox](https://busybox.net/) and
[Podman](https://podman.io/):

```bash
./scripts/build/oci/<oci_name>/build.sh
```

To push the built image (see the OCI repository note below):

```bash
PUSH=y ./scripts/build/oci/<oci_name>/build.sh
```

## Pushing to the yelgeb OCI Repository

We welcome PR's to make this configurable. Right now its usable only by
Begley Brothers Inc. users.

Ensure you have [busybox](https://busybox.net/) and
[Podman](https://podman.io/) installed in your `PATH`.

If you wish to push the OCI image to the yelgeb repository, ensure you have an
authorization file:

```bash
$ cat ~/.config/containers/begleybrothers-auth.json
{
  "auths": {
    "docker.io": {
      "auth": "...."
    }
  }
}
```

## Chef-Zero OCI Usage

1. Place your Chef cookbooks in `./cookbooks`.
2. Place your Policyfiles in `./policyfiles`.
3. Add the following to `./Dockerfile`:

```bash
FROM yelgeb/chef-zero-4.8:2.1.1

ENV POLICY_NAME=yours

## Install as defined in policyfiles/${POLICY_NAME}.rb
#
COPY cookbooks /opt/chef-repo/cookbooks
COPY policyfiles /opt/chef-repo/policyfiles

RUN zero.sh \
    && uninstall-chef.sh \
    && rm -rf /usr/local/bin/zero.sh \
    && rm -rf /usr/local/bin/uninstall-chef.sh \
    && apt-cleanup.sh
```

## Contributions

Pull requests are welcome.
The code base is not large and we can think of the following improvements
the wider Chef community might benefit from:

- Pushing to configurable OCI registry and organization.
- Images based on to different Linux distributions: Ubuntu 16.04, RHEL/CENTOS, etc.
- Images containing different Chef versions.
- Refactoring scripts to be more modular.
- Script test suite.

For more detail, please see [CONTRIBUTNG](./CONTRIBUTING).
