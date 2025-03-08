# Home Assistant 社区插件：AdGuard Home

[AdGuard Home][adguard] 是一个网络范围内的广告和跟踪器阻止 DNS 服务器，具有家长控制（成人内容阻止）功能。其目的是让您控制整个网络和所有设备，并且不需要使用客户端程序。

AdGuard Home 提供了一个美观、易于使用且功能丰富的 Web 界面，以便轻松管理过滤过程及其设置。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. **确保您的 Home Assistant 设备具有
   [静态 IP 和静态外部 DNS 服务器！](https://github.com/home-assistant/operating-system/blob/dev/Documentation/network.md#static-ip)**
   这很重要！如果跳过此步骤，您**将**遇到问题。
   - 在网络中更改此设置：
     [![打开您的 Home Assistant 实例并管理您的系统网络配置。](https://my.home-assistant.io/badges/network.svg)](https://my.home-assistant.io/redirect/network/)
     （_设置 → 系统 → 网络 → 配置网络接口 → 您的接口 → IPv4 → 静态_）
   - 请注意，在路由器中设置固定 IP 并不**等于**静态。
2. 点击下面的 Home Assistant 我的按钮在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

3. 点击“安装”按钮以安装插件。
4. 启动“AdGuard Home”插件。
5. 检查“AdGuard Home”的日志，查看一切是否顺利。
6. 点击“打开 Web UI”按钮，并使用您的 Home Assistant 账户登录。
7. 准备就绪！

## 配置

**注意**：_配置更改时，请记得重启插件。_

插件配置示例：

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更多或更少的详细信息，当您处理一个未知问题时，这可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在故障排除。

### 选项：`ssl`

启用/禁用插件上的 SSL（HTTPS）。设置为 `true` 以启用它，设置为 `false` 则禁用。

**注意**：_SSL 设置仅适用于直接访问，对 Ingress 服务没有影响。_

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项：`leave_front_door_open`

将此选项添加到插件配置中，允许您通过将其设置为 `true` 来禁用 AdGuard Home 的身份验证。

**注意**：_我们强烈建议不要使用此选项，即使此插件仅暴露于您的内部网络。请自行承担风险！_

## 加密设置（高级使用）

AdGuard 允许配置本地运行的 DNS-over-HTTPS 和 DNS-over-TLS。如果您配置了这些选项，请确保在之后重启插件。此外，要正确使用 DNS-over-HTTPS，请确保在插件和 AdGuard 本身中都配置 SSL。还要考虑插件和 AdGuard 不能使用相同的端口进行 SSL。

## 更新日志与发布

本仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下条件进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几个选项可以获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 进行插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [提交问题][issue] GitHub。

## 作者及贡献者

本仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Franck Nijhof

在此特此免费授予任何获得本软件及相关文档文件（"软件"）副本的人，使用软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本以及允许提供软件的人这样做，不受任何限制，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

本软件是按 "原样" 提供的，没有任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他情况下。

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