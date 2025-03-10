# Home Assistant 社区插件：Lidarr

看起来像 Sonarr，但为音乐而制作。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮在你的 Home Assistant 实例中打开插件。

   [![在你的 Home Assistant 实例中打开该插件.][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Lidarr”插件
1. 检查“Lidarr”插件的日志以查看是否一切正常。
1. 点击“打开网页界面”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件不需要任何配置即可运行。_

## 已知问题和限制

- 该插件不支持 Home Assistant 的 Ingress 功能（即将插件放入 Home Assistant 侧边栏的切换开关）。
  考虑到要使其正常工作，有太多变量需要考虑，如果我们这样做，就很容易出现问题。你可以考虑使用 iframe 面板。

## 更新日志 & 发布

本仓库使用 [GitHub 的发布][releases]功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

你有几种选择可以寻求解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子频道][reddit] 在 [/r/homeassistant][reddit]。

你也可以在这里 [提交问题][issue] 到 GitHub。

## 作者 & 贡献者

该仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免费使用本软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许提供软件的人员这样做，遵循以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或重要部分中。

该软件按“原样”提供，不提供任何类型的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与之相关的其他交易而产生的任何索赔、损害或其他责任承担责任，无论是合同行为、侵权行为还是其他行为。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_lidarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-lidarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-lidarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-lidarr/releases
[semver]: http://semver.org/spec/v2.0.0.html