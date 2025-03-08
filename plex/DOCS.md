# Home Assistant 社区插件：Plex 媒体服务器

Plex 插件将您最喜欢的媒体聚集在一个地方，使其美观且易于享受。该插件提供的 Plex 媒体服务器，整理您的个人视频、音乐和照片收藏，并将它们流媒体传输到您所有的设备上。

## 安装

该插件的安装非常简单，与安装其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 单击“安装”按钮以安装该插件。
1. 访问 <https://www.plex.tv/claim> 并获取您的声明令牌。
1. 使用您在上一步中获得的声明代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex 媒体服务器”插件。
1. 检查“Plex 媒体服务器”的日志，以查看一切是否顺利。
1. 登录 Plex 管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用 `/share` 和 `/media` 作为基本目录。

## 配置

**注意**：_当更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，在处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`claim_code`

要允许您的服务器登录到您的 Plex 帐户，它需要一个所谓的“声明代码”。登录到 Plex 允许 Plex 定位并连接到您的服务器，并解锁各种功能。

要获取您的代码，请访问 <https://www.plex.tv/claim>。

该代码仅被插件使用一次。一旦服务器成功与 Plex 进行身份验证，代码可以被删除。

## 解决与 Plex 的连接问题

Plex 的设置相当简单且容易。大多数设置会自动检测。然而，它无法识别其在您的家庭网络上的 IP。这可能会导致一些 Plex 应用程序（例如，三星 Tizen Plex 应用程序）出现连接问题。

这并不是 Plex 的错，而是因为该插件运行的 Docker 生态系统的原因。幸运的是，Plex 中有一个选项来帮助解决这个问题，但它有点隐藏。

- 登录到 Plex 网页界面。
- 转到设置。
- 点击服务器选项卡。
- 在左侧，选择“网络”。
- 确保您正在查看高级视图。右上角有一个“显示高级”按钮。
- 将您的自定义 URL 添加到“自定义服务器访问 URL”字段。

自定义 URL 是 Plex 客户端将用来尝试连接到 Plex 的附加 URL。如果您希望，可以列出多个 URL，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题和限制

- 此插件支持基于 ARM 的设备，但它们必须至少是 ARMv7 设备。（树莓派 1 和 Zero 不受支持）。
- 此插件可以在树莓派上运行。虽然仍然可以使用，但请不要期望太多。一般来说，树莓派缺乏处理能力，可能无法流式传输您的媒体；因此，不建议在此类设备上使用该插件。
- 此插件无法为您添加/挂载任何额外的 USB 或其他设备。这是 Home Assistant 的限制。如果您想使用额外的设备，您需要自己修改主机系统，并且不受 Home Assistant 项目或社区插件团队的支持。
- Plex Pass 可以让您独占访问新功能，这些功能通过媒体服务器的 Beta 版本渠道提供。此时，运行此“Beta”版本不受该插件的支持。
- 此插件不支持通过 DLNA 使用 Plex。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义化版本控制][semver]，并使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下规则递增：

- `MAJOR`：不兼容或重大变化。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几个选项来获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并且允许提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重大部分中。

该软件是“按原样”提供的，不提供任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者对任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面，由于使用或与软件的使用或其他交易引起的。

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