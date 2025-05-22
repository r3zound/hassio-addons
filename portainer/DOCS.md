# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理用户界面，可以让您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，几乎可以让您访问整个系统。尽管此插件在创建和维护时都非常小心并考虑了安全性，但在错误或没有经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件旨在用于调试 Home Assistant 及其容器。
它并不适合或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器。** 忽略这一点将使您的系统不被支持！

## 安装

要安装此插件，您需要先进入您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件页面并搜索“Portainer”，像安装其他插件一样进行安装。

要能够使用此插件，您需要在此插件上禁用保护模式。没有它，插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，以查看一切是否顺利。

## 配置

**注意**：_当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请勿复制和粘贴！创造你自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的特殊情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了重大错误。插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这也是推荐的设置，除非您在故障排除。

### 选项：`agent_secret`

设置共享代理秘密的选项。必须在远程代理中也作为环境变量进行设置。

## 更新日志和版本

本存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以得到解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit] 中。

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许向其提供软件的人这样做，条件如下：

上述版权声明和此许可声明应包含在所有软件副本或实质性部分中。

本软件是按“原样”提供的，没有任何种类的保证，无论是明示还是隐含，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面，均源于或与本软件或使用或其他交易有关。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm