# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量管理用户界面，它允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，可以让您几乎访问整个系统。虽然这一插件是在安全的前提下精心创建和维护的，但在错误或没有经验的手中，它可能会损害您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不适合或设计用来管理或部署您自定义的软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点，将使您的系统不受支持！

## 安装

要安装此插件，您首先需要转到您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，并像安装其他插件一样安装它。

要能够使用此插件，您需要禁用此插件的保护模式。没有它，插件将无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，以确认一切正常。

## 配置

**注意**: _请记得在更改配置时重启插件。_

插件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**: _这仅仅是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会有用。可用的值包括：

- `trace`: 显示每一个细节，如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）感兴趣的事件。
- `warning`: 不是错误的异常事件。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 某些事情出了严重问题。插件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排查问题。

### 选项: `agent_secret`

一个设置共享代理密钥的选项。必须在远程代理中作为环境变量设置。

## 更新日志与发布

该仓库使用 [GitHub 的发布][releases] 功能维护一个变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下标准递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和改进。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几个选项可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提问](issue) GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，按其自行选择的方式使用、复制、修改、合并、出版、分发、再授权和/或销售该软件副本的权利，并允许向其提供软件的人这样做，附带以下条件：

上述版权声明和本许可声明应包含在所有软件副本或重要部分中。

软件按“原样”提供，不附带任何种类的明示或暗示担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因软件或其使用或其他交易产生的任何索赔、损害或其他责任承担责任，无论是基于合同诉讼、侵权或其他诉讼。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm