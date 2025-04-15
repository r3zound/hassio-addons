# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，允许你配置 Z-Wave 网络的每一个方面。它提供了一个解耦的网关，可以通过 Z-Wave JS WebSockets (Home Assistant Z-Wave JS 集成使用) 和 MQTT (甚至可以同时使用) 进行通信。

一些优势和使用案例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 在 Home Assistant 重启之间，您的 Z-Wave 网络将继续运行。
- 您可以直接使用 Node-RED 等工具与 Z-Wave 网络进行交互，同时它对 Home Assistant 也可用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络一起工作。
- 在找到时自动与 Mosquitto 插件预配置。

此插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 检查“Z-Wave JS UI”插件的日志，看看一切是否正常。
1. 点击“打开 Web UI”按钮。
1. 享受这个插件！

**注意**：上游项目有关于如何使用软件本身的文档： <https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，此插件将提供一个插件 UI，并且能够通过 MQTT 发送/接收数据。所以，如果这是您所需要的，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接起来了。

为此：

1. 点击插件页面中的“打开 Web UI”按钮，打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，并点击右侧出现的“Zwave”选项卡。
1. 输入以下信息：
   - 串口 (例如, `/dev/serial/by-id/usb-0658_0200_if00`)
   - 网络密钥 (例如, `2232666D100F795E5BB17F0A1BB7A146`)

现在点击“保存”按钮，然后导航到菜单中的“控制面板”。如果您已经配对了设备，您应该会看到设备慢慢出现。

现在是设置 Home Assistant 的时候了：

1. 转到设置面板，点击“设备和服务”。
1. 在右下角，点击“+ 添加集成”。
1. 在列表中选择“Z-Wave”集成。
1. 将显示对话框，请求使用插件：
   - **取消勾选**该框，它将安装官方插件。
   - 同样，推荐使用官方插件，所以...
1. 在下一个对话框中它会询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认并完成！

## 配置

**注意**：_更改配置后请记得重启插件。_

示例插件配置：

```yaml
log_level: info
```

### 选项： `log_level`

`log_level` 选项控制插件输出日志的级别，可以更改为更详细或更简略，这在处理未知问题时可能非常有用。可能的值包括：

- `trace`: 显示每一个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 普通（通常）有趣的事件。
- `warning`: 不是错误的特殊情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 发生了严重错误。插件无法使用。

请注意，每个级别自动包括更高一级别的日志信息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 进行 Home Assistant 发现。**强烈**建议**不**使用该选项。请使用上述文档中说明的 Z-Wave JS 集成。

## 更新日志及发布

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题？

您有几种方式可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子板块][reddit]

您还可以在此 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，允许在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本，允许向其提供软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不作任何种类的保证，无论是明示还是暗示，包括但不限于适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权所有者均不对因使用或其他交易所产生的任何索赔、损害或其他责任负责，无论是合同、侵权或其他行为。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_zwavejs2mqtt&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-zwave-js-ui/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[esphome]: https://esphome.io/components/mqtt.html#on-message-trigger
[forum-shield]: https://img.shields.io/badge/community-forum-brightgreen.svg
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-zwave-js-ui/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-zwave-js-ui/releases
[semver]: https://semver.org/spec/v2.0.0.html
[zwave-js-ui]: https://github.com/zwave-js/zwave-js-ui