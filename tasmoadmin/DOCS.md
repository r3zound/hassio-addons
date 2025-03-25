# Home Assistant 社区插件: TasmoAdmin

TasmoAdmin（前称 SonWEB）是一个管理 Sonoff-Tasmota 刷写设备的管理网页接口，能够集中管理所有设备。
它的一些功能包括：

- 自动扫描您的网络并添加设备
- 快速轻松查看所有设备的状态
- 从一个地方配置所有设备
- 一次性向一个或多个设备发送固件更新
- 可以为您自动下载最新的固件

## 安装

此插件的安装相当简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下方的 Home Assistant 我的按钮，打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 启动“TasmoAdmin”插件。
4. 检查“TasmoAdmin”插件的日志以确认一切正常。

## 配置

**注意**: _记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**: _这只是一个示例，请勿复制和粘贴！请创建您自己的配置！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可用值包括：

- `trace`: 显示每个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的特殊情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现了严重问题，插件变得不可用。

请注意，每个级别会自动包括更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排查故障。

### 选项: `ssl`

启用/禁用 TasmoAdmin 面板的 SSL（HTTPS）。设置为 `true` 启用，设置为 `false` 禁用。

**注意**: Tasmota 不支持通过 SSL 进行 OTA 更新。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**: _文件必须存储在 `/ssl/` 目录下，这是默认路径。_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**: _文件必须存储在 `/ssl/` 目录下，这是默认路径。_

## 更新日志及版本

该存储库使用 [GitHub 的版本][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下规则递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强功能。
- `PATCH`: 向后兼容的修复和包更新。

## 支持

有问题吗？

您可以通过以下几种方式获得解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 社区][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [提交问题][issue] 到 GitHub。

## 作者及贡献者

该存储库的最初设置者是 [Franck Nijhof][frenck]。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授权任何获取本软件及相关文档文件（“软件”）副本的人，不受限制地处理本软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，并允许被授予本软件的人这样做，附带以下条件：

上述版权声明和本许可证声明应包含在本软件的所有副本或重要部分中。

本软件是“按原样”提供的，不提供任何类型的担保，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人对于因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任不承担任何责任，无论是在合同诉讼、侵权或其他方面。

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