# Home Assistant Community Add-on: Radarr

电影组织/管理工具，适用于usenet和torrent用户。

## 安装

这个附加组件的安装非常简单，与安装任何其他Home Assistant附加组件没有不同。

1. 点击下面的 Home Assistant My 按钮，以在你的 Home Assistant 实例中打开该附加组件。

   [![在你的 Home Assistant 实例中打开这个附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Radarr”附加组件
1. 检查“Radarr”附加组件的日志，以查看一切是否顺利。
1. 点击“打开网页界面”以打开Radarr界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件运行不需要任何配置。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  考虑到太多变量，这使得很难让其正常工作，如果我们实现了，很容易会出现问题。你可以考虑使用 iframe 面板来替代。

## 更新日志与版本

该仓库使用 [GitHub 的发布][releases] 功能维护更新日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简言之，版本将根据以下情况递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几种选择可以得到回答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获得附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

你也可以在这里 [提交一个问题][issue] 到 GitHub。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售软件的副本，并允许向其提供软件的人这样做，符合以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重要部分中。

软件是按“现状”提供的，没有任何种类的明示或暗示担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或使用或其他交易中产生的任何索赔、损害或其他责任负责，无论是在合同、侵权等任何形式。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_radarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-radarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-radarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-radarr/releases
[semver]: http://semver.org/spec/v2.0.0.html