# Home Assistant Community Add-on: SABnzbd

免费且简单的二进制新闻阅读器。

## 安装

该插件的安装相当简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“SABnzbd”插件。
1. 检查“SABnzbd”插件的日志，以查看一切是否顺利。
1. 点击“打开 WEB 界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/sabnzbd/Donwloads/complete` 和
  `/media/sabnzbd/Donwloads/incomplete`

## 配置

_该插件不需要任何配置即可运行。_

## 更新日志和发布

该仓库使用 [GitHub 的发布功能][releases] 保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您有多种选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的条件下处理该软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许向其提供软件的人在以下条件下这样做：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

该软件是按“原样”提供的，没有任何类型的担保，无论是明示还是暗示，包括但不限于对适销性、特定目的适用性和非侵权的担保。在任何情况下，作者或版权持有者都对任何因使用该软件或与之相关的使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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