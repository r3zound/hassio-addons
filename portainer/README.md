# Home Assistant Community Add-on: Portainer

[![GitHub Release][releases-shield]][releases]
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

[![通过GitHub赞助商支持Frenck][github-sponsors-shield]][github-sponsors]

[![在Patreon支持Frenck][patreon-shield]][patreon]

轻松管理您的Docker环境。

![Portainer Hass.io插件](images/screenshot.png)

## 关于

Portainer是一个开源的轻量级管理UI，允许您轻松管理Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了详细的Docker概览，并允许您管理容器、镜像、网络和卷。

[:books: 阅读完整的插件文档][docs]

## FORKED

此插件已被其作者停用，不再从社区存储库中提供。
这是一次尽力而为的分叉。

如果您运行Home Assistant，请注意，运行额外的容器不被支持，并会导致您的系统被标记为不受支持。

## 警告 1

Portainer插件非常强大，可以让您访问几乎整个系统。尽管此插件是在考虑安全性的情况下小心创建和维护的，但在错误或缺乏经验的手中，它可能会损害您的系统。

## 警告 2

Portainer插件旨在调试Home Assistant及其容器。
它并不是用于管理或部署您的自定义软件或第三方容器。

**Home Assistant不支持在Home Assistant OS或监督安装类型上运行第三方容器**
忽略这一点，会导致您的系统被视为不受支持！

## 支持

有问题吗？

[在这里打开一个问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望使用代码或为其做出贡献的人。

我们已设置一个单独的文档，包含我们的
[贡献指南](,github/CONTRIBUTING.md)。

感谢您的参与！ :heart_eyes:

## 作者和贡献者

此存储库的原始设置由[Franck Nijhof][frenck]完成。

要查看所有作者和贡献者的完整列表，
请查阅[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）的人员使用该软件而不受限制的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件的副本的权利，并允许被提供该软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重要部分中。

该软件按“原样”提供，没有任何明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因软件或使用或与软件的其他交易引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼或其他方面。

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