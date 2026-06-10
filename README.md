

# meta-lts-collab

[![OpenSSF Best Practices](https://www.bestpractices.dev/projects/13092/badge)](https://www.bestpractices.dev/projects/13092)

## Table of Contents

1. [Purpose and Scope](#1-purpose-and-scope)
2. [Dependencies](#2-dependencies)
3. [Maintainer and Contributions](#3-maintainer-and-contributions)
4. [Patch Submission & Review](#4-patch-submission--review)
5. [Layer Rules](#5-layer-rules)
6. [Continuous Integration](#6-continuous-integration-ci)
7. [Terms of Use / Disclaimer](#7-terms-of-use--disclaimer)
8. [Adding the meta-lts-collab layer to your build](#8-adding-the-meta-lts-collab-layer-to-your-build)

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
  git format-patch --subject-prefix="meta-lts-collab][dunfell][PATCH" ...
  ```

## 5. Layer Rules

- Primary goal: Maintain security patches for recipes from end-of-life upstream layers
- Patch-level updates with security fixes may be provided
- Major/minor version upgrades only in exceptional cases when no alternative exists for applying a
  security fix

## 6. Continuous Integration (CI)

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

## 7. Terms of Use / Disclaimer

This layer does **not** guarantee that firmware built with it is secure or CVE-free. It
is intended for the community to share security fixes for older Yocto versions. Users are
responsible for evaluating the security of their builds.

## 8. Adding the meta-lts-collab layer to your build

To add this layer to your build, run:

```shell
bitbake-layers add-layer meta-lts-collab
```
