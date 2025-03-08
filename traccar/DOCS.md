# Home Assistant 社区附加组件：Traccar

[Traccar][traccar] 是一个现代化的 GPS 追踪平台，现在作为 Hass.io 附加组件可用，让您可以在没有任何云服务的情况下运行您的 GPS 追踪软件。

Traccar 支持的协议和设备型号比市场上任何其他 GPS 追踪系统都要多，直接从您的 Hass.io 实例中选择。您可以从各种供应商中选择 GPS 追踪器，从低成本的中国型号到高端品牌。

Traccar 还为 Android 和 iOS 平台提供原生移动应用，您也可以追踪这些设备。此外！通过 Home Assistant 的 `traccar` 集成（在 0.83 中引入），Traccar 中的数据将会反馈到您的 Home Assistant 实例中。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 确保您已安装并运行 [官方 "MariaDB" 附加组件][mariadb]！
1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开此附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击 "安装" 按钮以安装附加组件。
1. 启动 "Traccar" 附加组件。
1. 检查 "Traccar" 附加组件的日志，以确保一切正常。
1. 点击 "打开网页界面" 按钮。

## 配置

**注意**：_修改配置时请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，切勿直接复制粘贴！请创建您自己的配置！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以根据需要更改为更详细或更简洁，当您处理未知问题时可能会很有用。可能的值为：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不属于错误的异常事件。
- `error`：运行时错误，不需要立即处理。
- `fatal`：发生了严重错误，附加组件变得不可用。

请注意，每个级别自动包含来自更高级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，除非您在故障排除时，推荐使用该设置。

### 选项：`ssl`

在网页界面上启用/禁用 SSL (HTTPS)。
将其设置为 `true` 以启用，反之则为 `false`。

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置。_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置。_

## 集成到 Home Assistant

Home Assistant 的 `traccar` 集成使得能够转移 Traccar 追踪的所有资产，以便在 Home Assistant 中作为追踪设备出现。

将以下代码片段添加到您的 Home Assistant `configuration.yaml` 文件中。

```yaml
device_tracker:
  - platform: traccar
    host: localhost
    port: 18682
    username: TRACCAR_EMAIL_ADDRESS
    password: TRACCAR_PASSWORD
```

重启 Home Assistant。

## 启用更多协议

默认情况下，此附加组件已禁用大多数 GPS 协议。这样做是为了减少附加组件可能创建的开放端口数量。

默认情况下，仅启用 OsmAnd 协议（Traccar 应用使用）和 API。如果您想要更多协议，可以通过在附加组件配置文件夹中的 `traccar.xml` 文件中添加条目来实现。

所有条目的列表可以在这里找到：

<https://github.com/hassio-addons/addon-traccar/blob/main/traccar/rootfs/etc/traccar/traccar.xml#L22>

要找出您的设备使用了哪个协议，请参考 Traccar 网站：<https://www.traccar.org/devices/>

## 更新日志和发布

此仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简单来说，版本将根据以下因素增加：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您可以通过几种方式获得答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2024 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免费处理此软件的权利，包括限制使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在所有复制件或软件的实质性部分中。

本软件是“按原样”提供的，不附有任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用、合同、侵权或其他原因而引起的任何索赔、损害或其他责任负责。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_traccar&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-traccar/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-traccar/81407?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-traccar/issues
[mariadb]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=core_mariadb
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-traccar/releases
[semver]: https://semver.org/spec/v2.0.0.html
[traccar]: https://www.traccar.org