# Home Assistant 社区插件: Portainer

Portainer 是一个开源的轻量级管理 UI，允许你轻松管理一个或多个 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许你管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件极其强大，可以让你访问几乎整个系统。虽然这个插件是经过仔细创建和维护，并考虑到安全性，但在错误或经验不足的手中，它可能会损坏你的系统。

## 警告 2

Portainer 插件用于调试 Home Assistant 及其容器。并不意味着或设计用于管理或部署你的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或受监督的安装类型上运行第三方容器。** 忽视这一点，将使你的系统失去支持！

## 安装

要安装这个插件，你首先需要进入你的个人资料并开启 “高级模式”。完成后，返回 Home Assistant 插件并搜索 “Portainer”，然后像安装其他插件一样安装它。

为了能够使用这个插件，你需要禁用该插件上的保护模式。没有它，插件无法访问 Docker。

1. 在监督插件商店中搜索 “Portainer” 插件并安装它。
1. 将 “保护模式” 开关设置为关闭。
1. 启动 “Portainer” 插件。
1. 检查 “Portainer” 插件的日志，看看一切是否正常。

## 配置

**注意**: _记得在配置更改后重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**: _这只是一个示例，请勿直接复制粘贴！创建你自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更详细或更简洁的日志，这在处理未知问题时可能会有所帮助。可能的值有：

- `trace`: 显示每一个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 异常事件，但不是错误。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你在进行故障排除。

### 选项: `agent_secret`

设置共享代理秘钥的选项。也必须在远程代理中设置为环境变量。

## 更新日志 & 发布

该仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver] 的规则，使用 `MAJOR.MINOR.PATCH` 的格式。简单来说，版本号将根据以下原则进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

你有几种方式可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

你也可以在这里 [打开一个问题][issue] GitHub。

## 作者 & 贡献者

该仓库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，进行使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许获得软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

本软件是按“原样”提供的，不提供任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易本软件或与软件相关的使用而导致的任何索赔、损害或其他责任负责，无论是基于合同诉讼、侵权或其他诉讼。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm