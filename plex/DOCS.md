# Home Assistant 社区附加组件：Plex 媒体服务器

Plex 附加组件将您最喜欢的媒体聚集在一个地方，使其美观且易于享受。该附加组件提供的 Plex 媒体服务器会组织您的个人视频、音乐和照片收藏，并将其流式传输到您的所有设备上。

## 安装

此附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以打开您 Home Assistant 实例中的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件.][addon-badge]][addon]

1. 点击 “安装” 按钮以安装该附加组件。
1. 访问 <https://www.plex.tv/claim> 并获取您的声明令牌。
1. 使用您在上一步获得的声明代码更新附加组件配置。
1. 保存附加组件配置。
1. 启动 “Plex 媒体服务器” 附加组件。
1. 检查 “Plex 媒体服务器” 的日志以查看是否一切正常。
1. 登录 Plex 管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用 `/share` 和 `/media` 作为基础目录。

## 配置

**注意**：_更改配置时，请记得重新启动附加组件。_

示例附加组件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在您处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，如调用的所有内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常情况而非错误。
- `error`：运行时错误，无需立即采取行动。
- `fatal`：发生严重错误。附加组件变得不可用。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在故障排除。

### 选项：`claim_code`

为了使您的服务器能够登录到您的 Plex 帐户，它需要一个所谓的 “声明代码”。登录 Plex 允许 Plex 找到并连接到您的服务器，并解锁各种功能。

为了获取您的代码，请访问 <https://www.plex.tv/claim>。

此代码仅被附加组件使用一次。一旦服务器成功通过 Plex 认证，该代码可以被删除。

## 解决与 Plex 的连接问题

Plex 的设置相对简单且容易。大多数设置都是自动检测的。然而，它无法识别您家庭网络上的 IP 地址。这可能会导致某些 Plex 应用程序（例如，三星 Tizen Plex 应用程序）出现连接问题。

这不是 Plex 的错，而是因为该附加组件运行在 Docker 生态系统中。幸运的是，Plex 中有一个选项可以帮助解决此问题，但它有些隐蔽。

- 登录 Plex 网络界面。
- 进入设置。
- 点击服务器选项卡。
- 在左侧，选择 “网络”。
- 确保您查看的是高级视图。右上角有一个 “显示高级” 按钮。
- 将您的自定义 URL 添加到 “自定义服务器访问 URL” 字段。

自定义 URL 是 Plex 客户端用于尝试连接到 Plex 的附加 URL。如果需要，您可以用逗号分隔列出多个。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题和限制

- 此附加组件支持基于 ARM 的设备，但它们必须至少是 ARMv7 设备。（不支持 Raspberry Pi 1 和 Zero）。
- 此附加组件可以在 Raspberry Pi 上运行。尽管它仍然可以有助于使用，但不要期望太多。一般而言，Pi 缺乏处理能力，可能无法流式传输您的媒体；因此，不建议在此类设备上使用此附加组件。
- 此附加组件无法为您添加/挂载任何额外的 USB 或其他设备。这是 Home Assistant 的限制。如果您希望使用额外的设备，您必须自行修改宿主系统，该操作不受 Home Assistant 项目或社区附加组件团队的支持。
- Plex Pass 使您可以独家访问通过媒体服务器的 Beta 版本频道提供的新功能。目前，运行此 “Beta” 版本不受此附加组件的支持。
- 此附加组件不支持通过 DLNA 使用 Plex。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能保持更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] (/r/homeassistant)。

您还可以在这里 [开个问题][issue] GitHub。

## 作者 & 贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，以不受限制的方式处理该软件，包括不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件副本的权利，并允许提供该软件的人这样做，但需满足以下条件：

上述版权声明和此许可声明应包含在所有副本或实质性部分的 Software 中。

该软件是“按原样”提供的，不提供任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面，因使用该软件或与该软件的使用或其他交易有关。

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