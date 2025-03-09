# Home Assistant Community Add-on: Radarr

用于 Usenet 和 Torrent 用户的电影组织/管理工具。

## 安装

这个附加组件的安装相当简单，与安装其他 Home Assistant 附加组件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例上打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“Radarr”附加组件。
1. 检查“Radarr”附加组件的日志以查看一切是否顺利进行。
1. 点击“打开 Web UI”以打开 Radarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件在运行时不需要任何配置。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑以使其正常工作，如果我们这样做，很容易会出错。您可以考虑使用 iframe 面板代替。

## 更新日志和发布

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [提交问题][issue] GitHub。

## 作者与贡献者

该存储库的最初建立由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授权任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许向其提供软件的人这样做，条件是遵守以下条件：

上述版权声明和本许可声明必须包含在所有软件副本或重要部分中。

该软件按“原样”提供，不提供任何种类的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或与软件或其他交易相关而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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