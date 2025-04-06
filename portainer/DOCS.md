# Home Assistant社区插件：Portainer

Portainer 是一个开源的轻量级管理用户界面，它允许你轻松管理 Docker 主机或 Docker swarm 集群。

管理 Docker 从未如此简单。Portainer 提供了有关 Docker 的详细概览，并允许你管理容器、镜像、网络和卷。

## 警告 1

Portainer 插件功能强大，几乎可以让你访问整个系统。虽然此插件经过精心创建和维护，并考虑到安全性，但如果在错误或没有经验的手中，它可能会损坏你的系统。

## 警告 2

Portainer 插件旨在调试 Home Assistant 及其容器。它并不是为了管理或部署你的自定义软件或第三方容器而设计的。

**Home Assistant 不支持在 Home Assistant OS 或监督安装类型上运行第三方容器**。忽略这一点将使你的系统变为不受支持！

## 安装

要安装此插件，你首先需要进入你的个人资料并开启“高级模式”，完成后返回 Home Assistant 插件并搜索“Portainer”，然后按其他插件的方式安装它。

要能够使用此插件，你需要在此插件上禁用保护模式。没有它，插件无法访问 Docker。

1. 在 Supervisor 插件商店中搜索“Portainer”插件并安装。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”插件。
1. 检查“Portainer”插件的日志，查看一切是否正常。

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制粘贴！创建你自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每一个细节，如调用的所有内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常发生。
- `error`：运行时错误，不需要立即处理。
- `fatal`：出现了严重问题。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你正在进行故障排除。

### 选项：`agent_secret`

一个选项，用于设置共享代理密钥。还必须在远程代理中作为环境变量设置。

## 更新日志与版本

该仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容的或重大变更。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

你有几个选项来获得解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit]。
  
你也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理软件时不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，以及允许向其提供软件的人这样做，前提是遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件是按照“原样”提供的，没有任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人对因使用或其他交易中出现的任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他情况下。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors  
[discord-ha]: https://discord.gg/c5DvZ4e  
[discord]: https://discord.me/hassioaddons  
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck  
[frenck]: https://github.com/frenck  
[issue]: https://github.com/hassio-addons/addon-portainer/issues  
[reddit]: https://reddit.com/r/homeassistant  
[releases]: https://github.com/hassio-addons/addon-portainer/releases  
[semver]: http://semver.org/spec/v2.0.0.htm  