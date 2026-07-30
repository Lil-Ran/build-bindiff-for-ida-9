# 构建用于 IDA 9 的 BinDiff

[English](README.md) | 简体中文

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/Lil-Ran/build-bindiff-for-ida-9/total)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub Repo stars](https://img.shields.io/github/stars/Lil-Ran/build-bindiff-for-ida-9?style=flat)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/stargazers)
[![GitHub Release](https://img.shields.io/github/v/release/Lil-Ran/build-bindiff-for-ida-9)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/Lil-Ran/build-bindiff-for-ida-9/latest)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/commits/main/)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/Lil-Ran/build-bindiff-for-ida-9/build.yml?branch=main&label=ci)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions)

这是一个非官方仓库，仅供**确保成功构建**和**保留历史产物**。原始源码位于 Google 的 [BinDiff](https://github.com/google/bindiff) 和 [BinExport](https://github.com/google/binexport) 仓库。

原项目已经开始支持 IDA 9.4 及更高版本。然而，本仓库包含一些必要的补丁。详见 [patches/README.md](./patches/README.md)。

构建日志和产物可在 [Actions 页面](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions/workflows/build.yml) 查看。

## 安装

要安装 IDA 插件，请从 release 页面下载并解压，然后将 `ida` 文件夹下的动态库文件（`.dll` 或 `.so` 或 `.dylib`）复制到你的 IDA 安装目录的 `plugins` 文件夹中。

## 兼容性

### IDA 版本

[最新发版](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)为 IDA `9.4` 构建。

支持 IDA `9.3sp1`, `9.3`, `9.2`, `9.1` 和 `9.0` 的最后一次发版是 [release-20260716-1](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases/tag/release-20260716-1).

其中的 IDA 版本指的是所用的 IDA SDK 版本。该构建产物也可用于具有相同 ABI 的其他 IDA 版本。

### 操作系统

我们在这些 [GitHub 托管运行器](https://docs.github.com/zh/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners) 上进行构建：

- windows-2025
- windows-11-arm
- ubuntu-22.04
- ubuntu-22.04-arm
- ubuntu-26.04
- ubuntu-26.04-arm
- macos-26

Ubuntu 构建文件兼容大多数 Linux 发行版，只要它们使用相同或更高版本的 glibc（以及其他系统库）。

macOS 构建文件是可用于 Apple silicon 和 Intel 的通用二进制文件。

## 自定义构建

如需自行构建，可 fork 本仓库。如有需要可修改 `.github/workflows/build.yml`。

GitHub Actions 对 public 的仓库免费，若想减少运行时间，可在 `matrix.os` 和 `matrix.idasdk` 中移除不需要的操作系统和 IDA 版本。

Fork 后的仓库默认禁用 Actions，可在仓库设置的 "Actions" 标签页中启用。

## 另见

- Hex-Rays 构建并发布到了 Hex-Rays 的插件包管理器。可通过 [`hcli`](https://hcli.docs.hex-rays.com/) 安装他们的构建文件。

  ```bash
  hcli plugin install bindiff
  hcli plugin install binexport
  ```

  仓库：https://github.com/HexRaysSA/bindiff/tree/ci-gha

  详细说明：https://github.com/google/bindiff/pull/85

- 在新的 IDA 版本发布后，一些开源贡献者可能在分叉的仓库中更快地提供了新的构建文件。可以在这里查看比本仓库更新的提交：https://github.com/Lil-Ran/build-bindiff-for-ida-9/network
