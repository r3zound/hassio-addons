# Home Assistant Community Add-on: Bazarr

下载并管理 Sonarr 和 Radarr 的字幕。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮以在你的 Home Assistant 实例中打开该插件。

   [![在你的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮来安装该插件。
1. 启动“Bazarr”插件
1. 检查“Bazarr”插件的日志以查看一切是否顺利。
1. 点击“打开网络界面”以打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 设置下载文件夹，例如，
  `/media/bazarr/Donwloads/complete` 和
  `/media/bazarr/Donwloads/incomplete`

## 配置

_该插件运行不需要任何配置。_

## 更新日志与版本

该存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [Semantic Versioning][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下规则进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几个选项可以得到答案：

- [Home Assistant Community Add-ons Discord 频道][discord] 提供插件支持和功能请求。
- [Home Assistant Discord 频道][discord-ha] 进行一般 Home Assistant 讨论和问答。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

你也可以 [在这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，可以在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包括在所有副本或实质性部分的该软件中。

该软件按“原样”提供，不附有任何形式的明示或暗示保证，包括但不限于对适销性、特定用途适合性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用、其他交易或软件或与软件相关的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权或其他。

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