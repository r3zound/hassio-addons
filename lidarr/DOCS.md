# Home Assistant 社区插件：Lidarr

看起来像Sonarr，但适用于音乐。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件并无不同。

1. 点击下面的 Home Assistant 我的按钮以在你的 Home Assistant 实例中打开该插件。

   [![在你的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Lidarr”插件
1. 检查“Lidarr”插件的日志，以查看一切是否顺利。
1. 点击“打开网页 UI”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件不需要任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  考虑到许多变量，这样做很难让它正常工作，如果我们这样做，很容易出错。你可以考虑使用 iframe 面板。

## 更新日志和发布

该存储库使用 [GitHub 的发布][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。总的来说，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题？

你有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 讨论区][reddit] 在 [/r/homeassistant][reddit]

你也可以 [在这里打开一个问题][issue] GitHub。

## 作者和贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许提供软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

软件按“原样”提供，不提供任何类型的保证，无论明示或暗示，包括但不限于适销性、特定用途适用性和非侵权性。在任何情况下，作者或版权持有人均不对因软件或使用或其他交易中产生的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他情况下。

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