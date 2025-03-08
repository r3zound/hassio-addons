# Home Assistant 社区附加组件：ZeroTier One

[ZeroTier][zerotier] 提供 VPN、SDN 和 SD-WAN 的功能，使用一个系统来管理您在本地和广域网络上的所有连接资源，就像整个世界都是一个数据中心。

人们使用 ZeroTier 以任何他们想要的方式，无缝连接笔记本电脑、台式机、手机、嵌入式设备、云资源和应用程序。它将整个世界转变为一个数据中心，您现在可以使用这个附加组件将您的 Home Assistant 实例添加到其中。

## 安装

安装此附加组件非常简单，与安装其他 Home Assistant 附加组件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 在 [zerotier.com][zerotier] 创建一个免费账户并获取网络 ID。
1. 使用您的网络 ID 设置“network_id”附加组件选项。
1. 启动“ZeroTier One”附加组件
1. 检查“ZeroTier One”附加组件的日志，查看一切是否正常。
1. 该实例将在您的 ZeroTier 账户中显示。

## 配置

**注意**：_更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
networks:
  - wgfyiwe73747457
  - fhu3888892jjfdk
api_auth_token: ""
```

**注意**：_这只是一个示例，请不要复制粘贴！创建你自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的异常事件。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排查故障。

### 选项：`networks`

配置要加入的一个或多个网络标识符（VLAN）。您可以在您的 ZeroTier 帐户中找到这个号码。

**注意**：_此选项支持机密，例如 `!secret zerotier_network_id`。_

### 选项：`api_auth_token`

ZeroTier 提供本地 HTTP JSON API，使用上述 `port` 选项设置的端口。它允许工具和程序访问此 ZeroTier 实例以查询数据（或进行控制）。

此令牌类似于访问该 API 的密码，如果您不打算使用此功能，可以将此选项留空。

有关 ZeroTier JSON API 的更多信息，请 [查阅他们的文档][api]。

**注意**：_此选项支持机密，例如 `!secret zerotier_token`。_

## 更新日志与版本

该存储库使用 [GitHub 的版本][releases] 功能保留更改日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- 进入 [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 寻求附加组件支持和功能请求。
- 进入 [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2019-2025 Franck Nijhof

特此免费授权任何获得本软件及其相关文档文件（“软件”）副本的人，在不受限制的情况下使用本软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售本软件的副本，并允许提供软件的人这样做，须遵守以下条件：

以上版权声明和本许可声明应包含在所有副本或重要部分的软件中。

本软件是按“原样”提供的，没有任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用本软件或其他交易中产生的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_zerotier&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[api]: https://www.zerotier.com/manual.shtml#4_1
[contributors]: https://github.com/hassio-addons/addon-zerotier/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-zerotier-one/109091?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-zerotier/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-zerotier/releases
[semver]: https://semver.org/spec/v2.0.0.html
[zerotier]: https://www.zerotier.com/