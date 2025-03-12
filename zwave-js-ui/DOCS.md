# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，允许您配置 Z-Wave 网络的每个方面。它提供了一个解耦的网关，可以通过 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成所使用）和 MQTT（甚至同时使用）进行通信。

一些优点和使用场景：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络在 Home Assistant 重启之间将保持运行。
- 您可以直接使用 Node-RED 等与您的 Z-Wave 网络进行交互，同时它也可用于 Home Assistant。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络协同工作。
- 当找到时，它会与 Mosquitto 插件自动配置。

此插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开此插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击 "安装" 按钮以安装插件。
1. 检查 "Z-Wave JS UI" 插件的日志以查看一切是否顺利。
1. 点击 "打开网页界面" 按钮。
1. 享受这个插件吧！

**注意**：上游项目有关于使用该软件本身的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方 "Z-Wave JS" 插件。

然而，该插件将提供一个插件 UI，并具有通过 MQTT 发送/接收数据的能力。因此，如果这是您想要的，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接起来了。

为此：

1. 通过单击插件页面上的 "打开网页界面" 按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的 "设置"，然后单击右侧显示的 "Zwave" 菜单。
1. 输入以下信息：
   - 串口 (例如，`/dev/serial/by-id/usb-0658_0200_if00`)
   - 网络密钥 (例如，`2232666D100F795E5BB17F0A1BB7A146`)

现在点击 "保存" 按钮并导航到菜单中的 "控制面板"。
如果您已经配对了设备，您应该会看到它们慢慢出现。

现在是时候设置 Home Assistant 了：

1. 转到设置面板并点击 "设备与服务"。
1. 在右下角，点击 "+ 添加集成"。
1. 从列表中选择 "Z-Wave" 集成。
1. 将显示一个对话框，询问是否使用该插件：
   - **取消选中**该框，它将安装官方插件。
   - 再次，推荐使用官方插件，所以...
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

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值是：

- `trace`: 显示每一个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 进行 Home Assistant 发现。**强烈**建议**不要**使用该选项。请使用上述文档中描述的 Z-Wave JS 集成。

## 更新日志及发布

该存储库使用 [GitHub 的版本发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下规则增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请访问 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

在此特此授予任何获得该软件及相关文档文件（“软件”）副本的人，无偿处理该软件的权利，包括不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，以及允许提供该软件的人这样做，前提是遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

该软件按照 "原样" 提供，不作任何形式的保证，无论是明示还是暗示，包括但不限于适销性保证、特定用途的适用性和非侵权。在任何情况下，作者或版权持有人均不对因使用或其他交易中的软件而引起的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权行为或其他行为。

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