# Home Assistant Community Add-on: The Lounge

一个自托管的网络IRC客户端，使用现代且简洁的界面，支持主题、推送通知、链接预览、文件上传等功能。完全跨平台并且适合移动设备。

## 安装

该附加组件的安装非常简单，与安装其他Home Assistant附加组件没有区别。

1. 点击下面的Home Assistant我的按钮，以在您的Home Assistant实例中打开该附加组件。

   [![在您的Home Assistant实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 配置“The Lounge”附加组件。（见下文）
1. 启动“The Lounge”附加组件。
1. 检查“The Lounge”附加组件的日志以查看其运行情况。
1. 点击“打开Web UI”。

## 配置

**注意**：_在更改配置后，请记得重启附加组件。_

示例附加组件配置：

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

### 选项： `log_level`

`log_level`选项控制附加组件的日志输出级别，可以更改为更详细或更简略的输出，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每个细节，比如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 出现严重错误，附加组件变得无法使用。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug`也会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在排除故障。

### 选项： `ssl`

启用/禁用应用程序的SSL（HTTPS）。设置为`true`以启用，设置为`false`则禁用。

### 选项： `certfile`

用于SSL的证书文件。

**注意**：_该文件必须存储在`/ssl/`中，这是默认位置_

### 选项： `keyfile`

用于SSL的私钥文件。

**注意**：_该文件必须存储在`/ssl/`中，这是默认位置_

### 选项： `default_theme`

每个用户的默认主题。预安装的主题有`default`和`morning`。您可以使用下一个选项添加更多主题。

**注意**：_主题仍然可以在应用程序的设置中更改_

### 选项： `themes`

要安装的主题列表，可以在[npm注册表][themes]中找到。使用包的名称。（参见上面的示例）

### 选项： `users`

要设置的用户列表。最开始，这些用户将使用默认密码`hassio`。**确保在登录后尽快更改密码！**

## 更新日志和发布

本存储库使用[GitHub的发布][releases]功能保持变更日志。

发布遵循[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的bug修复和包更新。

## 支持

有问题吗？

您可以通过几种方式获得解答：

- [Home Assistant Community Add-ons Discord聊天服务器][discord]以获得附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子板块][reddit]在[/r/homeassistant][reddit]中。

您也可以在GitHub上[这里打开一个问题][issue]。

## 作者与贡献者

本存储库的原始设置由[Timmo][timmo]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权 (c) 2019-2025 Timmo

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理软件，包括但不限于用于使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许提供给软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在所有副本或软件的实质性部分中。

软件是“按原样”提供的，不提供任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对由于使用软件或其他交易引起的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

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