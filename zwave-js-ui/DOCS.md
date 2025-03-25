# Home Assistant 社区插件：Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，让您可以配置 Z-Wave 网络的每一个方面。它提供了一个解耦的网关，可以通过 Z-Wave JS WebSocket（Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至是同时）进行通信。

一些优势和使用场景：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间继续运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络进行交互，同时它也可供 Home Assistant 使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协作。
- 在找到 Mosquitto 插件时，会自动进行预配置。

该插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此插件相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮来安装插件。
1. 检查“Z-Wave JS UI”插件的日志，查看是否一切顺利。
1. 点击“打开 Web UI”按钮。
1. 享受该插件！

**注意**：上游项目有关于使用该软件的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，该插件将提供一个插件 UI，并有能力通过 MQTT 发送/接收数据。因此，如果您对此感兴趣，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接。

为此：

1. 通过点击 Supervisor 插件页面上的“打开 Web UI”按钮，打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，然后点击右侧出现的“Zwave”栏。
1. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮，并在菜单中导航到“控制面板”。如果您已经配对了设备，您应该会看到它们慢慢出现。

现在是时候设置 Home Assistant 了：

1. 转到设置面板，点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将出现一个对话框，询问是否使用插件：
   - **取消选中**该框，它将安装官方插件。
   - 同样，推荐使用官方插件，因此...
1. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认并完成！

## 配置

**注意**：_请记得在更改配置后重启插件。_

示例插件配置：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更少详细，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现严重错误。插件无法使用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排除故障。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现。**强烈**建议**不要**使用该选项。请按照上文记录使用 Z-Wave JS 集成。

## 更新日志与发布

该仓库使用 [GitHub 的发布][releases] 功能保留变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简单来说，版本会根据以下情况递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以找到答案：

- 用于插件支持和功能请求的 [Home Assistant 社区插件 Discord 聊天服务器][discord]。
- 用于一般 Home Assistant 讨论和问题的 [Home Assistant Discord 聊天服务器][discord-ha]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在 [这里打开一个问题][issue] 到 GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人，免费进行本软件的使用，复制，修改，合并，发布，分发， sublicensing 和/或销售本软件的副本，并允许提供本软件的人这样做，前提是遵循以下条件：

上述版权声明和本许可声明将在本软件的所有副本或重要部分中包含。

本软件“按原样”提供，没有任何形式的保证，明示或暗示，包括但不限于适销性，特定用途的适用性和非侵权。在任何情况下，作者或版权持有人对任何索赔，损害或其他责任不承担责任，无论是在合同，侵权或其他方面，均源于或与本软件或本软件的使用或其他交易相关。

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