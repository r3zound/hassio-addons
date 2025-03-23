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

Portainer是一个开源轻量级管理用户界面，使您能够
轻松管理Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了Docker的详细
概述，并允许您管理容器、镜像、网络和
卷。

[:books: 阅读完整的插件文档][docs]


## 分叉

该插件已被其作者弃用，不再可从社区库中获取。
这是一个尽力而为的分叉。

如果您运行Home Assistant，请注意运行额外的容器
不被支持，并将导致您的系统被标记为
不受支持。

## 警告 1

Portainer插件功能强大，几乎可以访问
您的整个系统。虽然该插件是在注重安全的情况下创建和维护的，
在错误或缺乏经验的手中，
可能会对您的系统造成损坏。

## 警告 2

Portainer插件用于调试Home Assistant及其容器。
它不用于或设计用于管理或部署您的自定义软件
或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**
不遵循此规则，将
导致您的系统被视为不受支持！

## 支持

有问题吗？

[在这里提交问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望
使用或贡献代码的人。

我们已设置一个单独的文档，包含我们的
[贡献指南](,github/CONTRIBUTING.md)。

感谢您的参与！:heart_eyes:

## 作者与贡献者

本仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，
请查看[贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（统称“软件”）
副本的人在上述条件下使用、复制、修改、合并、出版、
分发、再许可和/或出售本软件的副本，并允许其提供
本软件的人这样做，但需遵循以下条件：

上述版权声明和本许可声明应包含在所有
副本或软件的实质部分中。

本软件按“原样”提供，不附带任何形式的保证，明示或
暗示，包括但不限于适销性、特定用途适用性和
不侵权。在任何情况下，作者或版权持有人
对因使用或与软件或其其他交易有关的任何索赔、损害或其他
责任不承担责任，无论是在合同、侵权还是其他方面。

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