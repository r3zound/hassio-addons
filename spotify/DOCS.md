# Home Assistant 社区插件：Spotify Connect

Home Assistant Spotify Connect 插件允许您使用运行 Home Assistant 的设备来播放 Spotify 音乐。此插件使用 Spotify Connect 协议，使其成为可以被所有官方客户端控制的设备。

例如；在安装此插件的 Raspberry Pi 上运行 Home Assistant 将允许您在 Pi 上播放 Spotify 音乐。因此，您要做的就是将音响系统连接到 Pi 上并开始播放！

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 选择您的音频输出设备，并点击 `保存`。
1. 启动“Spotify Connect”插件。
1. 检查“Spotify Connect”的日志以查看是否一切正常。
1. 准备就绪！

## 配置

**注意**：_更改配置时，请记得重新启动插件。_

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

**注意**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会有用。可能的值有：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常发生，但并不是错误。
- `error`：运行时错误，不需要立即处理。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在故障排除。

将 `log_level` 设置为 `debug` 还会在 Spotify 服务上启用调试模式。

### 选项：`name`

您设备的名称（Spotify Connect 目标），按官方 Spotify 客户端上显示的名称。

### 选项：`bitrate`

Spotify 应使用的比特率。比特率越高，音质越好，但插件消耗的数据也越多。

有效值：`96`、`160`（默认）或 `320`。

### 选项：`initial_volume`

初始化音量，以 % 表示，范围为 0-100。此设置在插件启动或从崩溃恢复时生效。

initial_volume: 50 # 可选

### 选项：`username`

**重要**：_这需要一个 Spotify Premium 账户！_

您用于登录 Spotify Premium 账户的用户名。设置此项将将插件独占绑定到您的账户。

这在您的网络中遇到发现问题时或禁止网络中来宾使用该插件时非常有用。

### 选项：`password`

您用于登录 Spotify Premium 账户的密码。

### 选项：`autoplay`

Spotify 是否应该在队列结束时自动播放类似的歌曲。

## 已知问题和限制

- 此插件需要一个 Spotify Premium 账户。

## 更新日志与发行版本

该存储库使用 [GitHub 的版本][releases] 功能维护变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简单来说，版本号将根据以下方式增加：

- `MAJOR`：不兼容的或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有多种选择可以得到答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以 [在这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2018-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，使用本软件的权利， 包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售本软件的副本，并允许提供给本软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

本软件按“原样”提供，不提供任何形式的担保，无论是明示或暗示，包括但不限于对适销性、特定用途的适合性和非侵权的担保。在任何情况下，作者或版权持有者对任何索赔、损害或其他责任不承担责任，无论是因合同、侵权还是其他方式，因本软件或使用或其他交易而导致。

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