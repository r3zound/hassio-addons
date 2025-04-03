# Home Assistant Community Add-on: Portainer

Portainer 是一个开源的轻量级管理UI，允许您轻松管理Docker主机或Docker Swarm集群。

管理Docker从未如此简单。Portainer提供了Docker的详细概述，并允许您管理容器、镜像、网络和卷。

## 警告 1

Portainer附加组件功能强大，几乎可以访问您整个系统。尽管此附加组件是在安全考虑下精心创建和维护的，但在错误或缺乏经验的手中，可能会损坏您的系统。

## 警告 2

Portainer附加组件是用于调试Home Assistant及其容器的。它并不打算或设计用于管理或部署您的自定义软件或第三方容器。

**Home Assistant 不支持在 Home Assistant OS 或受监督安装类型上运行第三方容器**。忽视这一点，将使您的系统不受支持！

## 安装

要安装此附加组件，您首先需要去您的个人资料并开启“高级模式”。完成后，返回Home Assistant附加组件页面，搜索“Portainer”并像安装其他附加组件一样安装它。

要能够使用此附加组件，您需要禁用该附加组件的保护模式。没有它，附加组件将无法访问Docker。

1. 在Supervisor附加组件商店中搜索“Portainer”并安装它。
1. 将“保护模式”开关设置为关闭。
1. 启动“Portainer”附加组件。
1. 检查“Portainer”附加组件的日志以查看一切是否顺利。

## 配置

**注意**：_记得在更改配置时重新启动附加组件。_

附加组件配置示例：

```yaml
log_level: info
agent_secret: password
```

**注意**：_这只是示例，不要复制粘贴！自己创建！_

### 选项: `log_level`

`log_level`选项控制附加组件的日志输出级别，可以根据需要调整为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值为：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常事件。
- `error`：运行时错误，不需要立即处理。
- `fatal`：发生了严重错误，附加组件变得无法使用。

请注意，每个级别自动包含更高级别的日志消息，例如，`debug`也会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在排除故障。

### 选项: `agent_secret`

一个选项，用于设置共享代理密钥。还必须在远程代理中作为环境变量设置。

## 更新日志与发行版本

此存储库使用[GitHub的发行版本][releases]功能维护更新日志。

发行版本基于[语义版本控制][semver]，格式为`MAJOR.MINOR.PATCH`。简而言之，版本将根据以下情况递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]进行一般的Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子论坛][reddit]。

您也可以在[这里打开问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2018-2021 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）的个人免费使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本的权利，并允许提供该软件的人这样做，受到以下条件的限制：

上面的版权声明和本许可声明应包含在软件的所有副本或重要部分中。

本软件是按“原样”提供的，没有任何种类的明示或暗示的保证，包括但不限于适销性、特定用途的适用性和非侵权。在任何情况下，作者或版权持有者均不对因使用或其他交易中产生的索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[contributors]: https://github.com/hassio-addons/addon-portainer/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-portainer/68836?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-portainer/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-portainer/releases
[semver]: http://semver.org/spec/v2.0.0.htm