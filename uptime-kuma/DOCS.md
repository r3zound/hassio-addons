# Home Assistant 社区插件：Uptime Kuma

Uptime Kuma 是一个开源监控工具，可以最好地比作一个自托管的商业服务变体，如“Uptime Robot”。

它使您能够通过 HTTP/S、TCP、DNS 和其他协议监控服务，并且可以在服务停机时向您发送通知或触发 Home Assistant 自动化 webhook。

## 安装

这个插件的安装非常简单，与安装其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮安装插件。
1. 启动“Uptime Kuma”插件。
1. 检查“Uptime Kuma”的日志，以查看一切是否顺利。
1. 点击“打开网页界面”按钮跳转到 Uptime Kuma。

请阅读本文件的其余部分以获取进一步的说明。

## 配置

该插件没有配置选项，一切都可以通过 Uptime Kuma 界面进行管理和配置。

## 变更日志和发布

此代码库使用 [GitHub 的发布][releases] 功能维护变更日志。日志的格式基于 [保持变更日志][keepchangelog]。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多个选项可以获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子板块][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [打开问题][issue] GitHub。

## 作者和贡献者

此代码库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2022-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人员处理软件的权利，包括无任何限制的使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许提供软件的人这样做，条件是：

上述版权声明和本许可声明应包含在软件的所有副本或重大部分中。

该软件是按“现状”提供的，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不应对因使用软件或与软件及其它交易有关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_uptime-kuma&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-uptime-kuma/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-uptime-kuma/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-uptime-kuma/releases
[semver]: https://semver.org/spec/v2.0.0.html