# Home Assistant 社区附加组件：Bazarr

下载和管理 Sonarr 和 Radarr 的字幕。

## 安装

这个附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开这个附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Bazarr”附加组件。
1. 检查“Bazarr”附加组件的日志以查看一切是否顺利。
1. 点击“打开网页界面”以打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/bazarr/Donwloads/complete` 和
  `/media/bazarr/Donwloads/incomplete`

## 配置

_该附加组件运行不需要任何配置。_

## 更新日志 & 发布版本

该库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布版本基于 [语义化版本控制][semver]，格式为
`MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：与版本不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- 前往 [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 获取附加组件支持和功能请求。
- 前往 [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 的讨论和提问。
- 访问 Home Assistant [社区论坛][forum]。
- 加入 [Reddit 版块][reddit] 在 [/r/homeassistant][reddit]。

您也可以 [在此处打开一个问题][issue] GitHub。

## 作者 & 贡献者

该库的原始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，允许其在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可及/或销售该软件的副本，同时允许提供该软件的人这样做，但须遵守以下条件：

以上版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

该软件按“原样”提供，不作任何明确或暗示的担保，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者对任何索赔、损害或其他责任均不负责，无论是在合同诉讼、侵权或其他方面，由于使用该软件或与该软件相关的其他交易。

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