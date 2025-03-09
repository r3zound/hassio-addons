# Home Assistant Community Add-on: Prowlarr

基于流行的 arr 栈构建的索引管理器/代理，以与您的各种 PVR 应用程序集成。

## 安装

安装此插件非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮安装该插件。
1. 启动“Prowlarr”插件。
1. 检查“Prowlarr”插件的日志，以查看一切是否正常。
1. 点击“打开网页界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑才能使其正常工作，如果我们这样做，很容易造成破坏。您可以考虑使用 iframe 面板。

## 更新日志与版本

该仓库使用 [GitHub 的发行][releases] 功能来保持更新日志。

版本基于 [语义版本控制][semver]，采用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的 Bug 修复和包更新。

## 支持

有问题？

您有几种选择可以解决它们：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在此 [打开一个问题][issue] GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（以下简称“软件”）副本的人，不受限制地处理该软件，包括但不限于以使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本，以及允许向其提供该软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

本软件是按“原样”提供的，不提供任何种类的明示或暗示的保证，包括但不限于对适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用软件或与软件的使用或其他交易相关的任何要求、损害赔偿或其他责任（无论是在合同、侵权或其他方面）承担责任。

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