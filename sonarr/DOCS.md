# Home Assistant 社区插件：Sonarr

为新闻组和 BitTorrent 用户提供的智能 PVR。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 按钮以打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Sonarr”插件。
1. 检查“Sonarr”插件的日志以查看一切是否顺利。
1. 点击“打开网页 UI”以打开 Sonarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即在 Home Assistant 侧边栏中放置插件的切换开关）。
  有太多变量需要考虑以使其正常工作，如果我们能做到，破坏它会非常简单。您可以考虑使用 iframe 面板代替。

## 更新日志与发布

这个仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，使用的格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有疑问吗？

您有几个选项可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该仓库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理该软件的权利，包括不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本，以及允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不附有任何种类的保证，无论是明示还是暗示，包括但不限于对适销性、特定目的适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对任何索赔、损害或其他责任承担责任，无论是在合同、侵权还是其他方面，因使用或其他交易中的软件或与之相关而引起的。

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