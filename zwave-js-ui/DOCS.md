# Home Assistant 社区附加组件: Z-Wave JS UI

Z-Wave JS UI 附加组件提供了一个额外的控制面板，允许您配置 Z-Wave 网络的每一个方面。它提供了一个解耦的网关，可以通过 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 您的 Z-Wave 网络将在 Home Assistant 重新启动之间继续运行。
- 您可以直接将 Node-RED 等工具与您的 Z-Wave 网络一起使用，同时它也可以在 Home Assistant 中使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协作。
- 在发现时会预配置自己与 Mosquitto 附加组件。

此附加组件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

此附加组件的安装相当简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下方的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件.][addon-badge]][addon]

1. 点击“安装”按钮安装附加组件。
1. 检查“Z-Wave JS UI”附加组件的日志以查看一切是否顺利进行。
1. 点击“打开网页 UI”按钮。
1. 享受该附加组件的使用！

**注意**: 上游项目提供了关于如何使用该软件的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成会尝试设置来自官方附加组件商店的官方“Z-Wave JS”附加组件。

然而，此附加组件将提供附加组件 UI，并且具有通过 MQTT 发送/接收数据的能力。如果这是您需要的，可能这个附加组件适合您。

在成功启动附加组件后，现在是将其与 Home Assistant 连接的时候了。

为此：

1. 通过在管理界面的附加组件页面上点击“打开网页 UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，然后点击右侧显示的“Zwave”条。
1. 输入以下信息：
   - 串口（例如 `/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如 `2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮，然后在菜单中导航到“控制面板”。如果您已经配对了设备，您应该会看到设备慢慢出现。

接下来是设置 Home Assistant 的时候：

1. 转到设置面板并点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将弹出一个对话框，询问您是否使用该附加组件：
   - **取消选中**该框，它将安装官方附加组件。
   - 同样，推荐使用官方附加组件，因此...
1. 在下一个对话框中，它将询问服务器。请输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认并完成！

## 配置

**注意**: _记得在更改配置时重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
```

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能是有用的。可能的值是：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常事件。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 发生严重错误，附加组件变得不可用。

请注意，每个级别自动包含来自更严厉级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排除故障。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现。**强烈**建议**不要**使用该选项。请使用上述文档中的 Z-Wave JS 集成。

## 更新日志与发布

本存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题？

您可以通过几种途径获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此授予任何获得本软件及其相关文档文件（以下简称“软件”）副本的人免费许可，允许在不受限制的情况下使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明及本许可声明应包含在软件的所有副本或实质性部分中。

软件是“按原样”提供的，没有任何类型的明示或暗示的担保，包括但不限于适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用软件或其他交易期间的任何索赔、损害或其他责任负责，不论是在合同诉讼、侵权或其他情况下。

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