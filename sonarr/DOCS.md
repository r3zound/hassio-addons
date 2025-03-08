# Home Assistant 社区附加组件：Sonarr

为新闻组和比特流用户提供的智能 PVR。

## 安装

该附加组件的安装非常简单，与安装其他任何 Home Assistant 附加组件没有区别。

1. 单击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 单击“安装”按钮以安装该附加组件。
1. 启动“Sonarr”附加组件。
1. 检查“Sonarr”附加组件的日志，以查看一切是否顺利。
1. 单击“打开网络界面”以打开 Sonarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该附加组件运行时无须任何配置。_

## 已知问题和限制

- 该附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑，才能使其正常工作，如果我们这样做，很容易会出问题。您可以考虑使用 iframe 面板。

## 更新日志与版本

该代码库使用 [GitHub 的发布][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下情况增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该代码库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，允许他们在不受限制的情况下处理本软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售本软件的副本，以及允许向其提供软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，没有任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用或与本软件或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同、侵权还是其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sonarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-sonarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-sonarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-sonarr/releases
[semver]: http://semver.org/spec/v2.0.0.html