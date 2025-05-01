# Home Assistant 社区附加组件：Portainer

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 附加组件功能强大，几乎可以访问您的整个系统。尽管该附加组件是在安全和谨慎的考虑下创建和维护的，但在错误或缺乏经验的操作下，可能会损坏您的系统。

## 警告 2

Portainer 附加组件旨在调试 Home Assistant 及其容器。它并不是用于管理或部署您自定义软件或第三方容器的目的或设计。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽略这一点将使您的系统处于不受支持状态！

## 安装

要安装此附加组件，您需要首先进入您的个人资料并开启“高级模式”，完成后返回 Home Assistant 附加组件并搜索“Portainer”，并像安装其他附加组件一样安装它。

要使用此附加组件，您需要在此附加组件上禁用保护模式。没有它，附加组件无法访问 Docker。

1. 在监督者附加组件商店中搜索“Portainer”并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志，查看一切是否正常。

## 配置

**注意**：_当配置更改时，请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更多或更少的信息，这在处理未知问题时可能很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：不是错误的例外情况。
- `error`：不会立即采取行动的运行时错误。
- `fatal`：发生了严重错误。附加组件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。还必须在远程代理中作为环境变量设置。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能记录变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种方法可以获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行 Home Assistant 的一般讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 版块][reddit] 进行 [/r/homeassistant][reddit] 讨论。

您还可以在 [此处打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授权，任何获得本软件及相关文档文件（“软件”）副本的人，均可无限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人如此做，但须遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不附有任何类型的明示或暗示的担保，包括但不限于对于适销性、特定用途的适用性及不侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他处理而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm