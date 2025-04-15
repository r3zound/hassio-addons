# Home Assistant Community Add-on: AdGuard Home

[AdGuard Home][adguard] 是一个网络范围内的广告和跟踪阻止 DNS 服务器，具有家长控制（成人内容阻止）功能。其目的是让您控制整个网络和所有设备，并且不需要使用客户端程序。

AdGuard Home 提供了一个美观、易用且功能丰富的Web界面，以便轻松管理过滤过程及其设置。

## 安装

安装此附加组件相当简单，与安装任何其他 Home Assistant 附加组件没有太大区别。

1. **确保你的 Home Assistant 设备具有
   [静态 IP 和静态外部 DNS 服务器！](https://github.com/home-assistant/operating-system/blob/dev/Documentation/network.md#static-ip)**
   这点非常重要！如果跳过此步骤，您**将会**遇到问题。
   - 在网络中更改此设置：
     [![打开您的 Home Assistant 实例并管理系统的网络配置。](https://my.home-assistant.io/badges/network.svg)](https://my.home-assistant.io/redirect/network/)
     (_设置 → 系统 → 网络 → 配置网络接口 → 您的接口 → IPv4 → 静态_)
   - 请注意，在路由器中设置固定 IP 并不是 **静态**。
1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例上打开附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“AdGuard Home”附加组件。
1. 检查“AdGuard Home”的日志以查看一切是否顺利。
1. 点击“打开 Web UI”按钮并使用您的 Home Assistant 账户登录。
1. 准备就绪！

## 配置

**注意**：_请记得在更改配置时重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请勿复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，在处理未知问题时可能会有用。可用值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的特殊情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现严重错误。附加组件变得无法使用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项：`ssl`

启用/禁用附加组件的 SSL (HTTPS)。将其设置为 `true` 以启用，反之则为 `false`。

**注意**：_SSL 设置仅适用于直接访问，对 Ingress 服务没有影响。_

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/`，这是默认位置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/`，这是默认位置_

### 选项：`leave_front_door_open`

在附加组件配置中添加此选项允许您通过将其设置为 `true` 禁用 AdGuard Home 的身份验证。

**注意**：_我们强烈建议不要使用此选项，即使此附加组件仅暴露在您的内部网络中。使用风险自负！_

## 加密设置（高级用法）

Adguard 允许配置在本地运行 DNS-over-HTTPS 和 DNS-over-TLS。如果您配置这些选项，请确保在之后重新启动附加组件。另外，要正确使用 DNS-over-HTTPS，请确保在附加组件以及 Adguard 本身中都配置 SSL。此外，请考虑附加组件和 Adguard 不能使用相同端口用于 SSL。

## 更新日志与发布

该库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您可以通过几种方式获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [开一个 issue][issue] GitHub。

## 作者与贡献者

该库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Franck Nijhof

在此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在该软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不提供任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任负责，无论是基于合同、侵权或其他原因。

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