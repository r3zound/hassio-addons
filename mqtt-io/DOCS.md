# Home Assistant 社区附加组件：MQTT IO

将通用目的输入和输出（GPIO）、硬件传感器和串行设备暴露给 MQTT 服务器。非常适合树莓派等单板计算机。

## 安装

该附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 单击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 单击“安装”按钮以安装该附加组件。
1. 在附加组件选项中设置 MQTT IO 配置文件的位置。
   默认情况下，该位置为 `/config/mqtt-io/config.yml`。
1. 创建 MQTT IO 配置文件。有关格式和配置选项的信息，请查阅 MQTT IO 文档：
   <https://mqtt-io.app/2.2.6/#/config/scenarios>
1. 创建配置后，启动“MQTT IO”附加组件。
1. 检查“MQTT IO”附加组件的日志，查看一切是否正常。

## 配置

**注意**：_更改配置后，请记得重新启动附加组件。_

示例附加组件配置：

```yaml
configuration_file: /config/mqtt-io.yml
log_level: info
```

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项：`configuration_file`

`configuration_file` 选项允许您配置 MQTT IO 将用于运行的配置文件。默认值为 `/config/mqtt-io/config.yml`，但如果需要，您可以将其更改为其他内容。

有关 MQTT IO 配置文件格式的更多信息，请参阅：

<https://mqtt-io.app/2.2.7/#/config/scenarios> 和 <https://mqtt-io.app/2.2.7/#/config/ha_discovery>

请注意，此配置文件不会自动创建。

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需立即采取措施。
- `fatal`：发生了严重错误。附加组件变得无法使用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是一种推荐的设置，除非您在进行故障排除。

## 变更记录与发布

此仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简单来说，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种选择可以获得解答：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] 在 GitHub 上。

## 作者及贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2023-2024 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重要部分中。

本软件是按“原样”提供的，不提供任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、对特定用途的适用性以及不侵权的保证。在任何情况下，作者或版权持有者对于因本软件或使用或其他交易中引起的任何索赔、损害或其他责任，不论是在合同、侵权或其他方面，均不承担责任。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_mqtt_io&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[alpine-packages]: https://pkgs.alpinelinux.org/packages
[contributors]: https://github.com/hassio-addons/addon-mqtt-io/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-mqtt-io/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-mqtt-io/releases
[semver]: https://semver.org/spec/v2.0.0.html