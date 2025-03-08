# Home Assistant Community Add-on: Readarr

书籍管理和自动化（电子书的 Sonarr）。

## 安装

该插件的安装非常简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Readarr”插件。
1. 检查“Readarr”插件的日志以查看一切是否正常。
1. 点击“打开 Web UI”以打开 Readarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件无需任何配置即可运行。_

## 已知问题和限制

- 该插件不支持 Home Assistant 的 Ingress 功能（即将插件放入 Home Assistant 侧边栏的切换）。涉及的变量太多，无法确保其正常工作，如果我们这样做，很容易会出错。您可以考虑改用 iframe 面板。

## 更新日志和版本

该代码库使用 [GitHub 的发布][releases] 功能来维护变更日志。

发布基于 [语义化版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简单来说，版本会根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您可以通过多种方式获取答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [提交问题][issue] GitHub。

## 作者和贡献者

该代码库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，以及允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

本软件是按“原样”提供的，不提供任何类型的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有者均不对因使用软件或与软件相关的其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他情形下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_readarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-readarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-readarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-readarr/releases
[semver]: http://semver.org/spec/v2.0.0.html