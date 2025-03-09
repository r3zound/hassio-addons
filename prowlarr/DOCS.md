# Home Assistant 社区插件: Prowlarr

基于流行的 arr 堆栈构建的索引管理器/代理，用于与您的各种 PVR 应用程序集成。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件.][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Prowlarr”插件。
1. 检查“Prowlarr”插件的日志以查看一切是否正常。
1. 点击“打开网页界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  由于需要考虑的变量太多，使其正常工作变得困难，如果我们强行实现，可能会很容易导致破坏。您可以考虑改用 iframe 面板。

## 更新日志和发布

此存储库使用 [GitHub 的发行版][releases] 功能保持变更日志。

发行版基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [打开问题][issue] GitHub。

## 作者和贡献者

本存储库的初始设置由 [Franck Nijhof][frenck] 进行。

想查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此授予任何获得本软件及相关文档文件（以下称“软件”）副本的人，免费使用软件的权利，不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许其提供软件的人在遵循以下条件的前提下这样做：

以上版权声明和本许可声明应包含在所有软件的副本或重要部分中。

软件按“原样”提供，不提供任何种类的担保，无论是明示还是暗示，包括但不限于适销性、特定目的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易而产生的任何索赔、损害或其他责任承担责任，无论是合同、侵权或其他形式的责任。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_prowlarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-prowlarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-prowlarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-prowlarr/releases
[semver]: http://semver.org/spec/v2.0.0.html