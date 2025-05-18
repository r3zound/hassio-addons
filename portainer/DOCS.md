# Home Assistant Community Add-on: Portainer

Portainer 是一个开源轻量级管理用户界面，可以让您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，几乎可以访问您整个系统。虽然这个插件是经过小心创建和维护的，并且考虑到了安全性，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不意在或设计用于管理或部署您自定义的软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点将使您的系统处于不支持状态！

## 安装

要安装此插件，您首先需要进入您的个人资料并启用“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，随后像安装其他插件一样安装它。

为了能够使用这个插件，您需要在这个插件上禁用保护模式。没有它，插件将无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志以查看是否一切正常。

## 配置

**注意**：_更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请勿复制和粘贴！创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简单，这在您处理未知问题时可能会有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：某些事情发生了严重错误。插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是一种推荐的设置，除非您在进行故障排除。

### 选项: `agent_secret`

设置共享代理秘密的选项。必须在远程代理中作为环境变量设置。

## 更新日志与发行版

此存储库使用 [GitHub 的发行版][releases] 功能保持更改日志。

发行版基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种选择可以获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许提供该软件的人按以下条件进行操作：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件是按“原样”提供的，没有任何类型的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定目的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与该软件或其他交易有关的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm