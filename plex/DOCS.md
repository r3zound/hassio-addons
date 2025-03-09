# Home Assistant社区插件：Plex媒体服务器

Plex插件将您最喜爱的媒体集合在一个地方，使其美观且易于享受。此插件提供的Plex媒体服务器，组织您的个人视频、音乐和照片集合，并将其流式传输到您所有的设备上。

## 安装

此插件的安装非常简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下面的Home Assistant我的按钮，打开您Home Assistant实例中的插件。

   [![在您的Home Assistant实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 访问<https://www.plex.tv/claim>并获取您的索赔令牌。
1. 使用您在上一步中获得的索赔代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex媒体服务器”插件。
1. 检查“Plex媒体服务器”的日志以查看一切是否顺利。
1. 登陆到Plex管理界面并完成设置过程。

**注意**：添加媒体位置时，请使用`/share`和`/media`作为基本目录。

## 配置

**注意**：_更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level`选项控制插件的日志输出级别，可以更改为更加详细或减少详细，这在您处理未知问题时可能会有所帮助。可能的值为：

- `trace`: 显示每个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）感兴趣的事件。
- `warning`: 不是错误的异常事件。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现严重问题。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug`还会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐设置，除非您正在进行故障排除。

### 选项：`claim_code`

为了让您的服务器登录到您的Plex账户，它需要一个所谓的“索赔代码”。登录Plex允许Plex定位并连接到您的服务器，并解锁所有类型的功能。

要获取您的代码，请访问<https://www.plex.tv/claim>。

此代码仅被插件使用一次。服务器成功通过Plex身份验证后，可以删除该代码。

## 解决与Plex的连接问题

Plex的设置非常简单且容易。大多数设置会自动检测。尽管如此，它无法识别其在您家庭网络上的IP。这可能导致与一些Plex应用（例如，Samsung Tizen Plex应用）的连接问题。

这并不是Plex的错，而是因为这个插件运行的Docker生态系统。不过，Plex中有一个选项可以帮助解决这个问题，但稍显隐藏。

- 登录到Plex网页界面。
- 转到设置。
- 点击服务器选项卡。
- 在左侧，选择“网络”。
- 确保您查看的是高级视图。
  右上角有一个“显示高级”按钮。
- 将您的自定义网址添加到“自定义服务器访问网址”字段。

自定义网址是Plex客户端将使用的附加网址，以尝试连接到Plex。您可以列出多个网址，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 已知问题与限制

- 该插件支持ARM架构的设备，然而，设备至少必须是ARMv7设备。（Raspberry Pi 1和Zero不支持）。
- 此插件可以在Raspberry Pi上运行。虽然它仍然可能有用，但不要期望太多。一般来说，Pi缺乏处理能力，可能无法流式传输您的媒体；因此不建议在这种设备上使用此插件。
- 此插件无法为您添加/挂载任何额外的USB或其他设备。这是Home Assistant的限制。如果您想使用额外的设备，您需要自己修改主机系统，这不受Home Assistant项目或社区插件团队的支持。
- Plex Pass为您提供对新功能的独占访问，这些功能通过媒体服务器的Beta版本渠道提供。目前，这个“Beta”版本的运行不被此插件支持。
- 此插件不支持Plex通过DLNA进行访问。

## 更新日志与发行版本

该存储库使用[GitHub的发行版本][releases]功能维护变更日志。

发行版本基于[语义版本控制][semver]，使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容增量增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您可以通过几种方式获得解答：

- [Home Assistant社区插件Discord聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]进行一般Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子论坛][reddit]，在[/r/homeassistant][reddit]中。

您还可以在这里[打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的初始设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（以下简称“软件”）副本的人以无限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，以及允许提供软件的人这样做，但须符合以下条件：

以上版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件是按“原样”提供的，没有任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易中产生的、与软件相关的、与软件或其使用或其他交易相关的任何索赔、损害或其他责任承担责任。

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