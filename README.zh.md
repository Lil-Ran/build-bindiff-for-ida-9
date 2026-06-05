# 构建用于 IDA 9 的 BinDiff

[English](README.md) | 简体中文

[![GitHub Downloads (all assets, all releases)](https://img.shields.io/github/downloads/Lil-Ran/build-bindiff-for-ida-9/total)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub Repo stars](https://img.shields.io/github/stars/Lil-Ran/build-bindiff-for-ida-9?style=flat)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/stargazers)
[![GitHub Release](https://img.shields.io/github/v/release/Lil-Ran/build-bindiff-for-ida-9)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/releases)
[![GitHub commits since latest release](https://img.shields.io/github/commits-since/Lil-Ran/build-bindiff-for-ida-9/latest)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/commits/main/)
[![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/Lil-Ran/build-bindiff-for-ida-9/build.yml?branch=main&label=ci)](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions)

这是一个非官方仓库，仅为方便使用。原始源码位于 [Google 的 BinDiff 仓库](https://github.com/google/bindiff)。

构建日志和产物可在 [Actions 页面](https://github.com/Lil-Ran/build-bindiff-for-ida-9/actions) 查看。

## 安装

要安装 IDA 插件，请从 release 页面下载并解压，然后将 `ida` 文件夹下的动态库文件（`.dll` 或 `.so` 或 `.dylib`）复制到你的 IDA 安装目录的 `plugins` 文件夹中。

## 兼容性

### IDA 版本

当前状态：完成了 IDA 9.3, 9.2, 9.1, 9.0 的构建。

其中的 IDA 版本指的是所用的 IDA SDK 版本。该构建产物也可用于具有相同 ABI 的其他 IDA 版本。

### 操作系统

我们在这些 [GitHub 托管运行器](https://docs.github.com/zh/actions/using-github-hosted-runners/using-github-hosted-runners/about-github-hosted-runners) 上进行构建：

- windows-2025
- ubuntu-24.04 _(适用于 glibc 2.39 及以上)_
- ubuntu-22.04 _(适用于 glibc 2.35 及以上)_
- macos-26 _(构建可用于 Apple silicon 和 Intel 的通用二进制文件)_

Ubuntu 构建文件兼容大多数 Linux 发行版，只要它们使用相同或更高版本的 glibc（以及其他系统库）。

## 自定义构建

如需自行构建，可 fork 本仓库并修改 `.github/workflows/build.yml`。该文件已经有足够的可读性，以下是一些提示：

- `matrix.idasdk.subdir` 指的是从 IDA SDK 根目录到直接包含 `include` 和 `lib` 目录的路径。
- `matrix.idasdk.type` 指的是 IDA SDK 的下载来源，如果是 `hcli`，则需要查阅 [HCLI 文档](https://hcli.docs.hex-rays.com/getting-started/authentication/#api-key-authentication) 以获取 API key，并将其添加到仓库的 Secrets 中。
- GitHub Actions 对 public 的仓库免费，若想减少运行时间，可在 `matrix.os` 和 `matrix.idasdk` 中移除不需要的操作系统和 IDA 版本。

Fork 后的仓库默认禁用 Actions，可在仓库设置的 "Actions" 标签页中启用。

## 另见

- Hex-Rays Plugin Contributions 构建并发布到了 Hex-Rays 的插件包管理器，其工作流文件与本仓库[相互参考](https://github.com/google/binexport/issues/159)。可通过 HCLI 安装他们的构建文件。

  ```bash
  hcli plugin install bindiff
  hcli plugin install binexport
  ```

  源代码：https://github.com/HexRays-plugin-contributions/bindiff/tree/ci-gha

  详细说明：https://github.com/google/bindiff/pull/85

- 在新的 IDA 版本发布后，一些开源贡献者可能在分叉的仓库中更快地提供了新的构建文件。可以在这里查看比本仓库更新的提交：https://github.com/Lil-Ran/build-bindiff-for-ida-9/network

## 星标图

[![Stargazers over time](https://starchart.cc/Lil-Ran/build-bindiff-for-ida-9.svg?variant=adaptive)](https://starchart.cc/Lil-Ran/build-bindiff-for-ida-9)
