# Home Assistant 社区插件：Tautulli

Tautulli 是一个可以与您的 Plex 媒体服务器一起运行的应用程序，用于监控活动并跟踪各种统计信息。最重要的是，这些统计信息包括观看了什么、谁观看了、何时何地观看以及如何观看。所有统计信息都以美观简洁的界面呈现，包含许多表格和图形，使您可以轻松向其他人炫耀您的服务器。

## 安装

该插件的安装非常简单，与安装其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Tautulli”插件。
1. 检查“Tautulli”插件的日志以查看一切是否顺利。
1. 点击“打开 Web UI”以打开 Tautulli 网站并按照向导操作。

**注意**：启动插件可能需要几分钟（特别是首次启动插件时）。

## 配置

**注意**：_在更改配置后，请及时重启插件。_

插件配置示例：

```yaml
log_level: info
```

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要进行更改，使其更加详细或简洁，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现了严重错误。插件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 嵌入到 Home Assistant

可以将 Tautulli 直接嵌入到 Home Assistant 中，使您能够通过 Home Assistant 前端访问您的 Tautulli。

Home Assistant 提供了 `panel_iframe` 集成，供此目的使用。

配置示例：

```yaml
panel_iframe:
  tautulli:
    title: Tautulli
    icon: mdi:filmstrip
    url: http://addres.to.your.home.assistant:8181
```

## 更新日志与发布

本存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得解答：

- 在 [Home Assistant 社区插件 Discord 聊天服务器][discord] 上获取插件支持和功能请求。
- 在 [Home Assistant Discord 聊天服务器][discord-ha] 上进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在此处 [打开一个问题][issue] 在 GitHub 上。

## 作者与贡献者

本存储库的最初设置由 [Joakim Sørensen][ludeeus] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

- 版权 (c) 2018-2019 Joakim Sørensen
- 版权 (c) 2019-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，以及允许提供软件的人遵守以下条件：

上述版权说明和本许可说明应包含在软件的所有副本或实质部分中。

该软件是按“原样”提供的，不提供任何类型的明确或隐含保证，特别是但不限于对适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件相关的使用或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_tautulli&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-tautulli/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tautulli/68745
[issue]: https://github.com/hassio-addons/addon-tautulli/issues
[ludeeus]: https://github.com/ludeeus
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-tautulli/releases
[semver]: https://semver.org/spec/v2.0.0.html