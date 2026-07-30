# Build BinDiff For IDA 9

English | [简体中文](README.zh.md)

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/Lil-Ran/build-bindiff-for-ida-9/total)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub Repo stars](https://img.shields.io/github/stars/Lil-Ran/build-bindiff-for-ida-9?style=flat)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/stargazers)
[![GitHub Release](https://img.shields.io/github/v/release/Lil-Ran/build-bindiff-for-ida-9)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/Lil-Ran/build-bindiff-for-ida-9/latest)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/commits/main/)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/Lil-Ran/build-bindiff-for-ida-9/build.yml?branch=main&label=ci)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions)

This is an unofficial repository, just for **ensuring successful builds** and **retaining historical artifacts**. The original source code is available at Google's [BinDiff](https://github.com/google/bindiff) and [BinExport](https://github.com/google/binexport) repositories.

The original projects have started to support IDA 9.4 and above. However, this repository contains some necessary patches. See details in [patches/README.md](./patches/README.md).

Build logs and artifacts can be found in the [Actions tab](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions/workflows/build.yml).

## Installation

To install the IDA plugin, download and extract the release archive, then copy the dynamic library file (`.dll`, `.so`, or `.dylib`) from the `ida` folder to the `plugins` directory of your IDA installation.

## Compatibility

### IDA Versions

The [latest release](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases) builds for IDA `9.4` and `9.3sp1`.

The last release that supports IDA `9.3`, `9.2`, `9.1`, and `9.0` is [release-20260716-1](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases/tag/release-20260716-1).

The IDA version here refers to the IDA SDK version used for building. These artifacts can also work with other IDA versions that share the same ABI.

### OS

We build on these [GitHub-hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners):

- windows-2025
- windows-11-arm
- ubuntu-22.04
- ubuntu-22.04-arm
- ubuntu-26.04
- ubuntu-26.04-arm
- macos-26

Ubuntu builds are compatible with most Linux distributions as long as they use the same or newer version of glibc (and other system libraries).

macOS builds are universal binaries for both Apple silicon and Intel.

## Custom Build

If you want to build on your own, you can fork this repository. You can modify `.github/workflows/build.yml` if needed.

GitHub Actions is free for public repositories. To reduce build time, remove unnecessary operating systems and IDA versions from `matrix.os` and `matrix.idasdk`.

In forked repositories, Actions is disabled by default. You can enable it in the repository settings under the "Actions" tab.

## See Also

- Hex-Rays builds and publishes to Hex-Rays Plugin Manager. You can install their artifacts with [`hcli`](https://hcli.docs.hex-rays.com/):

  ```bash
  hcli plugin install bindiff
  hcli plugin install binexport
  ```

  Repository: https://github.com/HexRaysSA/bindiff/tree/ci-gha

  Details: https://github.com/google/bindiff/pull/85

- After a new IDA version is released, open-source contributors may provide updated artifacts earlier in their forks. You can check commits newer than this repository here: https://github.com/Lil-Ran/build-bindiff-for-ida-9/network
