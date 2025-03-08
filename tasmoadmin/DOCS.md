# Home Assistant 社区附加组件：TasmoAdmin

TasmoAdmin（前称 SonWEB）是一个用于集中管理所有 Sonoff-Tasmota 刷写设备的管理网页界面。
它的一些功能：

- 扫描您的网络并自动添加设备
- 快速轻松查看所有设备的状态
- 从一个地方配置所有设备
- 可以一次性通过无线方式向一个或多个设备发送固件更新
- 可以为您自动下载最新的固件

## 安装

此附加组件的安装非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮安装该附加组件。
1. 启动“ TasmoAdmin”附加组件。
1. 检查“ TasmoAdmin”附加组件的日志，查看是否一切顺利。

## 配置

**注意**：_请记住在更改配置后重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会有用。可能的值有：

- `trace`：显示每一个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包括来自更高级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`ssl`

在 TasmoAdmin 面板的网页界面上启用/禁用 SSL（HTTPS）。设置为 `true` 启用，`false` 则禁用。

**注意** Tasmota 不支持通过 SSL 进行 OTA

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置_

## 更新日志和发布

该库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多个选项来获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] [/r/homeassistant][reddit]

您也可以在 [这里提出问题][issue] GitHub。

## 作者及贡献者

这个库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权（c）2018-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件副本的权利，并允许向其提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可证声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，没有任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有者都不对由于软件或软件的使用或其他交易而导致的任何索赔、损害或其他责任承担责任，无论是合同、侵权还是其他。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sonweb&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-tasmoadmin/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tasmoadmin/54155?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-tasmoadmin/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-tasmoadmin/releases
[semver]: http://semver.org/spec/v2.0.0.html