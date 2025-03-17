# Home Assistant社区附加组件：Portainer

Portainer是一个开源的轻量级管理用户界面，使您能够轻松管理Docker主机或Docker集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer附加组件非常强大，并且几乎可以访问您整个系统。虽然这个附加组件是在考虑安全性和谨慎的情况下创建和维护的，但在错误或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer附加组件旨在调试Home Assistant及其容器。它不是用于管理或部署您的自定义软件或第三方容器的。

**Home Assistant 不支持在Home Assistant OS或监督安装类型上运行第三方容器**。忽略这一点，将会导致您的系统不受支持！

## 安装

要安装此附加组件，您首先需要转到您的个人资料并打开“高级模式”，完成后返回Home Assistant附加组件并搜索“Portainer”并按照其他附加组件的方式安装。

要能够使用此附加组件，您需要禁用此附加组件的保护模式。没有它，附加组件无法访问Docker。

1. 在主管附加组件商店中搜索“Portainer”附加组件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志以查看是否一切正常。

## 配置

**注意**：_更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，勿复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level`选项控制附加组件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：普通（通常）的有趣事件。
- `warning`：不属于错误的特殊情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现严重错误。附加组件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug`也会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在故障排除。

### 选项：`agent_secret`

设置共享代理秘密的选项。必须在远程代理中设置为环境变量。

## 更新日志与发布

该存储库使用[GitHub的发布][releases]功能保持变更日志。

版本基于[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几个选项可以得到答案：

- [Home Assistant社区附加组件Discord聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子版块][reddit]在[/r/homeassistant][reddit]

您也可以[在这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件的副本，以及允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有者都不对因使用该软件或与该软件有关的其他交易产生的任何索赔、损害或其他责任负责，无论是合同、侵权或其他原因。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm