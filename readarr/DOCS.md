# Home Assistant Community Add-on: Readarr

书籍管理和自动化（电子书的 Sonarr）。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件相比并没有不同。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Readarr”插件
1. 检查“Readarr”插件的日志以查看一切是否正常。
1. 点击“打开 Web 界面”以打开 Readarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件在运行时不需要任何配置_。

## 已知问题和限制

- 该插件不支持 Home Assistant 的 Ingress 功能（即，将插件放在 Home Assistant 侧边栏中的切换）。
  考虑到要处理的变量太多，使其正常工作非常困难，如果我们去做，容易出现问题。您可以考虑使用 iframe 面板代替。

## 更新日志与版本发布

该仓库使用 [GitHub 的发布][releases] 功能保存更新日志。

版本基于 [语义化版本控制][semver]，使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本号将根据以下内容进行增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 提供。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

Copyright (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包括在软件的所有副本或实质性部分中。

软件按“原样”提供，不作任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任承担责任，无论是基于合同、侵权或其他原因，因使用或其他交易软件而引起的。

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