# Home Assistant 社区插件：Lidarr

看起来像 Sonarr，但为音乐而设计。

## 安装

这个插件的安装相当简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Lidarr”插件。
1. 检查“Lidarr”插件的日志，查看一切是否顺利。
1. 点击“打开网页界面”以打开 Lidarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件运行不需要任何配置。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即将插件放入 Home Assistant 侧边栏的切换）。  
  有太多变量需要考虑，才可以使其正常工作，如果我们这样做，容易出错。您可以考虑使用 iframe 面板代替。

## 更新日志与版本

该库使用 [GitHub 的版本][releases] 功能维护变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将基于以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选项可以获得解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在 [GitHub 上打开一个问题][issue]。

## 作者与贡献者

该库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，享有不受限制的处置权，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件的副本，以及允许被提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包括在软件的所有副本或重要部分中。

软件是按“原样”提供的，不提供任何形式的担保，明确或隐含，包括但不限于对适销性、特定用途适用性和不侵犯的担保。在任何情况下，作者或版权持有人均不对因使用软件或与软件有关的其他交易而产生的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

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