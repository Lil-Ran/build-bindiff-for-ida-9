# Build BinDiff For IDA 9

English | [简体中文](README.zh.md)

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/Lil-Ran/build-bindiff-for-ida-9/total)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub Repo stars](https://img.shields.io/github/stars/Lil-Ran/build-bindiff-for-ida-9?style=flat)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/stargazers)
[![GitHub Release](https://img.shields.io/github/v/release/Lil-Ran/build-bindiff-for-ida-9)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/Lil-Ran/build-bindiff-for-ida-9/latest)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/commits/main/)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/Lil-Ran/build-bindiff-for-ida-9/build.yml?branch=main&label=ci)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions)

This is an unofficial repository, just for convenience. The original source code is available at [Google's BinDiff repository](https://github.com/google/bindiff).

Build logs and artifacts can be found in the [Actions tab](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions).

## Installation

To install the IDA plugin, download and extract the release archive, then copy the dynamic library file (`.dll`, `.so`, or `.dylib`) from the `ida` folder to the `plugins` directory of your IDA installation.

## Compatibility

### IDA Versions

Current status: builds are available for IDA 9.3, 9.2, 9.1, and 9.0.

The IDA version here refers to the IDA SDK version used for building. These artifacts can also work with other IDA versions that share the same ABI.

### OS

We build on these [GitHub-hosted runners](https://docs.github.com/en/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners):

- windows-2025
- ubuntu-24.04 *(for glibc 2.39 and above)*
- ubuntu-22.04 *(for glibc 2.35 and above)*
- macos-26 *(universal binary for both Apple silicon and Intel)*

Ubuntu builds are compatible with most Linux distributions as long as they use the same or newer version of glibc (and other system libraries).

## Custom Build

If you want to build on your own, fork this repository and modify `.github/workflows/build.yml`. It is fairly self-explanatory, but here are some tips:

- `matrix.idasdk.subdir` is the path from the IDA SDK root directory to the directory that contains the `include` and `lib` directories.
- `matrix.idasdk.type` is the source type for downloading the IDA SDK. If you use `hcli`, check the [HCLI documentation](https://hcli.docs.hex-rays.com/getting-started/authentication/#api-key-authentication) to get an API key and add it to your repository secrets.
- GitHub Actions is free for public repositories. To reduce build time, remove unnecessary operating systems and IDA versions from `matrix.os` and `matrix.idasdk`.

In forked repositories, Actions is disabled by default. You can enable it in the repository settings under the "Actions" tab.

## See Also

- Hex-Rays Plugin Contributions builds and publishes to Hex-Rays Plugin Manager. Their workflow and this repository [reference each other](https://github.com/google/binexport/issues/159). You can install their artifacts with HCLI:

	```bash
	hcli plugin install bindiff
	hcli plugin install binexport
	```

	Source code: https://github.com/HexRays-plugin-contributions/bindiff/tree/ci-gha

	Details: https://github.com/google/bindiff/pull/85

- After a new IDA version is released, open-source contributors may provide updated artifacts earlier in their forks. You can check commits newer than this repository here: https://github.com/Lil-Ran/build-bindiff-for-ida-9/network

## Stargazers over time

[![Stargazers over time](https://starchart.cc/Lil-Ran/build-bindiff-for-ida-9.svg?variant=adaptive)](https://starchart.cc/Lil-Ran/build-bindiff-for-ida-9)
