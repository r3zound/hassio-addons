# Home Assistant Community Add-on: SABnzbd

免费的、易于使用的二进制新闻阅读器。

## 安装

这个插件的安装过程非常简单，与安装其他 Home Assistant 插件没有什么区别。

1. 点击下面的 Home Assistant 我的按钮，在你的 Home Assistant 实例中打开插件。

   [![在你的 Home Assistant 实例中打开这个插件.][addon-badge]][addon]

1. 点击“安装”按钮来安装插件。
1. 启动 "SABnzbd" 插件。
1. 检查 "SABnzbd" 插件的日志，查看一切是否正常。
1. 点击 "OPEN WEB UI" 打开 SABnzbd 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/sabnzbd/Donwloads/complete` 和
  `/media/sabnzbd/Donwloads/incomplete`

## 配置

_这个插件运行不需要任何配置。_

## 更新日志与版本

此仓库使用 [GitHub 的发布][releases] 功能保持更新日志。

版本号基于 [语义化版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简单来说，版本号会根据以下情况递增：

- `MAJOR`：不兼容或重大变化。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

你有几种方式可以得到解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

你也可以 [在 GitHub 上开一个问题][issue]。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

欲查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（以下简称“软件”）副本的个人，在不受限制的情况下使用、复制、修改、合并、发布、分发、再许可和/或销售软件的副本，并允许向他人提供该软件的副本，前提是符合以下条件：

上述版权声明和本许可声明应包含在所有软件副本或主要部分中。

本软件按“原样”提供，不提供任何形式的明示或暗示保证，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用本软件或与软件的其他使用或交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sabnzbd&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-sabnzbd/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-sabnzbd/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-sabnzbd/releases
[semver]: http://semver.org/spec/v2.0.0.html