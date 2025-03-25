# Home Assistant 社区插件：Portainer

Portainer 是一个开源的轻量级管理用户界面，使您能够轻松管理一个或多个 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了详细的 Docker 概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，可以让您访问几乎整个系统。尽管该插件是在安全的前提下小心创建和维护的，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不意味着或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点将使您的系统变为不受支持！

## 安装

要安装此插件，您需要首先进入您的个人资料并打开“高级模式”，完成后返回 Home Assistant 插件页面，搜索“Portainer”并像安装其他插件一样进行安装。

要能够使用此插件，您需要禁用该插件的保护模式。如果没有它，插件无法访问 Docker。

1. 在监督插件商店中搜索“Portainer”插件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志以查看是否一切正常。

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请勿复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在您处理未知问题时可能有用。可能的值有：

- `trace`：显示每个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`agent_secret`

设置共享代理秘密的选项。必须在远程代理中作为环境变量设置。

## 更新日志与版本

本存储库使用 [GitHub 的发布][releases] 功能来保持变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 提供插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 的讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人，免费处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许向其提供软件的人这样做，但须遵守以下条件：

上述版权声明及本许可声明应包含在所有软件副本或重大部分中。

软件是“按原样”提供的，不提供任何类型的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易有关的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm