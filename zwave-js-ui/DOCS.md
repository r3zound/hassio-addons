# Home Assistant 社区插件: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，允许您配置 Z-Wave 网络的每个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（由 Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络在 Home Assistant 重启期间将保持运行。
- 您可以直接使用类似 Node-RED 的工具与您的 Z-Wave 网络配合使用，同时它也可供 Home Assistant 使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协作。
- 当找到 Mosquitto 插件时，它会自动进行预配置。

该插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面 Home Assistant 我的按钮，以便在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 检查“Z-Wave JS UI”插件的日志，查看是否一切正常。
4. 点击“打开 WEB UI”按钮。
5. 享受该插件吧！

**注意**：上游项目有关于如何使用软件的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，该插件提供了一个插件 UI，并有能力通过 MQTT 发送/接收数据。因此，如果您需要这个功能，可能这个插件适合您。

成功启动插件后，接下来是将其与 Home Assistant 连接。

要做到这一点：

1. 通过点击 Supervisor 中插件页面的“打开 WEB UI”按钮打开 Z-Wave JS UI 控制面板。
2. 在控制面板中，转到菜单中的“设置”，然后点击右侧显示的“Zwave”栏。
3. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮并导航到菜单中的“控制面板”。如果您之前已配对设备，您应该能逐渐看到它们显示出来。

现在是时候设置 Home Assistant 了：

1. 转到设置面板并点击“设备与服务”。
2. 在右下角，点击“+ 添加集成”。
3. 从列表中选择“Z-Wave”集成。
4. 会弹出一个对话框，询问是否使用该插件：
   - **取消选中**该框，它将安装官方插件。
   - 再次说明，推荐使用官方插件，所以...
5. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
6. 确认，完成！

## 配置

**注意**：_记得在更改配置后重启插件。_

插件配置示例：

```yaml
log_level: info
```

### 选项: `log_level`

`log_level` 选项控制插件输出的日志级别，可以更改为更多或更少的详细信息，这在您处理未知问题时可能会很有用。可能的值有：

- `trace`: 显示每个细节，比如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常的（通常）有趣事件。
- `warning`: 不属于错误的特殊事件。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更高级别的日志消息，例如，`debug` 级别也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排查故障。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现功能。**强烈**建议**不要**使用该选项。请使用上述文档中的 Z-Wave JS 集成。

## 更新日志与版本

该库使用 [GitHub 的版本][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver] ，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将基于以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的bug修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地使用软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本的权利，并允许向其提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

本软件是按“原样”提供的，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者都不对因使用软件或其他交易引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他法律行动中。

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