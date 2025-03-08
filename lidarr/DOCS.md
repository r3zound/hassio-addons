# Home Assistant 社区附加组件：Lidarr

看起来和闻起来都像 Sonarr，但它是为音乐而制作的。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant My 按钮以打开您 Home Assistant 实例中的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Lidarr”附加组件。
1. 检查“Lidarr”附加组件的日志以查看一切是否顺利。
1. 点击“打开 Web UI”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件无需配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即将附加组件放入 Home Assistant 侧边栏的切换）。
  由于需要考虑的变量太多，导致无法正常工作，如果我们强行实现，可能会很容易出现问题。您可以考虑改用 iframe 面板。

## 更新日志与版本发布

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本发布遵循 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简单来说，版本将根据以下标准进行递增：

- `MAJOR`：不兼容或重大的更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多个选项可以获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您也可以在 [这里打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予获得此软件及相关文档文件（“软件”）的任何个人使用、复制、修改、合并、发布、分发、再许可和/或销售该软件副本的权利，并允许向其提供软件的人员这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

本软件以“原样”提供，不附带任何形式的保证，无论明示或暗示，包括但不限于适销性、特定用途适用性和非侵权保证。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件相关的其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_lidarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-lidarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-lidarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-lidarr/releases
[semver]: http://semver.org/spec/v2.0.0.html