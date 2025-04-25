# Home Assistant Community Add-on: Portainer

[![GitHub Release][releases-shield]][releases]
![项目阶段][project-stage-shield]
[![许可证][license-shield]](LICENSE.md)

![支持 aarch64 架构][aarch64-shield]
![支持 amd64 架构][amd64-shield]
![支持 armhf 架构][armhf-shield]
![支持 armv7 架构][armv7-shield]
![支持 i386 架构][i386-shield]

[![Github Actions][github-actions-shield]][github-actions]
![项目维护][maintenance-shield]
[![GitHub 活动][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![社区论坛][forum-shield]][forum]

[![通过 GitHub Sponsors 赞助 Frenck][github-sponsors-shield]][github-sponsors]

[![通过 Patreon 支持 Frenck][patreon-shield]][patreon]

轻松管理您的 Docker 环境。

![Portainer Hass.io 插件](images/screenshot.png)

## 关于

Portainer 是一个开源轻量级管理 UI，可以让您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供 Docker 的详细概述，允许您管理容器、镜像、网络和卷。

[:books: 阅读完整的插件文档][docs]

## 分支

该插件已被其作者停止维护，并且不再可从社区库中获取。
这是一个尽力而为的分支。

如果您运行 Home Assistant，请注意运行额外的容器
并不是一个受支持的用例，并且会导致您的系统被标记为
不受支持。

## 警告 1

Portainer 插件非常强大，几乎可以访问您整个系统。尽管这个插件是经过仔细创建和维护的，并考虑到安全性，但在错误或缺乏经验的用户手中，
它可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。
它并未旨在或设计用于管理或部署您的自定义软件
或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这点将使您的系统被视为不受支持！

## 支持

有问题吗？

[在此处提交问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望使用或贡献代码的人。

我们已经建立了一个包含我们的 [贡献指南](,github/CONTRIBUTING.md) 的单独文档。

感谢您的参与！:heart_eyes:

## 作者 & 贡献者

这个库的最初设定是由 [Franck Nijhof][frenck] 完成的。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授权任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售该软件副本的权利，并允许提供该软件的人这样做，附带以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件是按“原样”提供的，没有任何明示或暗示的担保，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易与该软件相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[commits-shield]: https://img.shields.io/github/commit-activity/y/hassio-addons/addon-portainer.svg
[commits]: https://github.com/hassio-addons/addon-portainer/commits/main
[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord-shield]: https://img.shields.io/discord/478094546522079232.svg
[discord]: https://discord.me/hassioaddons
[docs]: https://github.com/hassio-addons/addon-portainer/blob/main/portainer/DOCS.md
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[github-actions-shield]: https://github.com/hassio-addons/addon-portainer/workflows/CI/badge.svg
[github-actions]: https://github.com/hassio-addons/addon-portainer/actions
[github-sponsors-shield]: https://frenck.dev/wp-content/uploads/2019/12/github_sponsor.png
[github-sponsors]: https://github.com/sponsors/frenck
[i386-shield]: https://img.shields.io/badge/i386-no-red.svg
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[license-shield]: https://img.shields.io/github/license/hassio-addons/addon-portainer.svg
[maintenance-shield]: https://img.shields.io/maintenance/yes/2021.svg
[patreon-shield]: https://frenck.dev/wp-content/uploads/2019/12/patreon.png
[patreon]: https://www.patreon.com/frenck
[project-stage-shield]: https://img.shields.io/badge/project%20stage-%20!%20DEPRECATED%20%20%20!-ff0000.svg
[reddit]: https://reddit.com/r/homeassistant
[releases-shield]: https://img.shields.io/github/release/hassio-addons/addon-portainer.svg
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[repository]: https://github.com/hassio-addons/repository