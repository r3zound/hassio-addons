# Home Assistant 社区附加组件：EMQX

[EMQX][emqx] 是一个开源的 MQTT 代理，它拥有高性能的实时消息处理引擎，支持大规模物联网设备的事件流。作为可扩展性最强的 MQTT 代理，EMQX 可以帮助您连接任何设备，无论规模如何（包括您家中的设备）。

[EMQX MQTT 代理][emqx] 是 Mosquitto MQTT 代理/附加组件的高级替代品，后者通常用于 Home Assistant。它提供一个用户界面来配置、管理和调试您的 MQTT 代理、客户端和流量。

虽然 EMQX 主要通过他们的网站以云托管产品的形式出售其产品，但此附加组件在完全本地、自托管的环境中运行 EMQX。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“EMQX”附加组件。
1. 检查“EMQX”的日志以查看一切是否顺利。
1. 打开 Web UI。
1. 使用默认凭证登录：用户名 `admin` 和密码 `public`。
1. 确保首先在您的 MQTT 客户端中设置身份验证，方法是在 EMQX Web UI 下的“访问控制”->“身份验证”中设置身份验证方法。
1. 再次阅读上述步骤，并**确保**您已经设置好身份验证。

_注意：_

- 在配置 Home Assistant、Zigbee2MQTT 或任何其他 MQTT 应用程序或客户端以连接到 eMQX 时，请使用 `homeassistant` 或 `a0d7b954-emqx` 作为要连接的代理/主机名。在某些情况下，仅使用 `localhost` 也可以工作。
- 连接外部设备到您的 EMQX 附加组件时，请使用您的 Home Assistant 实例的 IP 地址或主机名作为要连接的代理/主机名。

## 配置

您大概率不需要这些配置选项。几乎所有的配置都可以通过此附加组件中提供的 Web UI 完成。一些更高级/复杂的配置选项在 Web UI 中不可用，但可以使用此选项进行配置（例如，在设置多个实例的集群时）。

**注意**：_记得在更改配置后重启附加组件。_

附加组件配置示例：

```yaml
env_vars:
  - name: EMQX_NODE__NAME
    value: "something@else.local"
```

**注意**：_这只是一个示例，请不要复制和粘贴！请创建您自己的！_

### 选项：`env_vars`

此选项允许您通过设置环境变量来调整 EMQX 的每个方面。请查看本章开头的示例，了解配置的样子。

有关使用这些变量的更多信息，请参见官方 EMQX 文档：

<https://www.emqx.io/docs/en/v5.0/admin/cfg.html>

**注意**：_仅接受以 `EMQX_` 开头的环境变量。_

## 已知问题和限制

- 此附加组件不能与 Mosquitto 附加组件同时运行。
- EMQX 默认使用端口 1883、8083、8084 和 8883。可能您现有的某个附加组件与之冲突。在这种情况下，请更改其他附加组件的端口或更改 EMQX 的监听端口。要更改 EMQX 的端口，您需要暂时停止冲突的附加组件，因为您需要访问 EMQX Web UI 来更改监听端口。
- AlexxIT 的 WebRTC 集成已知会导致端口 8083 的冲突。可以暂时禁用该集成（类似于上面关于附加组件的点），以便访问 EMQX Web UI 来调整监听器。

## 更新日志与版本

此代码库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义化版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获得附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

此代码库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2023-2025 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）的人的权限，允许其不受限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，以及允许其向之提供软件的人这样做，受到以下条件的限制：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

本软件“按原样”提供，不附带任何形式的明示或暗示的担保，包括但不限于对适销性、对特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_emqx&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-emqx/graphs/contributors
[create-db]: https://github.com/hassio-addons/addon-influxdb/blob/main/influxdb/DOCS.md#integrating-into-home-assistant
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[emqx]: https://www.emqx.io/
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[influxdb-addon]: https://github.com/hassio-addons/addon-influxdb
[issue]: https://github.com/hassio-addons/addon-emqx/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-emqx/releases
[semver]: https://semver.org/spec/v2.0.0.html