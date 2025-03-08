# Home Assistant 社区插件：Bazarr

下载和管理 Sonarr 和 Radarr 的字幕。

## 安装

这个插件的安装相当简单，与安装其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击 “安装” 按钮以安装该插件。
1. 启动 “Bazarr” 插件
1. 检查 “Bazarr” 插件的日志以确认一切正常。
1. 点击 “打开网页 UI” 以打开 Bazarr 界面。
1. 完成屏幕上显示的向导。

- 将下载文件夹设置为，例如，
  `/media/bazarr/Downloads/complete` 和
  `/media/bazarr/Downloads/incomplete`

## 配置

_此插件无需任何配置即可运行。_

## 更新日志与发布

该仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式简述版本将根据以下内容进行增量增加：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以 [在此处打开问题][issue] GitHub。

## 作者与贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此授予任何获取该软件及相关文档文件（“软件”）副本的人，免费使用该软件的权利，允许其不受限制地使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许提供软件的人这样做，遵循以下条件：

上述版权声明和此许可声明应包含在该软件的所有副本或重要部分中。

软件按照“原样”提供，不提供任何种类的明示或暗示的保证，包括但不限于对适销性、特定用途适用性和非侵犯的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件有关的使用或其他行为而产生的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权还是其他方式。

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