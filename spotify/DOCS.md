# Home Assistant 社区插件：Spotify Connect

Home Assistant Spotify Connect 插件允许您使用运行 Home Assistant 的设备播放 Spotify 音乐。此插件使用 Spotify Connect 协议，使其成为可以被所有官方客户端控制的设备。

例如；在 Raspberry Pi 上运行 Home Assistant 并安装此插件将允许您在 Pi 上播放 Spotify 音乐。因此，您所要做的就是将音响系统连接到 Pi，并开始播放音乐！

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 选择您的音频输出设备并点击 `保存`。
1. 启动“Spotify Connect”插件。
1. 检查“Spotify Connect”的日志以查看是否一切顺利。
1. 准备就绪！

## 配置

**注意**：_记得在更改配置时重启插件。_

示例插件配置：

```yaml
log_level: info
name: HomeAssistant
bitrate: 320
initial_volume: 50
username: frenck@example.com
password: MySpotifyPassword
autoplay: true
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁的输出，当您处理未知问题时，这可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：运行时错误，无需立即采取行动。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您正在排除故障。

将 `log_level` 设置为 `debug` 也会在 Spotify 服务上开启调试模式。

### 选项：`name`

您的设备名称（Spotify Connect 目标），在官方 Spotify 客户端中显示。

### 选项：`bitrate`

Spotify 应使用的比特率。越高，音质越好，但插件消耗的流量也越多。

有效值：`96`、`160`（默认）或 `320`。

### 选项：`initial_volume`

初始音量，范围从 0-100%。此设置在插件启动或从崩溃恢复时生效。

initial_volume: 50 # 可选

### 选项：`username`

**重要**：_这需要一个 Spotify Premium 账户！_

您用于登录 Spotify Premium 账户的用户名。设置此项将使插件专属于您的账户。

这在遇到网络发现问题时或不允许您网络上的访客使用该插件时非常有用。

### 选项：`password`

您用于登录 Spotify Premium 账户的密码。

### 选项：`autoplay`

当达到队列末尾时，Spotify 是否应自动播放类似的歌曲。

## 已知问题和限制

- 此插件需要一个 Spotify Premium 账户。

## 更新日志 & 发布信息

该存储库使用 [GitHub 的发布][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有多种方式可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

您还可以 [在这里报告问题][issue] GitHub。

## 作者 & 贡献者

该存储库的原始设置由 [Franck Nijhof][frenck] 创建。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，无限制地处理该软件，包括不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不作任何类型的保证，无论明示或暗示，包括但不限于对适销性、适合特定目的和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或其他交易而导致的任何索赔、损害或其他责任负责，无论是在合同、侵权还是其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_spotify&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-spotify-connect/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-spotify-connect/61210?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-spotify-connect/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-spotify-connect/releases
[semver]: http://semver.org/spec/v2.0.0.htm