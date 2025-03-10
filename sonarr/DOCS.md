# Home Assistant 社区插件：Sonarr

新sg和BT用户的智能PVR。

## 安装

这个插件的安装非常简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在你的 Home Assistant 实例中打开该插件。

   [![在你的 Home Assistant 实例中打开该插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Sonarr”插件。
1. 检查“Sonarr”插件的日志以确认一切顺利。
1. 点击“打开 WEB 界面”以打开 Sonarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件在运行时不需要任何配置。_

## 已知问题和限制

- 该插件不支持 Home Assistant 的 Ingress 特性（即，将插件放入 Home Assistant 侧边栏的切换）。
  需要考虑的变量太多，无法使其正常工作，并且如果我们这样做，则很容易出现故障。你可以考虑使用 iframe 面板作为替代。

## 更新日志和版本

这个仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

你有多种方式可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

你还可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

这个仓库的最初设置由 [Franck Nijhof][frenck] 进行。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，允许他们在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件的副本，以及允许向其提供软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件是按“原样”提供的，不提供任何种类的担保，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人不对因使用本软件或其他交易所引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他诉讼中。

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