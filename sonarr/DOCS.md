# Home Assistant 社区插件：Sonarr

针对新闻组和BitTorrent用户的智能PVR。

## 安装

这个插件的安装非常简单，与安装其他任何Home Assistant插件没有区别。

1. 点击下面的“Home Assistant 我的”按钮以在你的Home Assistant实例中打开插件。

   [![在你的Home Assistant实例中打开这个插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Sonarr”插件。
1. 检查“Sonarr”插件的日志以查看是否一切正常。
1. 点击“打开web界面”以打开Sonarr界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件不需要任何配置即可运行。_

## 已知问题和限制

- 该插件不支持Home Assistant的Ingress功能（即将插件放入Home Assistant侧边栏的切换）。
  有太多变量需要考虑才能正常工作，如果我们尝试，那么很容易会出现问题。你可以考虑使用iframe面板代替。

## 更新日志与发布

该仓库使用[GitHub的发布][releases]功能来维护变更日志。

发布是基于[语义化版本控制][semver]，使用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下规则递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有什么问题？

你有几种方式可以得到答案：

- [Home Assistant社区插件Discord聊天服务器][discord]以获取插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit子论坛][reddit]。

你也可以在这里[打开一个问题][issue] GitHub。

## 作者与贡献者

这个仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获取该软件及相关文档文件（“软件”）副本的人，有权在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件副本的权利，并允许向其提供该软件的人这样做，以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质部分中。

该软件是按“原样”提供的，不作任何形式的明示或暗示担保，包括但不限于适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他行为中，均不对因使用或与该软件相关的交易而产生的责任负责。

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