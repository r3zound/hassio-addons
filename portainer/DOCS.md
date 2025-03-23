# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理界面，允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件功能强大，几乎可以访问您整个系统。虽然该插件是在安全的前提下小心创建和维护的，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或受管安装类型上运行第三方容器。** 忽略这一点会使您的系统处于不受支持的状态！

## 安装

要安装此插件，您需要先转到您的个人资料并启用“高级模式”。完成后，返回 Home Assistant 插件，搜索“Portainer”，并像安装其他任何插件一样安装它。

要能够使用此插件，您需要禁用该插件上的保护模式。没有它，插件无法访问 Docker。

1. 在主管插件商店中搜索“Portainer”插件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志以查看一切是否顺利。

## 配置

**注意**：_在更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更多或更少的详细信息，当您处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每一个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常事件。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 出现严重错误，插件变得不可用。

请注意，每个级别会自动包括来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。在远程代理中也必须将其设置为环境变量。

## 更新日志与发布

此仓库使用 [GitHub 的 releases][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下原则递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您可以通过多种方式获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以获取一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提出问题][issue] GitHub。

## 作者与贡献者

本仓库的原始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，无限制地处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许提供软件的人这样做，条件如下：

上述版权声明和本授权声明应包含在所有软件副本或实质性部分中。

软件是“按原样”提供的，未作任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有者均不对因使用软件或其他交易所引发的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm