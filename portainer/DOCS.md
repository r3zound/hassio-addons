# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理 UI，允许您轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 变得前所未有的简单。Portainer 提供了 Docker 的详细概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件功能强大，几乎可以访问您整个系统。虽然这个插件是经过仔细创建和维护的，并考虑了安全性，但在错误或缺乏经验的用户手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不意味着或设计用于管理或部署您自定义的软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或受监督安装类型上运行第三方容器。** 忽视这一点会使您的系统变得不受支持！

## 安装

要安装此插件，您首先需要转到您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件页面，搜索“Portainer”，并像安装其他插件一样进行安装。

要能够使用此插件，您需要禁用该插件的保护模式。没有它，插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，查看一切是否顺利。

## 配置

**注意**：_记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制插件输出的日志级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常发生，但并非错误。
- `error`：运行时错误，但不需要立即处理。
- `fatal`：出现严重问题。插件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您在故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。还必须在远程代理中作为环境变量设置。

## 更新日志与发布

此仓库使用 [GitHub 的发布][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，并使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 社区][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

此仓库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，以完全不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件的副本，并允许向本软件提供的人员这样做，前提是遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

本软件是按照“原样”提供的，没有任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或其任何部分而导致的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm