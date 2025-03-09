# Home Assistant Community Add-on: Lidarr

看起来和闻起来都像 Sonarr，但专为音乐而设计。

## 安装

这个附加组件的安装相当简单，与安装其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Lidarr”附加组件
1. 检查“Lidarr”附加组件的日志以查看一切是否正常。
1. 点击“打开网络界面”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件运行时不需要任何配置。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑才能使其正常工作，如果要这样做，很容易出错。您可以考虑使用 iframe 面板来替代。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能保留更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性与增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在 [此处打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）的人的免费许可，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件的副本的权利，以及允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，没有任何形式的保证，无论是明示或暗示，包括但不限于对适销性、适合特定用途和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权还是其他。

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