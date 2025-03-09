# ~~Home Assistant Community Add-on~~ Dianlight: Plex 媒体服务器

基于原始的 **Home Assistant Community Add-on: Plex 媒体服务器**

Plex 插件将您最喜欢的媒体集中在一个地方，使其美观且易于欣赏。本插件提供的 Plex 媒体服务器，组织了您的个人视频、音乐和照片收藏，并将其流式传输到您的所有设备。

## 安装

安装此插件非常简单，与安装其他 Home Assistant 插件没有区别。

1. 在 dianlight 插件商店中搜索“Plex 媒体服务器”插件并安装。
1. 浏览到 <https://www.plex.tv/claim> 并获取您的声明令牌。
1. 用您在上一步中获得的声明代码更新插件配置。
1. 保存插件配置。
1. 启动“Plex 媒体服务器”插件。
1. 检查“Plex 媒体服务器”的日志，以查看一切是否顺利。
1. 登录到 Plex 管理界面并完成设置过程。

**注意**：在添加媒体位置时，请使用 `/share` 作为基础目录。

## 配置

**注意**：_记得在配置更改后重启插件。_

示例插件配置：

```yaml
log_level: info
claim_code: claim-cAMrqFrenckFU4x445Tn
webtools: true
networkdisks:
 - //serverip/share
cifsusername: hassio
cifspassword: password 
cifsversion: "3.0"
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更少详细，这可能在您处理未知问题时非常有用。可能的值包括：

- `trace`：显示每个细节，例如调用的所有内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：运行时错误，但不需要立即处理。
- `fatal`：发生了严重错误，插件无法使用。

请注意，每个级别自动包括来自更严重级别的日志消息。例如，`debug` 级别还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项：`claim_code`

为了让您的服务器登录到您的 Plex 账户，它需要一个所谓的“声明代码”。登录 Plex 允许 Plex 定位并连接到您的服务器并解锁各种功能。

要获取您的代码，请浏览 <https://www.plex.tv/claim>。

该代码仅由插件使用一次。一旦服务器成功经过 Plex 身份验证，该代码便可以删除。

### 选项：`webtools`

[WebTools][webtools] 是一个插件，包含了 Plex 媒体服务器的一组工具。

一些工具包括：

- 管理字幕 (Subs)
- 日志 (PMS)
- UAS (不支持的应用商店)
- 查找媒体 (FindMedia)
- 播放列表 (PlayLists)
- 技术信息 (TechInfo)

该插件还允许您添加和安装自定义插件。

将此变量设置为 `true` 以启用它。

### 选项：`networkdisks`  <span style="color:red">需要禁用保护模式才能工作</span>

是启动时要挂载的网络共享列表。挂载的驱动程序位于 `/<SERVER>/<SHARE>` 目录中。

#### 选项：`cifsusername` 

用于挂载网络共享的用户名

#### 选项：`cifspassword` 

用于挂载网络共享的密码

#### 选项：`cifsversion`

要使用的 CIFS 版本。默认值 `3.0`。
有效值为 `3.0`、`2.1`、`2.0`、`1.0`。 

## 解决与 Plex 的连接问题

Plex 设置相对简单且易于配置。大多数设置都是自动检测的。然而，它未能识别在您的家庭网络上的 IP。这可能导致某些 Plex 应用程序（例如，三星 Tizen Plex 应用程序）的连接问题。

这并不是 Plex 的错，而是由于 Docker 生态系统的原因，该插件在其中运行。幸运的是，Plex 中有一个选项可以帮助解决这个问题，但它有点隐藏。

- 登录到 Plex 网络界面。
- 转到设置。
- 点击服务器选项卡。
- 在左侧选择“网络”。
- 确保您查看的是高级视图。右上角有一个按钮“显示高级”。
- 将自定义 URL 添加到“自定义服务器访问 URL”字段。

自定义 URL 是 Plex 客户端将用于尝试连接到 Plex 的额外 URL。您可以列出多个 URL，用逗号分隔。

示例：

```txt
http://hassio.local:32400,http://192.168.1.88:32400,http://mydomain.duckdns.org:32400
```

## 端口 1900 插件冲突

Plex 媒体服务器使用端口 `1900` 访问 Plex DLNA 服务器。此端口也被多个其他插件（如 AirSonos 和 UniFi 插件）使用。

如果它们发生冲突，Plex 媒体服务器插件将无法启动。在 Hass.io 系统日志中会显示以下错误消息：

```txt
[hassio.docker] Can't start addon_40817795_plex: 500 Server Error:
Internal Server Error ("driver failed programming external connectivity
on endpoint addon_40817795_plex):
Error starting userland proxy: listen udp 0.0.0.0:1900:
bind: address already in use
```

您有两个选择：

- 禁用或删除冲突的插件
- 将端口号 1900 更改为其他端口。

最后一个选项将导致您失去 Plex 媒体服务器的 DLNA 功能。

## 已知问题和限制

- 此插件确实支持 ARM 架构的设备，然而，它们必须至少是 ARMv7 设备。（树莓派 1 和 Zero 不受支持）。
- 此插件可以在树莓派上运行。虽然仍然可以有用，但不要期望太多。一般而言，树莓派缺乏处理能力，可能无法流式传输您的媒体；因此不建议在此类设备上使用此插件。
- ~~此插件无法为您添加/挂载任何额外的 USB 或其他设备。这是 Hass.io 的限制。如果您希望使用额外设备，必须自行修改主机系统，Hass.io 或社区插件团队不支持此操作。~~
- Plex Pass 使您独享对新功能的访问，这些功能通过媒体服务器的 Beta 版本渠道提供。目前，运行此“Beta”版本不受此插件的支持。

## 更新日志与版本

此存储库使用 [GitHub 的 Releases][releases] 功能维护更改日志。日志的格式基于
[保持更改日志][keepchangelog]。

版本基于 [语义化版本控制][semver]，使用格式 ``MAJOR.MINOR.PATCH``。简而言之，版本将根据以下内容递增：

- ``MAJOR``：不兼容或重大更改。
- ``MINOR``：向后兼容的新功能和增强。
- ``PATCH``：向后兼容的 bug 修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

<!--
- [Home Assistant Community Add-ons Discord chat server][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord chat server][discord-ha] 以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子板块][reddit] 在 [/r/homeassistant][reddit]
-->

您也可以在此处 [提出问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2020 Franck Nijhof

特此免费授权任何获取此软件及其相关文档文件（以下简称“软件”）副本的人，不受限制地使用该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，以及允许其提供给他人按照以下条件进行。

上述版权声明和本许可声明应包含在所有副本或实质性部分的软件中。

该软件是“按原样”提供，不提供任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用、或与该软件有关的其他行为而引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼或其他情况下。

[contributors]: https://github.com/dianlight/addon-plex/graphs/contributors
<!--
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-plex-media-server/54383?u=frenck
[frenck]: https://github.com/frenck
-->
[issue]: https://github.com/dianlight/addon-plex/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
<!--
[reddit]: https://reddit.com/r/homeassistant
-->
[releases]: https://github.com/dianlight/addon-plex/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[webtools]: https://github.com/ukdtom/WebTools.bundle/wiki