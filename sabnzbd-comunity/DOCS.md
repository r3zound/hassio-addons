# Home Assistant Community Add-on: SABnzbd

免费且易用的二进制新闻阅读器。

## 安装

此附加组件的安装非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 按钮，以在你的 Home Assistant 实例中打开该附加组件。

   [![在你的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“SABnzbd”附加组件
1. 检查“SABnzbd”附加组件的日志，以查看一切是否正常。
1. 点击“打开网页界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，`/media/sabnzbd/Donwloads/complete` 和 `/media/sabnzbd/Donwloads/incomplete`

## 配置

_此附加组件不需要任何配置即可运行。_

## 更新日志与发布

本仓库使用 [GitHub 的 releases][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本号的增量将基于如下内容：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几个选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

你也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

本仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，允许在软件中不受限制地处理，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，遵守以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，未作任何形式的明示或暗示保障，包括但不限于对适销性、特定用途适用性和不侵权的保障。在任何情况下，作者或版权持有者均不对因使用该软件或与之相关的其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

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