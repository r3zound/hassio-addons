# Home Assistant 社区插件：Plex 媒体服务器

Plex 插件将您最喜欢的媒体集中在一个地方，使其既美观又易于享用。此插件提供的 Plex 媒体服务器，组织您的个人视频、音乐和照片集合，并将其流式传输到您的所有设备。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 前往 <https://www.plex.tv/claim> 并获取您的索取令牌。
1. 使用您在上一步中获得的索取代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex 媒体服务器”插件。
1. 检查“Plex 媒体服务器”的日志以查看一切是否顺利。
1. 登录到 Plex 管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用 `/share` 和 `/media` 作为基础目录。

## 配置

**注意**：_修改配置时，请务必重新启动插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要复制和粘贴！请自行创建！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁的输出，这在您处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常情况，但不是错误。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：发生了严重错误，插件无法使用。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这也是推荐的设置，除非您正在进行故障排除。

### 选项：`claim_code`

要允许您的服务器登录到您的 Plex 账户，必须使用所谓的“索取代码”。登录 Plex 使 Plex 能够定位并连接到您的服务器并解锁各种功能。

要获取您的代码，请前往 <https://www.plex.tv/claim>。

此代码只被插件使用一次。服务器与 Plex 成功认证后，该代码可以移除。

## 解决 Plex 连接问题

Plex 的设置非常简单，而且相对容易。大多数设置会自动检测到。然而，它未能识别家庭网络中的 IP。这可能会导致一些 Plex 应用程序的连接问题，例如，三星 Tizen Plex 应用程序。

这并不是 Plex 的错误，而是因为插件运行的 Docker 生态系统。幸运的是，Plex 提供了一个选项来帮助解决这个问题，不过稍显隐藏。

- 登录到 Plex 网络界面。
- 转到设置。
- 点击服务器选项卡。
- 在左侧，选择“网络”。
- 确保您正在查看高级视图。右上角会有一个“显示高级”按钮。
- 将您的自定义 URL 添加到“自定义服务器访问 URL”字段中。

自定义 URL 是 Plex 客户端将尝试连接 Plex 的其他 URL。如果需要，您可以列出多个，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题和限制

- 此插件支持 ARM 架构的设备，但它们必须至少是 ARMv7 设备。（不支持 Raspberry Pi 1 和 Zero）。
- 此插件能够在 Raspberry Pi 上运行。尽管它仍然可能有用，但不要期望过高。一般来说，Pi 缺乏处理能力，可能无法流式传输您的媒体；因此不建议在此类设备上使用此插件。
- 此插件无法为您添加/挂载任何额外的 USB 或其他设备。这是 Home Assistant 的限制。如果您想使用额外的设备，必须自行修改主机系统，Home Assistant 项目或社区插件团队不支持此操作。
- Plex Pass 让您独家访问通过媒体服务器的 Beta 版本渠道提供的新功能。目前，运行此“Beta”版本不受此插件的支持。
- 此插件不支持基于 DLNA 的 Plex。

## 更新日志与版本发布

本存储库使用 [GitHub 的版本发布][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种选择来获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

本存储库的原始设置者为 [Franck Nijhof][frenck]。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此无偿授予任何获取此软件及其相关文档文件（“软件”）副本的人，处理该软件的权利，不受任何限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本的权利，以及允许向其提供该软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或主要部分的软件中。

本软件按“原样”提供，不提供任何形式的担保，无论是明确的或隐含的，包括但不限于对商销性、对特定目的的适用性和不侵权的担保。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他情况下，是否因使用本软件或与软件或其他交易有关的行为而引起。

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