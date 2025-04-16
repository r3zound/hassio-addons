# Home Assistant Community Add-on: SABnzbd

免费且易用的二进制新闻阅读器。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“SABnzbd”插件
1. 检查“SABnzbd”插件的日志以查看是否一切正常。
1. 点击“打开网页界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 设置下载文件夹，例如， `/media/sabnzbd/Donwloads/complete` 和 `/media/sabnzbd/Donwloads/incomplete`

## 配置

_此插件无需任何配置即可运行。_

## 更新日志与版本

该存储库使用 [GitHub 的发布][releases] 功能记录更新日志。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选择来获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 论坛][reddit]

您还可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可协议

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重大部分中。

该软件是“按原样”提供的，不提供任何类型的保证，包括但不限于适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是由于合同、侵权或其他原因。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sabnzbd&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-sabnzbd/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-sabnzbd/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-sabnzbd/releases
[semver]: http://semver.org/spec/v2.0.0.html