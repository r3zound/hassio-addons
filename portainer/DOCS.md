# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了详细的 Docker 概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，可以让您访问几乎整个系统。尽管此插件是谨慎创建和维护的，并考虑了安全性，但在不当或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件用于调试 Home Assistant 及其容器。它并不适合或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽略这一点将导致您的系统被视为不受支持！

## 安装

要安装此插件，您首先需要转到您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件页面，搜索“Portainer”并像安装任何其他插件一样安装它。

要能够使用此插件，您需要禁用此插件的保护模式。没有它，插件将无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志以查看一切是否顺利。

## 配置

**注**：_请记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注**：_这只是一个示例，切勿复制粘贴！自己创建！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以调整为更详细或更简洁，在您处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常事件。
- `error`：运行时错误，无需立即采取行动。
- `fatal`：发生了严重错误。插件变得无法使用。

请注意，每个级别都会自动包含来自更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

### 选项：`agent_secret`

设置共享代理密钥的选项。还必须在远程代理中作为环境变量设置。

## 更新日志与版本

该仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您也可以在此处 [打开一个问题][issue] GitHub。

## 作者与贡献者

本仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免费、不受限制的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不附带任何形式的明示或暗示的担保，包括但不限于对商业适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人对于因软件或软件的使用或其他交易导致的任何索赔、损害或其他责任，不论是在合同、侵权或其他方面，均不承担责任。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm