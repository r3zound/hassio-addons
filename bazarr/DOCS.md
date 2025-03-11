# Home Assistant 社区插件：Bazarr

下载并管理 Sonarr 和 Radarr 的字幕。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下方的 Home Assistant My 按钮，打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Bazarr”插件。
1. 检查“Bazarr”插件的日志，以查看是否一切正常。
1. 点击“打开网页 UI”以打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/bazarr/Donwloads/complete` 和
  `/media/bazarr/Donwloads/incomplete`

## 配置

_该插件运行不需要任何配置。_

## 更新日志与发布

该存储库使用 [GitHub 的发布功能][releases] 保持更新日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简单来说，版本将根据以下规则进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择来获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子板块][reddit]。

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的原创设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，不受限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本的权利，并允许提供软件的人这样做，需遵循以下条件：

上述版权声明和本许可证声明应包含在软件的所有副本或重要部分中。

软件按“原样”提供，不提供任何明示或暗示的保证，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用、软件或其他交易引起的任何索赔、损害或其他责任，均不承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_bazarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-bazarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-bazarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-bazarr/releases
[semver]: http://semver.org/spec/v2.0.0.html