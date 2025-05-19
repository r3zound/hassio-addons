# Home Assistant Community Add-on: Radarr

针对usenet和torrent用户的电影组织/管理工具。

## 安装

此插件的安装非常简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮安装插件。
3. 启动“Radarr”插件。
4. 检查“Radarr”插件的日志，以查看是否一切顺利。
5. 点击“打开WEB UI”以打开Radarr界面。
6. 完成屏幕上显示的向导。

## 配置

_此插件在运行时不需要任何配置。_

## 已知问题和限制

- 此插件不支持Home Assistant的Ingress功能（即将插件放入Home Assistant侧边栏的切换开关）。
  有太多变量需要考虑，以使这项功能正常工作，如果我们这样做，很容易就会出错。您可以考虑使用iframe面板来代替。

## 更新日志和发布

此存储库使用[GitHub的发布][releases]功能保持变更日志。

发布基于[语义版本控制][semver]，并采用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的bug修复和包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- [Home Assistant社区插件Discord聊天服务器][discord]用于插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]用于一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的[Reddit子版块][reddit]。

您也可以在这里[打开一个问题][issue] GitHub。

## 作者与贡献者

本存储库的初步设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2024-2025 Franck Nijhof

特此授予任何获取本软件及其相关文档文件（统称“软件”）副本的人免费许可证，在没有任何限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件副本的权利，并允许被提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的重要部分中。

该软件是“按原样”提供的，不提供任何类型的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面，因使用软件或与软件的使用或其他交易有关而引起。

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