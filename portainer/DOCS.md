# Home Assistant 社区附加组件：Portainer

Portainer 是一个开源轻量级管理 UI，允许您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 附加组件非常强大，可以让您访问几乎整个系统。虽然这个附加组件是经过仔细设计和维护，并考虑到安全性，但在错误或缺乏经验的用户手中，它可能会损害您的系统。

## 警告 2

Portainer 附加组件旨在调试 Home Assistant 及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点将使您的系统处于不受支持状态！

## 安装

要安装此附加组件，您需要先进入您的个人资料并启用“高级模式”，完成后返回 Home Assistant 附加组件页面，搜索“Portainer”并像安装其他附加组件一样安装它。

要使用此附加组件，您需要禁用此附加组件的保护模式。没有它，附加组件将无法访问 Docker。

1. 在 Supervisor 附加组件商店中搜索“Portainer”附加组件并安装。
2. 将“保护模式”开关设置为关闭。
3. 启动“Portainer”附加组件。
4. 检查“Portainer”附加组件的日志以查看一切是否顺利。

## 配置

**注意**：_记得在更改配置时重新启动附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制粘贴！创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以根据需要更改为更详细或更简略，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每一个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：非错误的异常事件。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现了严重问题，附加组件变得无法使用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug` 级别也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您正在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。必须在远程代理中作为环境变量设置。

## 更新日志和版本

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义化版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本根据以下情况递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的修复和包更新。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 的讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit] 上。

您也可以在此处 [打开一个问题][issue] 在 GitHub 上。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，使用该软件而不受限制的权限，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件副本的权利，并允许被提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有副本或软件的重要部分中。

该软件是“按原样”提供的，不提供任何形式的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人对因使用本软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm