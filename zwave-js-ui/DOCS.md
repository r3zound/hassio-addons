# Home Assistant Community Add-on: Z-Wave JS UI

Z-Wave JS UI 插件提供了一个额外的控制面板，使您可以配置 Z-Wave 网络的各个方面。它提供了一个解耦的网关，可以使用 Z-Wave JS WebSockets（Home Assistant Z-Wave JS 集成使用）和 MQTT 进行通信（甚至可以同时使用）。

一些优势和使用案例：

- 兼容 Home Assistant Z-Wave JS 集成。
- 您的 Z-Wave 网络将在 Home Assistant 重启之间持续运行。
- 您可以直接将 Node-RED 等工具与 Z-Wave 网络一起使用，同时该网络对 Home Assistant 可用。
- 允许基于 [ESPHome.io][esphome] 的 ESP 设备直接响应或与您的 Z-Wave 网络配合工作。
- 当找到 Mosquitto 插件时会自动进行预配置。

该插件使用 [Z-Wave JS UI][zwave-js-ui] 软件。

## 安装

安装该插件非常简单，和安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 检查“Z-Wave JS UI”插件的日志，查看是否一切正常。
1. 点击“打开网络界面”按钮。
1. 享受这个插件吧！

**注意**：上游项目有使用该软件本身的文档：
<https://zwave-js.github.io/zwave-js-ui/#/>

## 配置 Home Assistant Z-Wave JS 集成

默认情况下，Home Assistant Z-Wave JS 集成会尝试从官方插件商店设置官方的“Z-Wave JS”插件。

然而，这个插件将提供一个插件 UI，并且可以通过 MQTT 发送/接收数据。因此，如果这正合您的需求，这个插件可能是适合您的。

成功启动插件后，是时候将其与 Home Assistant 连接起来了。

要做到这一点：

1. 在 Supervisor 的插件页面上，点击“打开网络界面”按钮以打开 Z-Wave JS UI 控制面板。
1. 在控制面板中，转到菜单中的“设置”，并点击右侧显示的“Zwave”选项。
1. 输入以下信息：
   - 串口（例如，`/dev/serial/by-id/usb-0658_0200_if00`）
   - 网络密钥（例如，`2232666D100F795E5BB17F0A1BB7A146`）

现在点击“保存”按钮并导航至菜单中的“控制面板”。如果您已经配对了设备，您应该看到设备慢慢显示出来。

现在是时候设置 Home Assistant 了：

1. 转到设置面板并点击“设备与服务”。
1. 在右下方，点击“+ 添加集成”。
1. 从列表中选择“Z-Wave”集成。
1. 会弹出一个对话框，询问是否使用该插件：
   - **取消选中**该框，它将安装官方插件。
   - 再次，推荐使用官方插件，因此...
1. 在下一个对话框中，它会询问服务器。输入：
   `ws://a0d7b954-zwavejs2mqtt:3000`
1. 确认完毕！

## 配置

**注意**：_记得在配置更改时重启插件。_

示例插件配置：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更或更少的详细信息，这在处理未知问题时可能会很有用。可能的值为：

- `trace`：显示每一个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常发生，但并不是错误。
- `error`：运行时错误，但不需要立即采取行动。
- `fatal`：发生了严重错误，插件变得不可用。

请注意，每个级别自动包含更高级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排查问题。

## 已知问题和限制

- Z-Wave JS UI 支持在 MQTT 上的 Home Assistant 发现。**强烈建议** **不要** 使用该选项。请使用上面文档中的 Z-Wave JS 集成。

## 更新日志与发布

该库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- 用于插件支持和功能请求的 [Home Assistant Community Add-ons Discord 聊天服务器][discord]。
- 一般 Home Assistant 讨论和问题的 [Home Assistant Discord 聊天服务器][discord-ha]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您也可以在 [这里打开一个问题][issue] GitHub。

## 作者与贡献者

该库的最初设置由 [Franck Nijhof][frenck] 进行。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021 - 2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（以下简称“软件”）副本的人，允许其不受限制地使用、复制、修改、合并、出版、分发、再许可和/或销售本软件的副本，并允许向其提供本软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或重大部分的软件中。

本软件是“按原样”提供的，没有任何种类的保证，明示或暗示，包括但不限于对适销性、特定用途的适合性和不侵权的保证。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面，均不因使用或其他处理本软件而产生或与之相关。

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