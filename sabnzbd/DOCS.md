# Home Assistant 社区插件: SABnzbd

免费且易于使用的二进制新闻阅读器。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下方的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“SABnzbd”插件。
1. 检查“SABnzbd”插件的日志，以查看是否一切正常。
1. 点击“打开网页界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，`/media/sabnzbd/Donwloads/complete` 和 `/media/sabnzbd/Donwloads/incomplete`。

## 配置

_此插件不需要任何配置即可运行。_

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能记录变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将基于以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择来获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入在 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

您也可以在这里 [报告问题][issue] 于 GitHub。

## 作者与贡献者

此存储库的原始设置由 [Franck Nijhof][frenck] 创建。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理该软件时不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并且允许向他们提供软件的人这样做，受以下条件的限制：

上述版权声明和此许可声明应包括在所有软件副本或实质性部分中。

该软件是“按原样”提供的，未提供任何类型的保证，无论是明示或暗示的，包括但不限于对适销性的保证、特定目的的适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用该软件或与该软件或其他交易有关的任何索赔、损害或其他责任均不承担责任，无论是合同、侵权或其他形式。

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