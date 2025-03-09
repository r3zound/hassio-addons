# Home Assistant Community Add-on: Sonarr

适用于新闻组和BitTorrent用户的智能PVR。

## 安装

该插件的安装相当简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下面的 Home Assistant My 按钮以在你的 Home Assistant 实例中打开该插件。

   [![在你的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Sonarr”插件。
1. 检查“Sonarr”插件的日志以查看一切是否顺利。
1. 点击“打开网页界面”以打开Sonarr界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件不需要任何配置即可运行。_

## 已知问题和限制

- 该插件不支持Home Assistant的Ingress功能（即将插件放入Home Assistant侧边栏的切换）。
  有太多变量需考虑以使其正常工作，如果我们这样做，很容易出错。你可以考虑使用iframe面板代替。

## 更新日志与发布

该存储库使用[GitHub的发布][releases]功能保持变更日志。

发布基于[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有疑问吗？

你有几种方式可以得到答案：

- [Home Assistant社区插件Discord聊天服务器][discord]以获取插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit子版块][reddit] 在 [/r/homeassistant][reddit]

你还可以 [在这里打开问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由[Franck Nijhof][frenck]完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，未受限制地使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许提供该软件的人这样做，前提是满足以下条件：

上述版权声明和本授权声明应包含在所有软件的副本或实质部分中。

本软件是按“原样”提供的， 不附有任何类型的承诺，明确或隐含，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下。

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