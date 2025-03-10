# Home Assistant Community Add-on: Bazarr

下载并管理 Sonarr 和 Radarr 的字幕。

## 安装

此附加组件的安装相当简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Bazarr”附加组件
1. 检查“Bazarr”附加组件的日志，查看是否一切正常。
1. 点击“打开 Web UI”以打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/bazarr/Donwloads/complete` 和
  `/media/bazarr/Donwloads/incomplete`

## 配置

_此附加组件不需要任何配置即可运行。_

## 更新日志与版本

该存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

版本基于 [语义化版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]

您还可以在此处 [提出问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（统称为“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件副本的权利，并允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

该软件是“按原样”提供的，没有任何形式的保证，无论是明示还是暗示，包括但不限于适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对任何因合同、侵权或其他方式引起的索赔、损害或其他责任负责，无论是与软件或使用或其他交易有关。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_bazarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-bazarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-bazarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-bazarr/releases
[semver]: http://semver.org/spec/v2.0.0.html