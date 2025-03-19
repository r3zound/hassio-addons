# Home Assistant Community Add-on: Portainer

Portainer 是一个开源轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，几乎可以让您访问整个系统。虽然此插件是在安全考虑下小心创建和维护的，但在错误或缺乏经验的手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件用于调试 Home Assistant 及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器。** 忽视这一点会使您的系统变得不受支持！

## 安装

要安装此插件，您首先需要进入您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”并像安装其他插件一样进行安装。

为了能够使用此插件，您需要禁用此插件的保护模式。没有它，插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
2. 将“保护模式”开关设置为关闭。
3. 启动“Portainer”插件。
4. 检查“Portainer”插件的日志以查看是否一切正常。

## 配置

**注意**: _记得在更改配置时重新启动插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**: _这只是一个示例，别复制粘贴！创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改以获得更多或更少的详细信息，这在处理未知问题时可能很有用。可能的值包括：

- `trace`: 显示每个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的异常情况。
- `error`: 运行时错误，不需要立即采取行动。
- `fatal`: 出现了严重问题。插件变得不可用。

请注意，每个级别自动包括更高严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项: `agent_secret`

设置共享代理密钥的选项。也必须在远程代理中作为环境变量设置。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能保持更新日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大变化。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择来获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以 [在这里提出问题][issue] GitHub。

## 作者与贡献者

此存储库的原始设置由 [Franck Nijhof][frenck] 创建。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予获得此软件及相关文档文件（以下简称“软件”）副本的任何人，限制不受限制，包括使用、复制、修改、合并、发布、分发、再授权和 / 或销售软件副本的权利，并允许提供软件的人这样做，但需遵守以下条件：

上述版权声明和本许可证声明应包含在所有副本或软件的重大部分中。

软件是按“原样”提供的，没有任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人对此软件或在软件使用或其他交互中产生的任何索赔、损害或其他责任，不论是合同诉讼、侵权诉讼或其他，均不承担责任。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm