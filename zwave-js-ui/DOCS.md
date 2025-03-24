# Home Assistant 社区附加组件: Z-Wave JS UI

Z-Wave JS UI 附加组件提供了一个额外的控制面板，让您可以配置 Z-Wave 网络的各个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成使用）和 MQTT 进行通信（甚至可以同时使用）。

一些优点和用例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间继续运行。
- 您可以直接使用 Node-RED 与您的 Z-Wave 网络，同时它也可用于 Home Assistant。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络合作。
- 当找到时，会与 Mosquitto 附加组件自动配置。

此附加组件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此附加组件是相当简单的，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮打开您 Home Assistant 实例中的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 查看“Z-Wave JS UI”附加组件的日志以查看一切是否顺利。
1. 点击“打开网页 UI”按钮。
1. 享受该附加组件！

**注意**: 上游项目有关于如何使用该软件的文档：
<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方附加组件商店设置官方“Z-Wave JS”附加组件。

然而，此附加组件将提供附加组件 UI，并且能够通过 MQTT 发送/接收数据。所以，如果这正是您需要的，这个附加组件可能适合您。

成功启动附加组件后，是时候将其与 Home Assistant 连接起来。

为此：

1. 通过单击附加组件页面中的“打开网页 UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，点击菜单中的“设置”，然后点击右侧显示的“Zwave”栏。
1. 输入以下信息：
   - 串口 (例如, `/dev/serial/by-id/usb-0658_0200_if00`)
   - 网络密钥 (例如, `2232666D100F795E5BB17F0A1BB7A146`)

现在点击“保存”按钮，然后在菜单中导航到“控制面板”。
如果您已经配对了设备，您应该会看到它们逐渐出现。

现在是设置 Home Assistant 的时候了：

1. 转到设置面板并点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将会弹出一个对话框，询问是否使用此附加组件：
   - **取消勾选**那个框，它将安装官方附加组件。
   - 同样，推荐使用官方附加组件，因此...
1. 在下一个对话框中，它将询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认完成！

## 配置

**注意**: _在更改配置时，请记得重新启动附加组件。_

附加组件配置示例：

```yaml
log_level: info
```

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在您处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每一个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不算错误的异常事件。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现了严重错误，附加组件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现。**强烈建议** **不要**使用该选项。请按照上文所述使用 Z-Wave JS 集成。

## 更新日志与版本

此代码库使用 [GitHub 的发布][releases] 功能保存变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将基于以下因素增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选项可以得到解决：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 进行附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

此代码库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

特此授予任何获得本软件及其相关文档文件（“软件”）副本的人，免费使用、复制、修改、合并、发布、分发、再授权和/或出售该软件副本的权利，并允许提供软件的人这样做，条件如下：

上述版权声明和此许可声明应包含在所有副本或实质性部分的软件中。

该软件是“按原样”提供的，不提供任何种类的保证，无论是明确还是隐含，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他事务中。

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