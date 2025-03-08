# Home Assistant 社区插件：Sonarr

适用于新闻组和 BitTorrent 用户的智能 PVR。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 单击“安装”按钮以安装该插件。
1. 启动“Sonarr”插件。
1. 检查“Sonarr”插件的日志以查看一切是否顺利。
1. 单击“打开网页界面”以打开 Sonarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即将插件放入 Home Assistant 侧边栏的切换）。要使其正常工作，需要考虑的变量太多，如果我们这样做，将很容易导致问题。您可以考虑使用 iframe 面板代替。

## 更新日志与版本发布

此代码库使用 [GitHub 的发布][releases] 功能保持更改日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您也可以在这里 [报告问题][issue] GitHub。

## 作者与贡献者

此代码库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及其相关文档文件（“软件”）副本的人，不受限制地使用软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在软件的所有副本或 substantial 部分中。

软件是以“原样”提供的，没有任何形式的保证，无论是明确的还是隐含的，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对因使用软件或与软件相关的其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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