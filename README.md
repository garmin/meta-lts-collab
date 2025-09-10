

# meta-lts-collab

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

The `meta-lts-collab` layer is designed to help Yocto Project users maintain firmware built on end-of-life (EoL) versions of Yocto by sharing security fixes. As cybersecurity regulations evolve, the need for ongoing support of legacy Yocto-based products is expected to grow. This layer enables collaboration and sharing of security patches, fostering a stronger and more secure ecosystem for legacy products.

Initially, this layer aims to support recipes from oe-core and meta-oe. Other repositories may be added as needed using dynamic layers. The longevity of support for any particular Yocto version will depend on community interest and contributions; no strict guarantees are defined.

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
- Major/minor version upgrades only in exceptional cases when no alternative exists for applying a security fix

## 6. Continuous Integration (CI)

Ideally, CI will be used to:

- Ensure patched recipes build successfully
- Run cve-check to generate vulnerability reports (similar to Poky)

CI may be provided by users of the repository, not the Yocto Project Autobuilder.

## 7. Terms of Use / Disclaimer

This layer does **not** guarantee that firmware built with it is secure or CVE-free. It is intended for the community to share security fixes for older Yocto versions. Users are responsible for evaluating the security of their builds.

## 8. Adding the meta-lts-collab layer to your build

To add this layer to your build, run:

```shell
bitbake-layers add-layer meta-lts-collab
```
