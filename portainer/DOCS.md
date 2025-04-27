# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理 UI，它使您能够轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了关于 Docker 的详细概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，并几乎可以访问您的整个系统。虽然这个插件是在谨慎和安全的前提下创建和维护的，但在错误或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件是用于调试 Home Assistant 及其容器的。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽略这一点会使您的系统变得不受支持！

## 安装

要安装此插件，您首先需要进入您的个人资料并启用“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”并像安装其他插件一样安装它。

为了能够使用该插件，您需要禁用此插件的保护模式。没有它，插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装它。
2. 将“保护模式”开关设置为关闭。
3. 启动“Portainer”插件。
4. 检查“Portainer”插件的日志，以查看一切是否顺利。

## 配置

**注意**: _记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**: _这只是一个示例，请不要直接复制粘贴！请创建您自己的配置！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能非常有用。可能的值有：

- `trace`: 显示每一个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的例外情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 发生了严重错误。插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，除非您正在进行故障排除，否则推荐使用此设置。

### 选项: `agent_secret`

设置共享代理密钥的选项。还必须在远程代理中作为环境变量设置。

## 更新日志与版本

本存储库使用 [GitHub 的版本][releases] 功能来保持更新日志。

版本基于 [语义化版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择来获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [提出问题][issue] 到 GitHub。

## 作者与贡献者

本存储库的最初设置者是 [Franck Nijhof][frenck]。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及其相关文档文件（“软件”）副本的人，无限制地处理软件的权限，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许被提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

本软件按“原样”提供，不附有任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm