# Home Assistant 社区插件：Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，允许您配置 Z-Wave 网络的各个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（由 Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间保持运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络进行交互，同时它也可以在 Home Assistant 中使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协作。
- 在找到时会与 Mosquitto 插件进行自我配置。

该插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant 我的按钮以打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 单击“安装”按钮以安装插件。
1. 检查“Z-Wave JS UI”插件的日志以查看一切是否正常。
1. 单击“打开网页 UI”按钮。
1. 享受该插件！

**注意**：上游项目提供了关于如何使用该软件的文档：
<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的 “Z-Wave JS” 插件。

但是，这个插件将提供一个插件 UI，并且也可以通过 MQTT 发送/接收数据。所以，如果这符合您的需求，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接起来了。

为此：

1. 通过单击监督页面上插件页面中的“打开网页 UI”按钮来打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，然后单击右侧出现的“Zwave”栏。
1. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在单击“保存”按钮，然后导航到菜单中的“控制面板”。
如果您已经配对了设备，您应该会看到它们慢慢出现。

现在是设置 Home Assistant 的时候了：

1. 转到设置面板并单击“设备和服务”。
1. 在右下角，单击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将出现一个对话框，询问是否使用该插件：
   - **取消勾选**该框，它将安装官方插件。
   - 同样，建议使用官方插件，所以...
1. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认，完成！

## 配置

**注意**：_记得在更改配置时重启插件。_

插件配置示例：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的特殊情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是建议的设置，除非您在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现。**强烈**建议**不要**使用该选项。请使用上述文档中的 Z-Wave JS 集成。

## 更新日志 & 版本发布

该仓库使用 [GitHub 的发布][releases] 功能维持变更日志。

版本基于 [语义版本控制][semver]，并采用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增量：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在 GitHub 上 [打开一个问题][issue]。

## 作者 & 贡献者

本仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权限，并允许提供软件的人在遵循以下条件的情况下执行上述操作：

上述版权声明和本许可声明应包括在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不提供任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与软件或其他行为相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼还是其他方面。

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