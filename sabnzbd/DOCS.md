# Home Assistant Community Add-on: SABnzbd

免费且简单的二进制新闻阅读器。

## 安装

此附加组件的安装相当简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以打开您 Home Assistant 实例上的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮安装附加组件。
1. 启动“SABnzbd”附加组件。
1. 检查“SABnzbd”附加组件的日志以查看是否一切正常。
1. 点击“打开网页界面”以打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/sabnzbd/Donwloads/complete` 和
  `/media/sabnzbd/Donwloads/incomplete`

## 配置

_此附加组件不需要任何配置即可运行。_

## 变更日志 & 发布

此仓库使用 [GitHub 的 releases][releases]
功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用
`MAJOR.MINOR.PATCH` 的格式。简单来说，版本将根据以下内容进行增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件的
  支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home
  Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

本仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人，
在不受限制的情况下处理本软件，包括但不限于使用、复制、修改、合并、发布、分发、重新授权和/或出售本软件的副本的权利，并允许向被提供软件的人这样做，附带以下条件：

上述 copyright 通知和此权限通知应包含在所有副本或软件的实质性部分中。

本软件按“原样”提供，没有任何明示或暗示的担保，包括但不限于对适销性、
适用于特定目的和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼或其他方面。

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