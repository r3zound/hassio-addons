# Home Assistant 社区附加组件：Portainer

Portainer 是一个开源的轻量级管理 UI，允许您轻松管理 Docker 主机或 Docker 群集。

管理 Docker 从未如此简单。Portainer 提供了对 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 附加组件是非常强大的，几乎可以访问您整个系统。尽管这个附加组件是在考虑安全的情况下精心创建和维护的，但在错误或缺乏经验的操作下，它可能会损坏您的系统。

## 警告 2

Portainer 附加组件旨在用于调试 Home Assistant 及其容器。它并不旨在或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant 操作系统或监督安装类型上运行第三方容器。** 忽略这一点，将使您的系统变得不受支持！

## 安装

要安装此附加组件，您首先需要去您的个人资料并开启“高级模式”，完成后返回到 Home Assistant 附加组件中并搜索“Portainer”，然后像其他任何附加组件一样进行安装。

要能够使用此附加组件，您需要禁用此附加组件上的保护模式。没有它，附加组件无法访问 Docker。

1. 在 Supervisor 附加组件商店中搜索“Portainer”附加组件并进行安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志，以查看是否一切正常。

## 配置

**注意**：_记得在更改配置时重新启动附加组件。_

示例附加组件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要直接复制粘贴！自己创建！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更多或更少的详细信息，这在您处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每一个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不错误的特殊情况。
- `error`：运行时错误，但不需要立即采取行动。
- `fatal`：出现了严重的问题。附加组件变得无法使用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是建议的设置，除非您在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。也必须在远程代理中作为环境变量设置。

## 更新日志与发布

本存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义化版本控制][semver]，并使用`MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下标准增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种方式可以获取解答：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提交问题][issue] 到 GitHub。

## 作者 & 贡献者

本存储库的最初设定由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，有限制地使用软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件的副本，并允许提供给软件的人员这样做，但必须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的重要部分中。

该软件是按“原样”提供的，没有任何形式的保证，无论是明示还是暗示，包括但不限于适销性、适合特定目的和不侵权的保证。在任何情况下，作者或版权持有人对因使用软件或其它交易的产生而引起的任何索赔、损害或其它责任不承担责任。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm