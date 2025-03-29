# Home Assistant Community Add-on: Plex 媒体服务器

Plex 插件将您最喜爱的媒体聚集在一个地方，使其美观且易于享受。此插件提供的 Plex 媒体服务器组织您的个人视频、音乐和照片收藏，并将它们流式传输到您所有的设备上。

## 安装

此插件的安装非常简单，与安装其他 Home Assistant 插件没有太大区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 前往 <https://www.plex.tv/claim> 并获取您的索赔令牌。
1. 使用您在上一步中获得的索赔代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex 媒体服务器”插件。
1. 检查“Plex 媒体服务器”的日志，以查看一切是否顺利进行。
1. 登录 Plex 管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用 `/share` 和 `/media` 作为基础目录。

## 配置

**注意**：_当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要复制和粘贴！请创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更多或更少的详细信息，这在处理未知问题时可能会很有用。可能的值有：

- `trace`: 显示每个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的异常情况。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 发生了严重错误，插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

### 选项: `claim_code`

为了让您的服务器能够登录您的 Plex 帐户，它需要一个所谓的“索赔代码”。登录 Plex 允许 Plex 定位并连接到您的服务器，同时解锁各种功能。

为了获取您的代码，请前往 <https://www.plex.tv/claim>。

此代码只会被插件使用一次。只要服务器成功通过 Plex 认证，便可以移除该代码。

## 解决与 Plex 的连接问题

Plex 的设置相当简单并且容易。大多数设置会自动检测。然而，它无法识别您家庭网络上的 IP，这可能会导致某些 Plex 应用（例如，三星 Tizen Plex 应用）的连接问题。

这并不是 Plex 的错，而是由于 Docker 生态系统的原因，插件就是在其中运行的。幸运的是，Plex 中有一个选项可以帮助解决此问题，但它稍微有些隐蔽。

- 登录 Plex 网页界面。
- 转到设置。
- 点击服务器选项卡。
- 在左侧，选择“网络”。
- 确保您正在查看高级视图。
  右上角有一个“显示高级”按钮。
- 将您的自定义 URL 添加到“自定义服务器访问 URL”字段。

自定义 URL 是 Plex 客户端将使用的额外 URL 以尝试连接到 Plex。您可以根据需要列出多个 URL，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题和限制

- 此插件支持基于 ARM 的设备，但必须至少是 ARMv7 设备（Raspberry Pi 1 和 Zero 不被支持）。
- 此插件可以在 Raspberry Pi 上运行。虽然它仍然可以有用，但请不要期望太多。一般来说，Pi 缺乏处理能力，可能无法流式传输您的媒体，因此不建议在此类设备上使用此插件。
- 此插件无法为您添加/挂载任何额外的 USB 或其他设备。这是 Home Assistant 的限制。如果您想使用额外设备，必须自行修改主机系统，并且不会得到 Home Assistant 项目或社区插件团队的支持。
- Plex Pass 为您提供对新功能的独占访问，这些功能可以通过媒体服务器的 Beta 版本频道获得。目前，运行此“Beta”版本不被此插件支持。
- 此插件不支持通过 DLNA 访问 Plex。

## 更新日志与发布

本存储库使用 [GitHub 的发布][releases] 功能来保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本基于以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强功能。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题？

您有几种选择可以得到答案：

- 在 [Home Assistant Community Add-ons Discord 聊天服务器][discord] 上获取插件支持和功能请求。
- 在 [Home Assistant Discord 聊天服务器][discord-ha] 上进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit]，在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获取此软件及其相关文档文件（“软件”）副本的人，处理该软件的权利，允许包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本，并允许向其提供该软件的人这样做， 但须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或该软件的实质性部分中。

该软件是按“原样”提供的，不提供任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人对因使用该软件或其使用的其他交易而引起的任何索赔、损害或其他责任概不负责，无论是由于合同、侵权或其他原因。

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