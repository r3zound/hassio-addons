# Home Assistant Community Add-on: Lidarr

看起来和闻起来都像 Sonarr，但专为音乐而设计。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有太大不同。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Lidarr”插件
1. 检查“Lidarr”插件的日志，查看是否一切正常。
1. 点击“打开网页界面”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件不需要任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换开关）。
  考虑到许多变量，使其正常工作是非常复杂的，如果能够做到，这很容易出错。您可以考虑使用 iframe 面板代替。

## 更新日志和版本

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，并使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

该存储库的最初设置者是 [Franck Nijhof][frenck]。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（简称“软件”）副本的人以自由地处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许接受软件的人这样做，受以下条件的限制：

上述版权声明和此许可声明应包含在所有副本或软件的实质部分中。

软件是“按原样”提供的，不提供任何类型的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人对因使用软件或其他交易而引起的任何索赔、损害或其他责任不承担责任，无论是合同、侵权还是其他方面的行为。

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