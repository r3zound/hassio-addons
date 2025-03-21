# Home Assistant 社区插件：AdGuard Home

[AdGuard Home][adguard] 是一个网络范围内的广告和跟踪器阻止 DNS 服务器，具有家长控制（成人内容阻止）功能。它的目的是让您控制整个网络和所有设备，并且不需要使用客户端程序。

AdGuard Home 提供了一个美观、简单且功能丰富的网页界面，方便您轻松管理过滤过程及其设置。

## 安装

安装此插件相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. **确保您的 Home Assistant 设备具有
   [静态 IP 和静态外部 DNS 服务器！](https://github.com/home-assistant/operating-system/blob/dev/Documentation/network.md#static-ip)**
   这很重要！如果您跳过此步骤，您 **将** 遇到问题。
   - 在网络中更改此设置：
     [![打开您的 Home Assistant 实例并管理您的系统网络配置。](https://my.home-assistant.io/badges/network.svg)](https://my.home-assistant.io/redirect/network/)
     （_设置 → 系统 → 网络 → 配置网络接口 → 您的接口 → IPv4 → 静态_）
   - 请注意，在路由器中设置固定 IP 并 **不是** 静态的。
1. 点击下面的 Home Assistant 我的按钮，在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“AdGuard Home”插件。
1. 检查“AdGuard Home”的日志，确认一切正常。
1. 点击“打开网页界面”按钮，并使用您的 Home Assistant 账户登录。
1. 准备就绪！

## 配置

**注意**：_记得在更改配置时重启插件。_

示例插件配置：

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请勿直接复制粘贴！请创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁的模式，这在处理未知问题时可能会有所帮助。可能的值有：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现严重错误，插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您正在排除故障。

### 选项：`ssl`

启用/禁用插件的 SSL（HTTPS）。设置为 `true` 以启用，设置为 `false` 以禁用。

**注意**：_SSL 设置仅适用于直接访问，对 Ingress 服务没有影响。_

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置。_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置。_

### 选项：`leave_front_door_open`

在插件配置中添加此选项允许您通过将其设置为 `true` 来禁用 AdGuard Home 的身份验证。

**注意**：_我们强烈建议不要使用此选项，即使该插件仅暴露于您的内部网络。请自担风险！_

## 加密设置（高级使用）

Adguard 允许配置在本地运行的 DNS-over-HTTPS 和 DNS-over-TLS。如果您配置了这些选项，请确保之后重启插件。此外，为了正确使用 DNS-over-HTTPS，请确保在插件及 Adguard 本身上配置 SSL。同时请考虑，插件和 Adguard 不能使用同一端口进行 SSL。

## 变更日志与发布

该存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将基于以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种获取答案的方式：

- 访问 [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- 访问 [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- 在 Home Assistant [社区论坛][forum] 发帖。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您还可以 [在此打开问题][issue] GitHub。

## 作者与贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2019-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，未经限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可、和/或销售软件副本，并允许提供该软件的人这样做，须遵守以下条件：

上述版权声明与本许可声明须包含在软件的所有副本或实质性部分中。

该软件“按原样”提供，不附任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_adguard&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[adguard]: https://adguard.com/adguard-home/overview.html
[contributors]: https://github.com/hassio-addons/addon-adguard-home/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-adguard-home/90684?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-adguard-home/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-adguard-home/releases
[semver]: https://semver.org/spec/v2.0.0.html