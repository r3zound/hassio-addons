# Home Assistant Community Add-on: Portainer

Portainer是一个开源的轻量级管理UI，允许您轻松管理Docker主机或Docker群集。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer附加组件非常强大，几乎可以让您访问整个系统。虽然这个附加组件是在关注安全的情况下精心创建和维护的，但是在错误或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer附加组件旨在用于调试Home Assistant及其容器。它并不意味着或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在Home Assistant OS或监督安装类型上运行第三方容器。** 忽视这一点，将使您的系统处于不受支持的状态！

## 安装

要安装此附加组件，您首先需要转到您的个人资料并启用“高级模式”，完成后返回Home Assistant附加组件并搜索“Portainer”，然后像安装其他附加组件一样安装它。

要能够使用该附加组件，您需要禁用此附加组件上的保护模式。没有它，该附加组件无法访问Docker。

1. 在监督附加组件商店搜索“Portainer”附加组件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志以查看是否一切正常。

## 配置

**注意**：_在更改配置时，请记得重新启动附加组件。_

示例附加组件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制粘贴它！创建您自己的！_

### 选项：`log_level`

`log_level`选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：某些事情出了严重问题。附加组件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug`也显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。必须在远程代理中作为环境变量设置。

## 更新日志与版本

该存储库使用[GitHub的发布][releases]功能维护变更日志。

版本基于 [语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下情况递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant社区附加组件Discord聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以获取一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子版块][reddit] (/r/homeassistant)[reddit]。

您还可以在这里[提出问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授权，免费提供给任何获得本软件及其相关文档文件（“软件”）副本的人，可以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许向接受该软件的人这样做，需遵守以下条件：

上述版权声明和本许可声明应包括在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，不附带任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与软件或其他交易的使用而产生的任何索赔、损害或其他责任负责， 无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm