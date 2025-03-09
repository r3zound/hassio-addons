# Home Assistant 社区插件: Readarr

书籍管理与自动化（电子书的 Sonarr）。

## 安装

此插件的安装相当简单，并与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开此插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Readarr”插件。
1. 检查“Readarr”插件的日志，以查看是否一切正常。
1. 点击“打开 Web 界面”以打开 Readarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件在运行时不需要任何配置。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，在 Home Assistant 侧边栏中放置插件的切换）。
  有太多变量需要考虑以确保此功能正常工作，如果我们要实现，将很容易破坏。您可以考虑使用 iframe 面板来代替。

## 更新日志与发布

该仓库使用 [GitHub 的发布][releases] 功能保持更新日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您可以通过几种方式获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费向任何获得本软件及相关文档文件（“软件”）复制的人授予权利，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重要部分中。

软件按“原样”提供，不提供任何类型的保证，无论是明示还是暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对因使用软件或其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_readarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-readarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-readarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-readarr/releases
[semver]: http://semver.org/spec/v2.0.0.html