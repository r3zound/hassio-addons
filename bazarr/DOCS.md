# Home Assistant 社区插件: Bazarr

下载和管理 Sonarr 和 Radarr 的字幕。

## 安装

此插件的安装非常简单，与安装其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮，在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击 "安装" 按钮以安装插件。
1. 启动 "Bazarr" 插件。
1. 检查 "Bazarr" 插件的日志，以确认一切正常。
1. 点击 "打开网页界面" 打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/bazarr/Donwloads/complete` 和
  `/media/bazarr/Donwloads/incomplete`

## 配置

_此插件不需要任何配置即可运行。_

## 更新日志与版本

此存储库使用 [GitHub 的版本][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简言之，版本将基于以下内容进行递增：

- `MAJOR`: 不兼容或重大变更。
- `MINOR`: 向后兼容的新功能和改进。
- `PATCH`: 向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有多个选项来获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您也可以在这里 [开一个问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（"软件"）副本的人，处理软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，以及允许授予软件的人员这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在所有软件副本或实质性部分中。

该软件按 "原样" 提供，不提供任何形式的担保，无论是明确还是暗示，包括但不限于适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者均不对任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下，因使用该软件或与该软件有关的使用或其他交易而产生。

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