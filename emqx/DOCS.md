# Home Assistant Community Add-on: EMQX

[EMQX][emqx] 是一个开源的 MQTT 代理，拥有高性能的实时消息处理引擎，支持大规模物联网设备的事件流。作为最具可扩展性的 MQTT 代理，EMQX 可以帮助您连接任何设备，任何规模（包括您的家）。

[EMQX MQTT 代理][emqx] 是一个高级替代选项，取代在 Home Assistant 中通常使用的 Mosquitto MQTT 代理/附加组件。它具有一个用户界面，用于配置、管理和调试您的 MQTT 代理、客户端和流量。

虽然 EMQX 主要在其网站上销售其产品为云托管产品，但该附加组件在完全本地和自我托管的环境中运行 EMQX。

## 安装

安装这个附加组件非常简单，与安装其他任何 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

2. 点击“安装”按钮安装该附加组件。
3. 启动“EMQX”附加组件。
4. 检查“EMQX”的日志，看看是否一切顺利。
5. 打开 Web UI。
6. 使用默认凭据登录：用户名 `admin` 和密码 `public`。
7. 确保首先为您的 MQTT 客户端设置身份验证，在 EMQX Web UI 的“访问控制” -> “身份验证”中设置身份验证方法。
8. 再次阅读上述步骤并**确保**您已设置身份验证。

_注意：_

- 在配置 Home Assistant、Zigbee2MQTT 或任何其他 MQTT 应用程序或客户端以连接 eMQX 时，使用 `homeassistant` 或 `a0d7b954-emqx` 作为要连接的代理/主机名。在某些情况下，仅使用 `localhost` 也可行。
- 当将外部设备连接到您的 EMQX 附加组件时，使用您的 Home Assistant 实例的 IP 地址或主机名作为要连接的代理/主机名。

## 配置

您可能不需要这些配置选项。几乎所有配置都可以通过此附加组件中提供的 Web UI 完成。一些更高级/复杂的配置选项在 Web UI 中不可用，但可以使用此选项进行配置（例如，当设置多个实例的集群时）。

**注意**：_更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
env_vars:
  - name: EMQX_NODE__NAME
    value: "something@else.local"
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`env_vars`

此选项允许您通过设置环境变量来调整 EMQX 的每个方面。有关配置的外观的想法，请参见本章开头的示例。

有关使用这些变量的更多信息，请参阅官方 EMQX 文档：

<https://www.emqx.io/docs/en/v5.0/admin/cfg.html>

**注意**：_仅接受以 `EMQX_` 开头的环境变量。_

## 已知问题和限制

- 此附加组件无法与 Mosquitto 附加组件同时运行。
- EMQX 默认使用端口 1883、8083、8084 和 8883。可能存在与您现有的附加组件冲突的情况。在这种情况下，您可以更改其他附加组件的端口或更改 EMQX 的监听端口。要更改 EMQX 的端口，您需要临时停止冲突的附加组件，因为您需要访问 EMQX Web UI 以更改监听端口。
- AlexxIT 的 WebRTC 集成已知会在端口 8083 上导致端口冲突。临时禁用集成（类似于上面所述的附加组件）可以用于允许访问 EMQX Web UI 以调整监听器。

## 更新日志 & 发布说明

该存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义化版本控制][semver]，并采用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2023-2025 Franck Nijhof

特此免费向任何获得本软件及相关文档文件（“软件”）副本的人授予使用、复制、修改、合并、发布、分发、再许可和/或销售本软件的权利，并允许被提供本软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在所有副本或重要部分中。

本软件按“原样”提供，不提供任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途的适应性和非侵权的担保。在任何情况下，作者或版权持有者对因使用本软件或其他交易中的软件而产生的任何索赔、损害或其他责任均不承担责任，无论是在合同诉讼、侵权或其他行为中。

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