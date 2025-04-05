# Home Assistant 社区附加组件：Portainer

Portainer 是一个开源轻量级管理 UI，允许您
轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细
概览，并允许您管理容器、映像、网络和卷。

## 警告 1

Portainer 附加组件非常强大，几乎可以让您访问
整个系统。虽然这个附加组件经过精心创建和维护，并考虑到了安全性，但在错误或缺乏经验的操作下，
可能会损坏您的系统。

## 警告 2

Portainer 附加组件旨在调试 Home Assistant 及其容器。
它并不适合或设计用于管理或部署您的自定义软件
或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器。**
忽视这一点将使您的系统变为不受支持!

## 安装

要安装此附加组件，您首先需要转到您的个人资料并开启
“高级模式”，完成后返回 Home Assistant 附加组件，搜索
“Portainer”并像安装其他附加组件一样安装它。

要能够使用此附加组件，您需要禁用此
附加组件上的保护模式。没有它，附加组件无法访问 Docker。

1. 在 Supervisor 附加组件商店中搜索“Portainer”附加组件并
   安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志，以查看一切是否顺利进行。

## 配置

**注意**：_记得在更改配置时重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要直接复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以
根据需要更改为更详细或更简略，这在您面对未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常事件。
- `error`：运行时错误，无需立即采取行动。
- `fatal`：发生了严重错误，附加组件变得不可用。

请注意，每个级别自动包含更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，
`log_level` 设置为 `info`，这是推荐的设置，除非
您正在进行故障排除。

### 选项：`agent_secret`

用于设置共享代理机密的选项。在远程代理中也必须设置为环境变量。

## 更新日志和发布

该仓库使用 [GitHub 的 releases][releases]
功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用格式
`MAJOR.MINOR.PATCH`。简而言之，版本将根据以下规则递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有多种方式获得答案：

- Home Assistant 社区附加组件 Discord 聊天服务器 [discord] 以获取附加组件支持和功能请求。
- Home Assistant Discord 聊天服务器 [discord-ha] 以进行常规 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [打开一个问题][issue] 在 GitHub 上。

## 作者和贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获取此软件及相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许提供该软件的人这样做，需遵守以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或大量部分中。

该软件按“原样”提供，不提供任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易而导致的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm