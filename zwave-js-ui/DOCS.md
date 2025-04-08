# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，使您能够配置 Z-Wave 网络的各个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至可以同时使用）进行通信。

一些优点和使用案例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间保持运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络，同时它也可以在 Home Assistant 中使用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络进行协作。
- 当找到 Mosquitto 插件时，它会自动配置自己。

此插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 检查“Z-Wave JS UI”插件的日志，以查看是否一切正常。
1. 点击“打开 WEB UI”按钮。
1. 享受插件的使用！

**注意**：上游项目有关于如何使用软件的文档：
<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，此插件将提供一个插件 UI，并具有通过 MQTT 发送/接收数据的能力。因此，如果这是您所需的，这个插件可能适合您。

成功启动插件后，是时候将其与 Home Assistant 连接起来。

要做到这一点：

1. 通过点击监督器中的插件页面上的“打开 WEB UI”按钮打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，点击右侧出现的“Zwave”栏。
1. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮，并在菜单中导航到“控制面板”。
如果您已经配对了设备，您应该会看到它们逐渐出现。

现在是时候设置 Home Assistant：

1. 转到设置面板，点击“设备与服务”。
1. 在右下角，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 将出现一个对话框，询问是否使用插件：
   - **取消选中**该框，它将安装官方插件。
   - 同样，推荐使用官方插件，因此...
1. 在下一个对话框中，它会询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认，完成！

## 配置

**注意**：_请记住，当配置更改时，重新启动插件。_

插件配置示例：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每一个细节，比如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：运行时错误，但不需要立即采取措施。
- `fatal`：发生了严重问题。插件变得无法使用。

请注意，每个级别自动包含更高级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 的 Home Assistant 发现。**强烈**建议**不要**使用该选项。请按照上述文档使用 Z-Wave JS 集成。

## 更新记录与发布

此存储库使用 [GitHub 的发布][releases] 功能保持更新日志。

发布基于 [语义版本控制][semver]，并使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下情况进行增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021 - 2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件 (统称为“软件”) 的人员免费使用、复制、修改、合并、发布、分发、再许可和/或出售本软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在所有副本或实质性部分的软件中。

本软件按“原样”提供，不附加任何类型的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或与本软件或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他情况下。

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