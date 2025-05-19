# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，让您能够配置 Z-Wave 网络的每个方面。它提供一个解耦的网关，可以使用 Z-Wave JS WebSockets（由 Home Assistant Z-Wave JS 集成使用）和 MQTT（甚至同时）进行通信。

一些优势和使用案例：

- 与 Home Assistant Z-Wave JS 集成兼容。
- 您的 Z-Wave 网络在 Home Assistant 重启之间将保持运行。
- 您可以直接使用 Node-RED 等工具与您的 Z-Wave 网络，同时它也可用于 Home Assistant。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络工作。
- 在找到时与 Mosquitto 插件预配置。

此插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 单击“安装”按钮以安装插件。
3. 检查“Z-Wave JS UI”插件的日志以查看一切是否正常。
4. 单击“打开 Web UI”按钮。
5. 享受该插件！

**注意**：上游项目有使用该软件本身的文档：<https://zwave-js.github.io/zwave-js-ui/#/>

## 设置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成将尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，此插件将提供一个插件 UI，并且还能够通过 MQTT 发送/接收数据。因此，如果这合乎您的需求，此插件可能适合您。

成功启动插件后，就该将其连接到 Home Assistant。

为此：

1. 通过单击 Supervisor 页面上的“打开 Web UI”按钮打开 Z-Wave JS UI 控制面板。
2. 在控制面板中，转到菜单中的“设置”，然后单击右侧显示的“Zwave”栏。
3. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在单击“保存”按钮，并导航到菜单中的“控制面板”。如果您已经配对了设备，它们应该会慢慢显示出来。

现在是设置 Home Assistant 的时候了：

1. 进入设置面板并单击“设备和服务”。
2. 在右下角单击“+ 添加集成”。
3. 从列表中选择“Z-Wave”集成。
4. 将显示一个对话框，询问是否使用该插件：
   - **取消选中**该框，它将安装官方插件。
   - 再次，官方插件是推荐的，所以……
5. 在下一个对话框中，它将要求输入服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
6. 确认，完成！

## 配置

**注意**：_更改配置时请记得重启插件。_

示例插件配置：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能值为：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即行动的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包括来自更高严重性级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是一种推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- Z-Wave JS UI 支持通过 MQTT 进行 Home Assistant 发现。**强烈**建议**不要**使用该选项。请使用上述文档中的 Z-Wave JS 集成。

## 更新日志与版本发布

此存储库使用 [GitHub 的版本发布][releases] 功能保持更改日志。

版本发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下情况递增：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有疑问吗？

您有几种选项可以得到答案：

- 访问 [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取插件支持和功能请求。
- 访问 [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和问题。
- 访问 Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

您还可以在 GitHub 上 [打开一个问题][issue]。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免费权限， 不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许提供该软件的人这样做， 但须符合以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或主要部分中。

该软件是“按原样”提供的，不作任何类型的保证，明确或隐含，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与之相关的使用或其他交易而产生的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权或其他。

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