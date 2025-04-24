# Home Assistant 社区插件：Portainer

Portainer 是一个开源的轻量级管理 UI，它可以让您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，几乎可以访问您的整个系统。虽然这个插件是在仔细考虑和注重安全性下创建和维护的，但在错误或经验不足的手中，它可能会损害您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并非旨在或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或受监督安装类型上运行第三方容器。** 忽略这一点，将使您的系统无法获得支持！

## 安装

要安装此插件，您需要先访问您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，并像安装其他插件一样进行安装。

要能够使用此插件，您需要在此插件上禁用保护模式。没有这个，插件将无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并进行安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，以查看一切是否顺利。

## 配置

**注意**：_当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制和粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，可能在您处理未知问题时非常有用。可能的值为：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的异常情况。
- `error`：运行时错误，不需要立即采取措施。
- `fatal`：出现了严重问题。插件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是一种推荐的设置，除非您在排查故障。

### 选项：`agent_secret`

设置共享代理秘密的选项。也必须作为环境变量在远程代理中设置。

## 更新日志与版本发布

该存储库使用 [GitHub 的发布][releases] 功能保持更新日志。

版本发布基于 [语义版本控制][semver]，采用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本会根据以下标准进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 关于 [/r/homeassistant][reddit] 的讨论。

您也可以 [在这里提交问题][issue] 到 GitHub。

## 作者与贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授权任何获得本软件及其相关文档文件（“软件”）副本的个人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许提供本软件的人员这样做，但须遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

本软件是“按原样”提供的，不做任何形式的明示或暗示的担保，包括但不限于适销性、特定用途适合性及不侵权。无论在合同、侵权或其他方面，作者或版权持有者均不对因本软件或其使用或其他交易而引起的任何索赔、损害或其他责任承担责任。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm