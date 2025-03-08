# Home Assistant 社区插件：Uptime Kuma

Uptime Kuma 是一个开源监控工具，最好的比较是自托管的商业服务“Uptime Robot”的变体。

它使您能够监控 HTTP/S、TCP、DNS 和其他协议的服务，并可以向您发送停机通知或触发 Home Assistant 自动化 webhook。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant My 按钮，以打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮安装插件。
1. 启动“Uptime Kuma”插件。
1. 检查“Uptime Kuma”的日志，查看一切是否正常。
1. 点击“打开网页 UI”按钮跳转到 Uptime Kuma。

请阅读本文档的其余部分以获取进一步的说明。

## 配置

该插件没有配置选项，所有内容均可以通过 Uptime Kuma 界面进行管理和配置。

## 更新日志与版本发布

这个代码库使用 [GitHub 的版本发布][releases] 功能保持变更日志。日志的格式基于 [保持变更日志][keepchangelog]。

版本基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行增量：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择可以获取答案：

- 用于插件支持和功能请求的 [Home Assistant Community Add-ons Discord 聊天服务器][discord]。
- 用于一般 Home Assistant 讨论和问题的 [Home Assistant Discord 聊天服务器][discord-ha]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

您还可以在这里 [报告问题][issue] 在 GitHub 上。

## 作者与贡献者

该代码库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2022-2025 Franck Nijhof

特此免费授予任何获取本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，以及允许提供软件的人这样做，条件是：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，不提供任何形式的明示或暗示的保证，包括但不限于对适销性、对特定目的的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用软件或与软件有关或其他交易而产生的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权行为还是其他方式。

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