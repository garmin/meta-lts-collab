

# meta-lts-collab

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13092/badge)](https://www.bestpractices.dev/projects/13092)

## Table of Contents

1. [Purpose and Scope](#1-purpose-and-scope)
2. [Dependencies](#2-dependencies)
3. [Maintainer and Contributions](#3-maintainer-and-contributions)
4. [Patch Submission & Review](#4-patch-submission--review)
5. [Layer Rules](#5-layer-rules)
6. [Validating Changes](#6-validating-changes)
7. [Continuous Integration](#7-continuous-integration-ci)
8. [Terms of Use / Disclaimer](#8-terms-of-use--disclaimer)
9. [Adding the meta-lts-collab layer to your build](#9-adding-the-meta-lts-collab-layer-to-your-build)

## 1. Purpose and Scope

The `meta-lts-collab` layer is designed to help Yocto Project users maintain firmware built
on end-of-life (EoL) versions of Yocto by sharing security fixes. As cybersecurity regulations
evolve, the need for ongoing support of legacy Yocto-based products is expected to grow. This
layer enables collaboration and sharing of security patches, fostering a stronger and more
secure ecosystem for legacy products.

Initially, this layer aims to support recipes from oe-core and meta-oe. Other repositories
may be added as needed using dynamic layers. The longevity of support for any particular Yocto
version will depend on community interest and contributions; no strict guarantees are defined.

## 2. Dependencies

This layer is intended to be used alongside:

- oe-core (Poky)
- meta-openembedded

Other repositories may be added as needed using dynamic layers.

## 3. Maintainer and Contributions

Initial Maintainer: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Support from experienced Yocto Project contributors is welcome, especially in the early stages.

Contributions should follow the Yocto Project and OpenEmbedded Contributor Guide.

## 4. Patch Submission & Review

Patches should be submitted for review via:

- Pull Request in the [upstream repository](https://github.com/garmin/meta-lts-collab)
- The yocto-patches@lists.yoctoproject.org mailing list
  (prefix subject with `[meta-lts-collab]` and `[<Yocto version branch>]`)
  ```
  git format-patch --subject-prefix="meta-lts-collab][kirkstone][PATCH" ...
  ```

## 5. Layer Rules

- Primary goal: Maintain security patches for recipes from end-of-life upstream layers
- Patch-level updates with security fixes may be provided
- Major/minor version upgrades only in exceptional cases when no alternative exists for applying a
  security fix

## 6. Validating Changes

All pull requests are validated with both linting and test builds. The following section describes
how to validate your changes locally before submission.

### Linting

The following linting tools should be used:

- oelint-adv
  - Lints Bitbake files
- ruff
  - Formats and lints Python files
- yamllint
  - Checks formatting of YAML files

These tools are listed in and can be installed with the requirements-dev.txt file. The locked
versions in the file are the versions used by CI.

```bash
# Set up a virtual environment
$ python3 -m venv .venv

# Activate the virtual environment
$ source .venv/bin/activate

# Install development requirements
$ python3 -m pip install -r requirements-dev.txt

# Run tools
$ oelint-adv $(find -name '*.bb' -o -name '*.bbappend' -o -name '*.conf')
$ ruff format .
$ ruff check .
$ yamllint .
```

### Building and Runtime Testing

For layer validation, a core-image-minimal image is built that contains all modified recipes. The
validation can be performed locally by following the steps below:

1. Create build directory

    ```
    $ mkdir meta-lts-collab-build
    $ cd meta-lts-collab build
    ```

2. Clone down all layers

    ```
    $ git clone https://git.yoctoproject.org/poky -b kirkstone
    $ git clone https://git.openembedded.org/meta-openembedded -b kirkstone
    $ git clone git@github.com:garmin/meta-lts-collab.git -b kirkstone
    ```

3. Set up bitbake

    ```
    $ source poky/oe-init-build-env
    $ bitbake-layers add-layer ./meta-oe/meta-*
    $ bitbake-layers add-layer ./meta-lts-collab
    ```

4. Add configurations to local.conf

    ```
    $ echo "require $(realpath ./meta-lts-collab/conf/ci.conf)" >> "./build/conf/local.conf"
    ```

5. Add packages to build and test
    - Open local.conf and add packages you'd like to include in the image and test

    ```
    CORE_IMAGE_EXTRA_INSTALL = "openssl"
    ```

6. Build and run test image

    ```
    # Builds the image
    $ bitbake core-image-minimal

    # Run ptest tests
    $ bitbake -c testimage core-image-minimal
    ```

## 7. Continuous Integration (CI)

### Weekly build

A `core-image-minimal` image is built on Sundays at 03:00 UTC with a clean download and shared
state directory. Every package added or modified by the layer is included in the image via
`IMAGE_INSTALL`. After the image is built, `do_testimage` is executed, which runs ptests for
all packages in the image. This job ensures that the layer is always in a buildable state and
rebuilds the download and shared state cache from scratch.

### Pull requests

Every PR that adds or modifies one or more recipes will trigger a `core-image-minimal` image
build with the modified recipes added via `IMAGE_INSTALL`. Only the default poky machine
(`qemux86-64`) is tested. After the image is built, `do_testimage` runs ptests for all packages
included in the image. This provides comprehensive feedback on whether the PR works correctly.

Modifying any configuration or bbclass files included in the layer will trigger all recipes
affected by the layer to be added to the image. This is because it's hard to determine which
recipes are modified by bbclass or configuration file modifications.

There is a small risk that a recipe dependent on a modified recipe breaks because of a change.
This would not be detected by CI. However, any recipe provided by meta-core or meta-oe could
break in this way and the only way to catch these build errors is to build everything (e.g.,
`bitbake world`). For this reason, CI is configured to just build the recipes directly modified
by a change. However, building all recipes may be explored in the future if cache sizes are
increased.

### Push events

All recipes modified or added by the layer are built after changes are merged into a branch. This
job matches the weekly build above, however the sstate and download cache is used. The sstate
and cache after the build is also saved as the new cache. This allows the cache to follow the
tip of the branch, keeping PR builds fast. The sstate cache will likely grow over the week,
but the clean weekly build is intended to truncate the cache.

For specific CI configuration details, see the [`.github/workflows`](.github/workflows) directory.

## 8. Terms of Use / Disclaimer

This layer does **not** guarantee that firmware built with it is secure or CVE-free. It
is intended for the community to share security fixes for older Yocto versions. Users are
responsible for evaluating the security of their builds.

## 9. Adding the meta-lts-collab layer to your build

To add this layer to your build, run:

```shell
bitbake-layers add-layer meta-lts-collab
```
