

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

Primary Maintainer: Colin Pinnell McAllister <colin.mcallister@garmin.com>

Additional maintainers help review and merge changes; see
[`.github/CODEOWNERS`](.github/CODEOWNERS) for the current list. Support from experienced Yocto
Project contributors is welcome.

Contributions should follow the [Yocto Project Contributor Guide][yp-contrib].

### Patch file metadata

The subsections below supplement the [Yocto Project Contributor Guide][yp-contrib] with
meta-lts-collab-specific expectations for patch files added to the layer.

#### Signing off patches

In addition to signing off the commit that adds a new patch file, the author must add
their own `Signed-off-by:` line inside the patch file.

This applies even when the patch was sourced from a newer Yocto version and already carries
a `Signed-off-by:` line from its original author. Adding the patch file to meta-lts-collab is
itself a contribution, so whoever imports it must sign it off to satisfy the
[Developer Certificate of Origin](https://developercertificate.org/).

#### `Origin:` tag

The `Origin:` tag records where the patch was sourced from, and is required whenever
the patch was not taken directly from the upstream project's own fix commit. For example,
this applies when the patch was sourced from a downstream distribution such as Debian, Ubuntu,
or Red Hat.

This also applies to patches taken from another Yocto layer (e.g., oe-core or
meta-openembedded) whose `Upstream-Status:` does not reflect where the patch itself came
from. In that case, use the URL of the patch file in the upstream Yocto layer as the
`Origin:`.

`Origin:` is complementary to `Upstream-Status:`:
* `Upstream-Status:` describes the patch's relationship to the upstream project.
  * i.e., at what point can this patch be removed?
* `Origin:` points to the specific source the patch was copied from.
  * i.e., where did this patch come from?

Example:

```
Upstream-Status: Backport [https://upstream.example.org/commit/abc123]
Origin: https://salsa.debian.org/debian/foo/-/raw/debian/main/debian/patches/CVE-YYYY-NNNNN.patch
```

Maintainers will reject patches whose content significantly diverges from the referenced
`Origin:` or `Upstream-Status:` source. Trivial adjustments (context offsets, path renames,
whitespace) are expected and fine.

See the [DEP-3](https://dep-team.pages.debian.net/deps/dep3/) standard for more details.

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
    $ cd meta-lts-collab-build
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
    $ bitbake-layers add-layer ./meta-openembedded/meta-*
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

    - To build all packages of this layer, meta-lts-collab/scripts/get-bitbake-targets.py can be used

    ```
    echo "CORE_IMAGE_EXTRA_INSTALL = \"$(./meta-lts-collab/scripts/get-bitbake-targets.py --image)\"" >> build/conf/local.conf
    ```

6. Build and run test image

    ```
    # Builds the image
    $ bitbake core-image-minimal

    # Run ptest tests
    $ bitbake -c testimage core-image-minimal
    ```

## 7. Continuous Integration (CI)

Every trigger runs the same gated pipeline: **lint** (`ruff`, `yamllint`, `oelint-adv`) →
**yocto-check-layer** → **`core-image-minimal` build** on `qemux86-64`, matrixed over sysvinit
and systemd.

Trigger-specific behavior:
- **Pull requests** (`kirkstone`): build only the recipes directly affected by the PR and run
  `do_testimage` (ptests) on the resulting image.
- **Push** (`kirkstone`): build every recipe added or modified by the layer, then run
  `cve-check` against `universe` for both `dunfell` and `kirkstone` and publish the CVE
  summaries to GitHub Pages.
- **Nightly** (3:00 UTC): same as push, but also run `do_testimage` to run ptests for every
  recipe added or modified by the layer, along with PTESTS_FAST.
- **Weekly** (Sundays 03:00 UTC): same as push, but refresh the downloads and sstate cache
  from scratch and also run `do_testimage` to run ptests for every recipe added or modified
  by the layer along with PTESTS_SLOW.

Dependent-recipe breakage (e.g. a meta-core or meta-oe recipe that consumes a modified recipe) is
not detected — catching it would require a full `bitbake world`, which may be revisited if cache
sizes grow.

See [`.github/workflows`](.github/workflows) for full CI configuration.

## 8. Terms of Use / Disclaimer

This layer does **not** guarantee that firmware built with it is secure or CVE-free. It
is intended for the community to share security fixes for older Yocto versions. Users are
responsible for evaluating the security of their builds.

## 9. Adding the meta-lts-collab layer to your build

To add this layer to your build, run:

```shell
bitbake-layers add-layer meta-lts-collab
```

[yp-contrib]: https://docs.yoctoproject.org/contributor-guide/index.html
