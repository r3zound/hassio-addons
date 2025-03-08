# Home Assistant 社区插件：The Lounge

一个自托管的网页 IRC 客户端，使用现代而流畅的界面，支持主题、推送通知、链接预览、文件上传等功能。完全跨平台且适合移动设备使用。

## 安装

此插件的安装相当简单，与安装其他 Home Assistant 插件并无不同。

1. 点击下面的 Home Assistant My 按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 配置“The Lounge”插件。（见下文）
1. 启动“The Lounge”插件。
1. 检查“The Lounge”插件的日志以查看其运行情况。
1. 点击“打开 Web UI”。

## 配置

**注意**：_记得在更改配置时重新启动插件。_

示例插件配置：

```yaml
log_level: info
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
default_theme: default
themes:
  - thelounge-theme-material
users:
  - hassio
```

### 选项：`log_level`

`log_level`选项控制插件的日志输出级别，可以设置为更详细或更简洁，这在处理未知问题时可能很有用。可能的值有：

- `trace`：显示每一个细节，比如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误，插件无法使用。

请注意，每个级别会自动包含更高级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您在进行故障排除。

### 选项：`ssl`

启用/禁用应用程序上的 SSL（HTTPS）。设置为 `true` 以启用，设置为 `false` 则禁用。

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置。_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置。_

### 选项：`default_theme`

每个用户的默认主题。预安装的主题为 `default` 和 `morning`。您可以使用下一个选项添加更多。

**注意**：_主题仍然可以在应用程序的设置中更改。_

### 选项：`themes`

要安装的主题列表，可以在 [npm 注册表][themes] 中找到。使用包的名称。（参考上面的示例）

### 选项：`users`

要设置的用户列表。最初，这些用户将使用默认密码 `hassio`。**确保您在登录后尽快更改密码！**

## 更新日志 & 发布

本存储库使用 [GitHub 的 releases][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并采用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit] 中。

您也可以在 GitHub 上 [打开一个问题][issue]。

## 作者 & 贡献者

本存储库的初始设置由 [Timmo][timmo] 提供。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Timmo

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理该软件的权限，包括但不限于使用、复制、修改、合并、发表、分发、再授权和/或出售软件副本的权利，并允许提供软件的人这样做，条件如下：

上述版权声明和此权限声明应包含在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，无任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用该软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_thelounge&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-thelounge/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/?u=timmo001
[issue]: https://github.com/hassio-addons/addon-thelounge/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-thelounge/releases
[semver]: https://semver.org/spec/v2.0.0.html
[themes]: https://www.npmjs.com/search?q=keywords%3Athelounge-theme
[timmo]: https://github.com/timmo001