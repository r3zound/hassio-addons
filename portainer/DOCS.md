# Home Assistant Community Add-on: Portainer

Portainer是一个开源的轻量级管理用户界面，它允许您轻松管理一个或多个Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了详细的Docker概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer附加组件功能强大，几乎可以访问您整个系统。虽然此附加组件是在安全的考虑下精心创建和维护的，但在错误或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer附加组件旨在调试Home Assistant及其容器。它并不适用于管理或部署您的自定义软件或第三方容器。

**Home Assistant不支持在Home Assistant操作系统或监督安装类型上运行第三方容器**。忽略这一点将使您的系统被视为不受支持！

## 安装

要安装此附加组件，首先需要进入您的个人资料并开启“高级模式”，完成后返回Home Assistant附加组件，搜索“Portainer”，并像安装其他附加组件一样进行安装。

要使用此附加组件，您需要禁用该附加组件的保护模式。否则，附加组件无法访问Docker。

1. 在主管附加组件商店中搜索“Portainer”附加组件并进行安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志，以查看是否一切正常。

## 配置

**注意**：_更改配置后，请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level`选项控制附加组件输出的日志级别，可以更改为更加详细或更少详细，在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件但不算错误。
- `error`：运行时错误，但不需要立即处理。
- `fatal`：发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包括来自更高级别的日志消息，例如，`debug`还会显示`info`消息。默认情况下，`log_level`设置为`info`，这是建议的设置，除非您在排除故障。

### 选项：`agent_secret`

设置共享代理秘密的选项。也必须在远程代理中设置为环境变量。

## 更新日志与发布

此存储库使用[GitHub的发布][releases]功能来保持更新日志。

发布基于[语义版本控制][semver]，使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大变化。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的bug修复和软件包更新。

## 支持

有什么问题？

您有几种选择可以获得解答：

- [Home Assistant社区附加组件Discord聊天室][discord]以获取附加组件的支持和功能请求。
- [Home Assistant Discord聊天室][discord-ha]以进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子论坛][reddit]。

您还可以在这里[报告问题][issue]。

## 作者与贡献者

该存储库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2018-2021 Franck Nijhof

在此兹授予任何获得本软件及相关文档文件（“软件”）副本的人，免费使用该软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，受以下条件限制：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

本软件是“按原样”提供，不附带任何类型的保证，无论是明确的还是隐含的，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人都不对因使用本软件或与本软件或其他交易有关的任何声明、损害或其他责任承担责任，无论是在合同、侵权或其他原因下。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm