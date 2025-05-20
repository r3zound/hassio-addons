# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件功能强大，几乎可以访问您整个系统。虽然这个插件是经过仔细创建和维护的，并考虑了安全性，但在错误或经验不足的操作下，可能会损害您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并没有设计或用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器。** 忽视这一点，将使您的系统不受支持！

## 安装

要安装这个插件，首先需要去您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，然后像安装其他插件一样安装它。

要能够使用这个插件，您需要禁用该插件的保护模式。没有它，插件无法访问 Docker。

1. 在监控器插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，以查看一切是否顺利。

## 配置

**注意**：_记得在配置更改后重新启动插件。_

插件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制和粘贴！自己创建！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以调整为更详细或更简洁，这在您处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每个细节，像是所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项: `agent_secret`

设置共享代理秘密的选项。必须在远程代理中作为环境变量设置。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选项可以得到解答：

- 在 [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- 在 [Home Assistant Discord 聊天服务器][discord-ha] 进行关于 Home Assistant 的讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] 的 [/r/homeassistant][reddit]。

您还可以在 [这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（"软件"）副本的人，无偿地处理该软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售该软件的副本，并允许向其提供该软件的人员这样做，条件如下：

上述版权声明和本许可声明应包含在软件的所有副本或实质部分中。

该软件是“按现状”提供的，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适合性和非侵权的担保。在任何情况下，作者或版权持有人均不对由于软件或使用或其他交易而产生的任何索赔、损害或其他责任负责，无论是基于合同、侵权还是其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm