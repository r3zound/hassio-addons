# Home Assistant Community Add-on: Portainer

[![GitHub Release][releases-shield]][releases]
![Project Stage][project-stage-shield]
[![License][license-shield]](LICENSE.md)

![Supports aarch64 Architecture][aarch64-shield]
![Supports amd64 Architecture][amd64-shield]
![Supports armhf Architecture][armhf-shield]
![Supports armv7 Architecture][armv7-shield]
![Supports i386 Architecture][i386-shield]

[![Github Actions][github-actions-shield]][github-actions]
![Project Maintenance][maintenance-shield]
[![GitHub Activity][commits-shield]][commits]

[![Discord][discord-shield]][discord]
[![Community Forum][forum-shield]][forum]

[![Sponsor Frenck via GitHub Sponsors][github-sponsors-shield]][github-sponsors]

[![Support Frenck on Patreon][patreon-shield]][patreon]

轻松管理您的Docker环境。

![The Portainer Hass.io add-on](images/screenshot.png)

## 关于

Portainer是一个开源的轻量级管理用户界面，使您能够轻松管理Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，允许您管理容器、镜像、网络和卷。

[:books: 阅读完整的插件文档][docs]


## 叉叉项目

此插件已被其作者停止维护，现已不再从社区库中提供。
这是一个努力产生的叉叉项目。

如果您运行Home Assistant，请注意，运行额外的容器并不是被支持的用例，这会使您的系统被标记为不受支持。

## 警告 1

Portainer插件非常强大，几乎可以让您访问整个系统。虽然这个插件是经过仔细创建和维护的，并考虑到安全性，但在错误或缺乏经验的人手中，它可能会损害您的系统。

## 警告 2

Portainer插件是用于调试Home Assistant及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点会使您的系统被标记为不受支持！

## 支持

有问题吗？

[在这里报问题][issue] GitHub。

## 贡献

这是一个活跃的开源项目。我们始终欢迎希望使用代码或贡献代码的人。

我们已设置一个包含我们[贡献指南](,github/CONTRIBUTING.md)的单独文档。

感谢您的参与！:heart_eyes:

## 作者与贡献者

此仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（以下简称“软件”）副本的人免费使用本软件的权利，包括不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件的副本，并允许被提供该软件的人这样做，但须遵守以下条件：

上述版权声明和此许可证声明应包含在所有软件的副本或重要部分中。

该软件是“按原样”提供的，不作任何种类的明示或暗示的保证，包括但不限于对于适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权诉讼还是其他诉讼中。

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