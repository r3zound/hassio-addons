# Home Assistant 社区插件: Portainer

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理Docker主机或Docker Swarm集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer插件功能强大，几乎可以访问您整个系统。虽然这个插件是经过仔细创建和维护，并考虑了安全性，但在错误或缺乏经验的操作下，它可能会破坏您的系统。

## 警告 2

Portainer插件旨在调试Home Assistant及其容器。它并不是用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在Home Assistant OS或监督安装类型上运行第三方容器。** 忽视这一点将导致您的系统被视为不受支持！

## 安装

要安装此插件，您首先需要进入您的个人资料并打开“高级模式”，完成后返回Home Assistant插件页面，搜索“Portainer”并像安装任何其他插件一样进行安装。

要使用此插件，您需要禁用此插件的保护模式。没有它，插件无法访问Docker。

1. 在监督插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，以查看一切是否正常。

## 配置

**注意**：_当更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制和粘贴！请创建您自己的！_

### 选项： `log_level`

`log_level`选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能很有用。可能的值包括：

- `trace`: 显示每一个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的例外事件。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现严重错误，插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug`也显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在进行故障排除。

### 选项： `agent_secret`

设置共享代理密钥的选项。必须在远程代理中作为环境变量也设置。

## 更新日志与版本

此存储库使用 [GitHub的版本][releases] 功能维护变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下情况进行增量：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- [Home Assistant社区插件Discord聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]，用于一般Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子论坛][reddit]。

您也可以在这里[打开问题][issue] GitHub。

## 作者与贡献者

此存储库的初始设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有(c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理该软件的权利，不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，以及允许被提供该软件的人这样做，但受以下条件的限制：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

软件按“原样”提供，不附有任何形式的明示或暗示的担保，包括但不限于对适销性、特定目的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权诉讼或其他诉讼中。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm