# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理用户界面，允许您轻松管理 Docker 主机或 Docker 集群。

管理 Docker 从未如此简单。Portainer 提供了 Docker 的详细概览，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件非常强大，几乎可以让您访问整个系统。尽管该插件的创建和维护都非常谨慎，并且考虑了安全性，但在错误或缺乏经验的用户手中，它可能会损坏您的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不是为了管理或部署您的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽视这一点会使您的系统无法得到支持！

## 安装

要安装此插件，您首先需要进入您的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，像安装其他插件一样进行安装。

为了能够使用此插件，您需要在此插件上禁用保护模式。没有它，插件将无法访问 Docker。

1. 在管理器插件商店中搜索“Portainer”插件并安装它。
2. 将“保护模式”开关设置为关闭。
3. 启动“Portainer”插件。
4. 检查“Portainer”插件的日志以确认一切正常。

## 配置

**注意**：_更改配置时记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更多或更少的详细信息，当您处理未知问题时，这可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常是）有趣的事件。
- `warning`：非常规事件，但不是错误。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现严重错误，插件变得无法使用。

请注意，每个级别自动包含来自更高级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。必须在远程代理中也作为环境变量设置。

## 更新日志和版本

该存储库使用 [GitHub 的版本][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题吗？

您可以通过以下几种方式获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，提供插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [GitHub 上提交问题][issue]。

## 作者和贡献者

该存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整名单，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理该软件而不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件副本的权利，并允许提供此软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

本软件按“原样”提供，没有任何种类的担保，明示或暗示，包括但不限于适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用、软件或其他交易中的软件而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm