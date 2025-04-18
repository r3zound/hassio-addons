# Home Assistant社区插件：Portainer

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

[![通过GitHub赞助Frenck][github-sponsors-shield]][github-sponsors]

[![在Patreon上支持Frenck][patreon-shield]][patreon]

轻松管理你的Docker环境。

![Portainer Hass.io插件](images/screenshot.png)

## 关于

Portainer是一个开源的轻量级管理UI，允许你轻松管理Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许你管理容器、映像、网络和卷。

[:books: 阅读完整的插件文档][docs]

## 叉接

此插件已被其作者弃用，不再从社区存储库中提供。
这是一个尽力而为的叉接。

如果你运行Home Assistant，请注意，运行额外的容器
不被支持，将使你的系统被标记为不支持。

## 警告 1

Portainer插件非常强大，几乎可以让你访问整个系统。虽然这个插件是经过精心创建和维护的，并考虑到了安全性，但在错误或没有经验的手中，
可能会损坏你的系统。

## 警告 2

Portainer插件旨在调试Home Assistant及其容器。
它不是用于管理或部署你的自定义软件或第三方容器。

**Home Assistant 不支持在Home Assistant OS或监督安装类型上运行第三方容器**。忽略这一点将使你的系统被认为是不受支持的！

## 支持

有问题吗？

[在这里提交问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望使用代码或为其贡献的人。

我们已设置了一个包含我们的
[贡献指南](,github/CONTRIBUTING.md)的单独文档。

感谢你的参与！:heart_eyes:

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有(c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人，处理
该软件时不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售
该软件副本的权利，并允许提供该软件的人员这样做，受以下条件的限制：

上述版权声明和该许可声明应包含在所有
副本或软件的实质性部分中。

该软件是按“现状”提供的，不做任何明示或
暗示的保证，包括但不限于适销性、特定用途的适用性和不侵权。任何情况下，作者或版权持有者均不对任何索赔、损害或其他
责任承担责任，无论是在合同、侵权或其他方式中，因使用
该软件或与该软件的使用或其他交易相关。

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