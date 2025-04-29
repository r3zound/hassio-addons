# Home Assistant 社区附加组件: Z-Wave JS UI

Z-Wave JS UI 附加组件提供了一个额外的控制面板，使您能够配置 Z-Wave 网络的每个方面。它提供一个解耦的网关，可以通过 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成使用）和 MQTT 进行通信（甚至可以同时使用）。

一些优点和用例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间持续运行。
- 您可以直接使用 Node-RED 等工具与 Z-Wave 网络交互，同时它也可供 Home Assistant 使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与 Z-Wave 网络协作。
- 当发现 Mosquitto 附加组件时，会自动进行预配置。

此附加组件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant My 按钮以打开您 Home Assistant 实例中的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 检查“Z-Wave JS UI”附加组件的日志以查看是否一切正常。
1. 点击“打开Web UI”按钮。
1. 享受该附加组件！

**注意**：上游项目有使用该软件本身的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试设置来自官方附加组件商店的官方 “Z-Wave JS” 附加组件。

然而，此附加组件将提供附加组件 UI，并具有通过 MQTT 发送/接收数据的能力。因此，如果您需要这样的功能，这个附加组件可能适合您。

在成功启动附加组件后，是时候将其与 Home Assistant 连接起来了。

为此：

1. 通过点击副本页面中的“打开Web UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，并单击右侧出现的“Zwave”栏。
1. 输入以下信息：
   - 串口（例如 `/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如 `2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮并导航到菜单中的“控制面板”。
如果您已经配对了设备，您应该会看到设备慢慢显示出来。

现在是时候设置 Home Assistant 了：

1. 转到设置面板并点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将弹出一个对话框，询问是否使用附加组件：
   - **取消选中**该框，它将安装官方附加组件。
   - 同样，推荐使用官方附加组件，因此...
1. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认完成！

## 配置

**注意**：_更改配置时请记得重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
```

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常是）有趣的事件。
- `warning`: 异常事件，但不是错误。
- `error`: 运行时错误，不需要立即采取行动。
- `fatal`: 发生了严重错误，附加组件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 进行 Home Assistant 发现。**强烈**建议**不要**使用那个选项。请按照上述文档使用 Z-Wave JS 集成。

## 更新日志和版本

本存储库使用 [GitHub 的版本][releases] 功能保持更新日志。

版本基于 [语义化版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种方式可以得到解答：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit subreddit][reddit] 在 [/r/homeassistant][reddit].

您还可以 [在此处报告问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，按限制使用该软件，包括不限制使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许其接受本软件的人员这样做，但须遵守以下条件：

上述版权声明和本许可证声明应包含在所有副本或软件的实质部分中。

该软件是“按原样”提供的，没有任何形式的担保，明示或隐含，包括但不限于对适销性、特定目的的适用性和不侵权的担保。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他方面，均因软件或其使用或其他交易行为而引起。

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