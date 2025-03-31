# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理用户界面，可让您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 附加组件非常强大，可以访问您几乎整个系统。虽然此附加组件是在谨慎和安全考虑下创建和维护的，但在错误或缺乏经验的人手中，它可能会损害您的系统。

## 警告 2

Portainer 附加组件用于调试 Home Assistant 及其容器。它并不旨在或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或受监控安装类型上运行第三方容器**。忽视此点将使您的系统被认为不受支持！

## 安装

要安装此附加组件，您需要首先访问您的个人资料并启用“高级模式”，完成后返回 Home Assistant 附加组件并搜索“Portainer”，按照其他附加组件的方式进行安装。

要能够使用此附加组件，您需要禁用此附加组件上的保护模式。没有它，附加组件无法访问 Docker。

1. 在 Supervisor 附加组件商店中搜索“Portainer”并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志以查看一切是否正常。

## 配置

**注意**：_更改配置后请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以根据需要更改为更详细或更简洁的输出，这在处理未知问题时可能会很有用。可能值包括：

- `trace`: 显示每个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 异常事件但不是错误。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 发生严重错误，附加组件变得不可用。

请注意，每个级别自动包含更高级别的日志消息，例如，`debug` 级别也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，除非您在进行故障排除，建议使用此设置。

### 选项：`agent_secret`

设置共享代理密钥的选项。在远程代理中也必须作为环境变量设置。

## 更新日志与版本

本存储库使用 [GitHub 的版本][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将基于以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种方式可以得到解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在这里 [打开一个问题][issue] 到 GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获取本软件及相关文档文件（“软件”）副本的人，按无任何限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许提供软件的人这样做，需遵循以下条件：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

本软件是按“现状”提供的，不附有任何种类的保证，无论是明示或暗示的，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者均不应对因使用或其他涉及本软件或其任何部分而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他任何情况下。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm