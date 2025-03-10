# Home Assistant Community Add-on: Radarr

用于 Usenet 和 Torrent 用户的电影组织者/管理器。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件并无不同。

1. 点击下面的 Home Assistant 的按钮以打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击 "安装" 按钮以安装插件。
3. 启动 "Radarr" 插件
4. 检查 "Radarr" 插件的日志以查看一切是否正常。
5. 点击 "打开 WEB UI" 以打开 Radarr 界面。
6. 完成屏幕上显示的向导。

## 配置

_此插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  考虑到变量过多，难以使其正常工作，如果我们尝试这样做，将很容易出现故障。您可以考虑使用 iframe 面板来代替。

## 更新日志和发布

该库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开问题][issue] GitHub。

## 作者和贡献者

此库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，处理软件时不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，以及允许提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包括在所有软件的副本或实质部分中。

软件是按“原样”提供的，不提供任何类型的保证，无论是明示或暗示，包括但不限于对适销性、适用于特定用途和不侵权的保证。在任何情况下，作者或版权持有者均不对因软件或其使用或其他交易引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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