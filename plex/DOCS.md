# Home Assistant 社区插件：Plex 媒体服务器

Plex 插件将你最喜欢的媒体集中在一个地方，使其美观且易于享受。该插件提供的 Plex 媒体服务器可以组织你的个人视频、音乐和照片收藏，并将它们流式传输到你所有的设备上。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下面的“Home Assistant 我的”按钮以在你的 Home Assistant 实例中打开插件。

   [![在你的 Home Assistant 实例中打开这个插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 浏览到 <https://www.plex.tv/claim> 并获取你的索取令牌。
1. 使用你在上一步获得的索取代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex 媒体服务器”插件。
1. 检查“Plex 媒体服务器”的日志以查看一切是否正常。
1. 登录 Plex 管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用 `/share` 和 `/media` 作为基础目录。

## 配置

**注意**：_请记得在配置更改时重启插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要复制粘贴！创建你自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，例如调用的所有内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常情况，非错误。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是建议的设置，除非你正在进行故障排除。

### 选项：`claim_code`

为了允许你的服务器登录到你的 Plex 账户，它需要一个所谓的“索取代码”。登录到 Plex 使 Plex 能够定位和连接到你的服务器，并解锁各种功能。

为了获取你的代码，请浏览到 <https://www.plex.tv/claim>。

该代码仅用于一次插件。一旦服务器成功与 Plex 认证，代码可以被删除。

## 解决与 Plex 的连接问题

Plex 的设置相当简单而且容易。大多数设置会自动检测。然而，它常常无法识别其在你的家庭网络上的 IP。这可能会导致与某些 Plex 应用程序的连接问题，例如，三星 Tizen Plex 应用。

这不是 Plex 的错，而是由于这个插件运行的 Docker 生态系统所致。幸运的是，Plex 中有一个选项可以帮助解决这个问题，但它有点隐蔽。

- 登录到 Plex 网页界面。
- 转到设置。
- 点击服务器标签。
- 在左侧选择“网络”。
- 确保你查看的是高级视图。右上角有一个按钮“显示高级”。
- 将自定义 URL 添加到“自定义服务器访问 URL”字段。

自定义 URL 是 Plex 客户端将用来尝试连接到 Plex 的附加 URL。如果你愿意，可以列出多个，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题和限制

- 该插件支持基于 ARM 的设备，但它们至少必须是 ARMv7 设备。（树莓派 1 和 Zero 不受支持）。
- 该插件可以在树莓派上运行。尽管它仍然可以有用，但不要期望太多。一般来说，树莓派缺乏处理能力，可能无法流式传输你的媒体，因此不推荐在这样的设备上使用该插件。
- 该插件无法为你添加/挂载任何额外的 USB 或其他设备。这是 Home Assistant 的限制。如果你想使用额外的设备，你必须自己修改主机系统，这不受 Home Assistant 项目或社区插件团队的支持。
- Plex Pass 为你提供对新功能的专属访问，这些功能通过媒体服务器的 Beta 版本渠道提供。目前，运行此“Beta”版本不受该插件的支持。
- 该插件不支持通过 DLNA 的 Plex。

## 更新日志与版本

该存储库使用 [GitHub 的 Releases][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下情况进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

你有几种选择可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

你也可以 [在这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）的个人，允许其在不受限制的条件下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许其获得软件的人这样做，需遵守以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重大部分中。

该软件按“原样”提供，不附加任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途的适用性以及不侵权的保证。在任何情况下，作者或版权持有者均不对因使用本软件或其他交易而造成的任何索赔、损害或其他责任承担责任，不论是在合同、侵权或其他方式下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_plex&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-plex/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-plex-media-server/54383?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-plex/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-plex/releases
[semver]: https://semver.org/spec/v2.0.0.html