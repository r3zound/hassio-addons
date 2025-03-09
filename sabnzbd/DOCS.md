# Home Assistant Community Add-on: SABnzbd

免费且易于使用的二进制新闻阅读器。

## 安装

该插件的安装非常简单，与安装其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“SABnzbd”插件
1. 检查“SABnzbd”插件的日志，以查看一切是否顺利。
1. 点击“打开 Web 界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/sabnzbd/Donwloads/complete` 和
  `/media/sabnzbd/Donwloads/incomplete`

## 配置

_此插件不需要任何配置即可运行。_

## 更新日志与发行版

该存储库使用 [GitHub 的发行版][releases]
功能维护更新日志。

发行版基于 [语义版本控制][semver]，采用格式
`MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在 [这里打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 提供。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理软件时不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许向之提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

软件是按“原样”提供的，没有任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因软件或使用或以其他方式与软件相关的交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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