# Home Assistant Community Add-on: SABnzbd

免费的易用二进制新闻阅读器。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件并没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“SABnzbd”插件。
1. 检查“SABnzbd”插件的日志，以查看一切是否顺利。
1. 点击“打开网页界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/sabnzbd/Donwloads/complete` 和
  `/media/sabnzbd/Donwloads/incomplete`

## 配置

_此插件在运行时不需要任何配置。_

## 更新日志与版本

本仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方法可以获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

此仓库最初由 [Franck Nijhof][frenck] 设置。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，按以下条件自由处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件副本的权利，并允许向其提供软件的人这样做：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

该软件按"原样"提供，无任何形式的保证，明确或隐含，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用软件或与软件的使用或其他交易而引起的任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他方面。

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