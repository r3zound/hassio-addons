# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，允许您配置 Z-Wave 网络的各个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（由 Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间持续运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络，而同时也可以在 Home Assistant 中使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协作。
- 当找到时，它会预先配置为使用 Mosquitto 插件。

此插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮来安装插件。
1. 检查“Z-Wave JS UI”插件的日志，以查看一切是否顺利。
1. 点击“打开网页 UI”按钮。
1. 享受插件吧！

**注意**：上游项目有关于使用该软件的文档：
<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成会尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，此插件将提供一个插件 UI，并具有通过 MQTT 发送/接收数据的能力。因此，如果您对此感兴趣，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接。

为此：

1. 通过点击 Supervisor 插件页面上的“打开网页 UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，然后点击右侧出现的“Zwave”栏。
1. 输入以下信息：
   - 串行端口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮并在菜单中导航到“控制面板”。
如果您已经配对了设备，您应该会看到它们慢慢显示出来。

现在是设置 Home Assistant 的时候了：

1. 转到设置面板，点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将弹出一个对话框，询问是否使用该插件：
   - **取消选中**该框，它将安装官方插件。
   - 再次强调，推荐使用官方插件，所以...
1. 在下一个对话框中，它会询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认即可！

## 配置

**注意**：_在更改配置时，请记得重新启动插件。_

插件配置示例：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件输出的日志级别，可以更改为更详细或更简洁，这在处理不明问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：出现严重问题，插件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您正在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 进行 Home Assistant 发现。**
强烈**建议**不要**使用该选项。相反，请使用上述文档中的 Z-Wave JS 集成。

## 更新日志与发布

该存储库通过 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简单来说，版本将根据以下规则递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提交问题][issue] 到 GitHub。

## 作者及贡献者

本存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

在此特此授予任何获得本软件及其相关文档文件（“软件”）副本的人，免费地处理该软件，而不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件副本的权利，以及允许向其提供软件的人照此进行，前提是满足以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不提供任何形式的保证，不论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者都不对任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面，因使用或与软件或软件的使用或其他交易相关的责任。

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