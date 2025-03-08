# Home Assistant Community Add-on: ZeroTier One

[ZeroTier][zerotier] 提供了 VPN、SDN 和 SD-WAN 的功能，通过一个系统即可实现。管理所有连接的资源，无论是本地网络还是广域网络，就像整个世界都是一个数据中心。

人们使用 ZeroTier 来无缝连接笔记本电脑、台式机、手机、嵌入式设备、云资源和应用，无论他们在哪里，任何他们想要的方式。它将整个世界转变为一个单一的数据中心，您现在可以通过此插件将您的 Home Assistant 实例添加进去。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant 我的按钮，打开您的 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 在 [zerotier.com][zerotier] 创建一个免费账户并获取网络 ID。
1. 使用您的网络 ID 设置“network_id”插件选项。
1. 启动“ZeroTier One”插件
1. 检查“ZeroTier One”插件的日志，查看一切是否正常。
1. 实例将出现在您的 ZeroTier 帐户中。

## 配置

**注意**：_更改配置时请记得重启插件。_

示例插件配置：

```yaml
networks:
  - wgfyiwe73747457
  - fhu3888892jjfdk
api_auth_token: ""
```

**注意**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的异常事件。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在排除故障。

### 选项：`networks`

配置要加入的一个或多个网络标识符（VLAN）。您可以在您的 ZeroTier 帐户中找到这个编号。

**注意**：_此选项支持机密，例如 `!secret zerotier_network_id`。_

### 选项：`api_auth_token`

ZeroTier 提供了一个本地 HTTP JSON API，使用上述 `port` 选项设置的端口。它允许工具和程序访问此 ZeroTier 实例以查询数据（或控制它）。

此令牌类似于访问该 API 的密码，如果您不打算使用此功能，可以将此选项留空。

有关 ZeroTier JSON API 的更多信息，请 [查看他们的文档][api]。

**注意**：_此选项支持机密，例如 `!secret zerotier_token`。_

## 更新日志和版本

此存储库使用 [GitHub 的版本][releases] 功能保持更改日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，提供插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，提供一般的 Home Assistant 讨论和问题解答。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit].

您还可以 [在这里报告问题][issue] GitHub。

## 作者和贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Franck Nijhof

特此授予任何获得此软件及相关文档文件（“软件”）副本的人，免费且不受限制地使用该软件，包括不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许提供该软件的人这样做，前提是符合以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，没有任何种类的明示或暗示担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者不对因使用该软件或该软件的使用或其他交易产生的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权还是其他原因。

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