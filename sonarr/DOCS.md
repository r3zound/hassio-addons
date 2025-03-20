# Home Assistant Community Add-on: Sonarr

适用于新sgroups和bittorrent用户的智能PVR。

## 安装

该插件的安装非常简单，与安装其他任何Home Assistant插件并无不同。

1. 点击下面的 Home Assistant My 按钮以打开您Home Assistant实例上的插件。

   [![在您的Home Assistant实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 启动“Sonarr”插件
4. 检查“Sonarr”插件的日志以查看一切是否正常。
5. 点击“打开Web UI”以打开Sonarr界面。
6. 按照屏幕上显示的向导完成设置。

## 配置

_该插件运行不需要任何配置。_

## 已知问题和限制

- 此插件不支持Home Assistant的Ingress功能（即将插件放在Home Assistant侧边栏中的切换）。
  要使其正常工作需要考虑太多变量，如果我们这样做，很容易就会出错。您可以考虑改用iframe面板。

## 更新日志和发布

此仓库使用[GitHub的发布][releases]功能维护更新日志。

发布基于[语义版本控制][semver]，使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和改进。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord聊天服务器][discord]以获取插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以获取一般Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子版块][reddit]在[/r/homeassistant][reddit].

您还可以在这里[开一个问题][issue] GitHub。

## 作者与贡献者

本仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，
请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权（c）2024-2025 Franck Nijhof

特此免费授予任何获取本软件及相关文档文件（“软件”）副本的人，处理
该软件没有任何限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售
软件副本，并允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有
软件的副本或实质性部分中。

软件“按原样”提供，不提供任何种类的保证，无论明示或暗示，包括但不限于适销性，
特定用途的适用性和不侵权。在任何情况下，作者或版权持有人对任何索赔、损害或其他
责任不承担责任，无论是合同诉讼、侵权诉讼还是其他，因使用软件或与该软件有关的其他交易引起的。

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