# Home Assistant Community Add-on: Portainer

Portainer 是一个开源轻量级管理界面，它允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，使您几乎能够访问整个系统。虽然这个插件是在安全性考虑下精心创建和维护的，但在错误或缺乏经验的操作下，它可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽略这一点，会使您的系统无法得到支持！

## 安装

要安装此插件，您首先需要进入个人资料并启用“高级模式”，完成后返回 Home Assistant 插件中搜索“Portainer”，并像安装其他插件一样进行安装。

要能够使用此插件，您需要禁用此插件上的保护模式。如果不这样做，插件将无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，查看一切是否正常。

## 配置

**注意**：_记得在更改配置时重启插件。_

插件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制粘贴！自己创建一个！_

### 选项：`log_level`

`log_level` 选项控制插件输出的日志级别，可以更改为更详细或更少详细，这在处理未知问题时可能很有用。可能的值有：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现了严重问题。插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`agent_secret`

设置共享代理秘密的选项。必须在远程代理中也作为环境变量设置。

## 更新日志与发布

本仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver] ，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您可以通过几种方式得到解答：

- 访问 [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取插件支持和功能请求。
- 访问 [Home Assistant Discord 聊天服务器][discord-ha] 进行 Home Assistant 的一般讨论和提问。
- 访问 Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您也可以在 [这里打开问题][issue] GitHub。

## 作者与贡献者

本仓库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人在软件中进行处理，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件的副本的权利，并允许向其提供软件的人执行上述操作，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，没有任何形式的明示或暗示保证，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有者对任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他情况下，由软件或其使用或其他交易引起。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm