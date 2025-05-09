# Home Assistant Community Add-on: Portainer

Portainer 是一个开源轻量级管理 UI，允许您
轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细
概述，并允许您管理容器、镜像、网络和
卷。

## 警告 1

Portainer 插件非常强大，可以让您几乎访问整个系统。虽然这个插件是经过精心创建和维护的，并考虑到安全性，但在错误或缺乏经验的手中，
它可能会损害您的系统。

## 警告 2

Portainer 插件旨在用于调试 Home Assistant 及其容器。
它并不打算或设计用于管理或部署您的自定义软件
或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点，会使您的系统变得不受支持！

## 安装

要安装此插件，您首先需要转到您的个人资料并开启
“高级模式”，完成后返回到 Home Assistant 插件中，搜索
“Portainer”并像安装其他插件一样安装它。

要能使用此插件，您需要在此插件上禁用保护模式。
否则插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索 “Portainer” 插件并
   安装它。
1. 将 “保护模式” 开关设置为关闭。
1. 启动 “Portainer” 插件。
1. 检查 “Portainer” 插件的日志以查看一切是否顺利。

## 配置

**注意**：_记得在配置更改时重新启动此插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请勿复制粘贴！请创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以
更改为更详细或更简洁，这在处理未知问题时可能很有用。可能的值包括：

- `trace`：显示每个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的特殊事件。
- `error`：无需立即采取行动的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，
`log_level` 设置为 `info`，这是推荐的设置，除非
您正在进行故障排除。

### 选项: `agent_secret`

一个选项，用于设置共享代理密钥。也必须在远程代理中
作为环境变量设置。

## 更新日志与版本

此存储库使用 [GitHub 的发布][releases]
功能保持更新日志。

发布基于 [语义版本控制][semver]，使用
`MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，用于插件
  支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般的 Home
  Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [提出问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 提供。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

在此特此授予任何获得该软件及其相关文档文件（“软件”）副本的人员无偿的权利，允许其不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许提供该软件的人这样做，但须遵守以下条款：

上述版权声明及本许可证声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不提供任何种类的担保，无论明示或暗示，包括但不限于适销性、特定用途适用性和不侵权。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权诉讼还是其他方式。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm