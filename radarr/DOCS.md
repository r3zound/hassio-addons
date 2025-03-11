# Home Assistant Community Add-on: Radarr

电影组织/管理工具，适用于usenet和torrent用户。

## 安装

该插件的安装过程相当简单，与安装任何其他Home Assistant插件没有什么不同。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Radarr”插件
1. 检查“Radarr”插件的日志以查看是否一切正常。
1. 点击“打开Web界面”以打开Radarr界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件不需要任何配置即可运行。_

## 已知问题和限制

- 此插件不支持Home Assistant的Ingress功能（即，将插件放入Home Assistant侧边栏的切换开关）。
  需要考虑的变量太多，无法使其正常工作，如果可以的话，很容易就会出错。您可以考虑使用iframe面板。

## 更新日志与发布

此存储库使用[GitHub的发布][releases]功能保持更新日志。

发布基于[语义化版本控制][semver]，使用格式`MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选项来获取答案：

- [Home Assistant Community Add-ons Discord聊天室][discord]以获取插件支持和功能请求。
- [Home Assistant Discord聊天室][discord-ha]以进行一般Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[/r/homeassistant][reddit]的[Reddit讨论区][reddit]

您还可以在这里[提交问题][issue] GitHub。

## 作者与贡献者

该存储库的原始设置由[Franck Nijhof][frenck]进行。

有关所有作者和贡献者的完整列表，
请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有(c) 2024-2025 Franck Nijhof

特此免费授权任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这样做，前提是遵守以下条件：

上述版权声明和本许可声明应包括在所有软件的副本或重要部分中。

该软件是“按原样”提供的，不作任何形式的担保，明示或暗示，包括但不限于对适销性、特定目的适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权行为还是其他。

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