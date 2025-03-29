# Home Assistant 社区附加组件：Z-Wave JS UI

Z-Wave JS UI 附加组件提供了一个额外的控制面板，使您可以配置 Z-Wave 网络的每个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成所使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 在 Home Assistant 重启之间，您的 Z-Wave 网络将继续运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络互动，同时它也可供 Home Assistant 使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络一起工作。
- 与发现的 Mosquitto 附加组件自动预配置。

此附加组件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此附加组件非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 检查“Z-Wave JS UI”附加组件的日志以查看一切是否顺利。
1. 点击“打开网页 UI”按钮。
1. 享受该附加组件！

**注意**：上游项目有使用软件本身的文档：  
<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方附加组件商店设置官方的“Z-Wave JS”附加组件。

然而，此附加组件将提供附加组件 UI，并具有通过 MQTT 发送/接收数据的能力。因此，如果这是您想要的，这个附加组件可能适合您。

在成功启动附加组件后，是时候将其连接到 Home Assistant。

要做到这一点：

1. 通过点击附加组件页面上的“打开网页 UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，并单击右侧显示的“Zwave”栏。
1. 输入以下信息：
   - 串行端口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮，导航到菜单中的“控制面板”。如果您已经配对了设备，您应该会看到它们慢慢显示出来。

现在是时候设置 Home Assistant：

1. 转到设置面板并点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 会弹出一个对话框，询问是否使用附加组件：
   - **取消选中**该框，它将安装官方附加组件。
   - 再次推荐使用官方附加组件，所以...
1. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认并完成！

## 配置

**注意**：_记得在更改配置后重新启动附加组件。_

附加组件配置示例：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的特殊事件。
- `error`：运行时错误，无需立即采取行动。
- `fatal`：发生了严重错误。附加组件无法使用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持 Home Assistant 通过 MQTT 发现。**强烈**建议**不要**使用此选项。请使用上面文档中说明的 Z-Wave JS 集成。

## 更新日志与版本

此存储库使用 [GitHub 的发布][releases] 功能维护更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以获得解答：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于 Home Assistant 的一般讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子板][reddit] 在 [/r/homeassistant][reddit]

您还可以在此处 [创建一个问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人，无限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可及/或出售软件副本的权利，并允许向其提供软件的人以这些条件进行处置：

上述版权声明和本许可声明应包含在所有副本或实质性部分的的软件中。

本软件按“原样”提供，不提供任何形式的保证，明示或暗示，包括但不限于对适销性、适合特定用途和非侵犯的保证。在任何情况下，作者或版权持有者均不对因使用本软件或其他交易而导致的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

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