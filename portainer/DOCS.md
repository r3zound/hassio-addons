# Home Assistant Community Add-on: Portainer

Portainer是一个开源轻量级管理UI，它允许您轻松管理Docker主机或Docker swarm集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer附加组件非常强大，几乎可以访问您的整个系统。虽然此附加组件是经过小心创建和维护的，并考虑到了安全性，但在错误或缺乏经验的手中，可能会对您的系统造成损害。

## 警告 2

Portainer附加组件旨在调试Home Assistant及其容器。它并不旨在或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant不支持在Home Assistant操作系统或监督安装类型上运行第三方容器。** 忽视这一点将使您的系统不受支持！

## 安装

要安装此附加组件，您首先需要进入您的个人资料并开启“高级模式”，完成后返回Home Assistant附加组件，搜索“Portainer”并像安装其他附加组件一样安装它。

要能够使用此附加组件，您需要禁用该附加组件的保护模式。没有它，附加组件无法访问Docker。

1. 在监督附加组件商店中搜索“Portainer”附加组件并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志，以查看一切是否顺利。

## 配置

**注意**：_更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的配置！_

### 选项：`log_level`

`log_level`选项控制附加组件的日志输出级别，可以更改为更详细或更少详细的输出，当您处理未知问题时，这可能会很有用。可能的值包括：

- `trace`：显示每个细节，比如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的例外情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现了严重的错误，附加组件变为不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug`也会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`agent_secret`

设置共享代理密钥的选项。也必须在远程代理中作为环境变量设置。

## 更新记录与版本

该仓库使用[GitHub的发布][releases]功能维护变更记录。

发布版本基于[语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几个选项可以获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取附加组件的支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子版块][reddit]。

您也可以在这里[提交问题][issue]到GitHub。

## 作者与贡献者

该仓库的最初设置由[Franck Nijhof][frenck]完成。

要查看所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授权，任何获得该软件及相关文档文件（“软件”）副本的人，均可免费使用该软件，无限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可及/或销售该软件副本的权利，并允许向其提供该软件的人这样做，符合以下条件：

以上版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，没有任何种类的明示或暗示的保证，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权诉讼或其他诉讼中，由于使用该软件或与该软件的使用或其他交易相关的任何方式而引起的。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm