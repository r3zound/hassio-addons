# Home Assistant社区附加组件：Portainer

[![GitHub发布][releases-shield]][releases]
![项目阶段][project-stage-shield]
[![许可证][license-shield]](LICENSE.md)

![支持aarch64架构][aarch64-shield]
![支持amd64架构][amd64-shield]
![支持armhf架构][armhf-shield]
![支持armv7架构][armv7-shield]
![支持i386架构][i386-shield]

[![Github Actions][github-actions-shield]][github-actions]
![项目维护][maintenance-shield]
[![GitHub活动][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![社区论坛][forum-shield]][forum]

[![通过GitHub赞助Frenck][github-sponsors-shield]][github-sponsors]

[![在Patreon上支持Frenck][patreon-shield]][patreon]

轻松管理您的Docker环境。

![Portainer Hass.io附加组件](images/screenshot.png)

## 关于

Portainer是一个开源轻量级管理UI，允许您轻松管理Docker主机或Docker Swarm集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

[:books: 阅读完整的附加组件文档][docs]

## FORKED

此附加组件已由其作者停用，不再从社区仓库中提供。
这是一个尽力而为的分支。

如果您运行Home Assistant，请注意，运行额外的容器不是支持的用例，并会触发您的系统被标记为不支持。

## 警告1

Portainer附加组件确实非常强大，几乎可以访问您的整个系统。虽然此附加组件是经过仔细创建和维护的，且考虑到了安全性，但在错误或缺乏经验的用户手中，它可能会损坏您的系统。

## 警告2

Portainer附加组件旨在用于调试Home Assistant及其容器。
它并非用于管理或部署您的自定义软件或第三方容器。

**Home Assistant不支持在Home Assistant OS或监督安装类型上运行第三方容器**。忽略这一点会使您的系统被标记为不支持！

## 支持

有问题吗？

[在此处提出问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望使用或贡献代码的人。

我们已设立一份包含我们[贡献指南](,github/CONTRIBUTING.md)的单独文档。

感谢您的参与！ :heart_eyes:

## 作者与贡献者

该仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人，无限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，及允许提供该软件的人这样做，附带以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的重大部分中。

软件按“原样”提供，不附带任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他诉讼中。

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