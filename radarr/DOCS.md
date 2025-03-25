# Home Assistant Community Add-on: Radarr

用于 Usenet 和种子用户的电影组织/管理器。

## 安装

此附加组件的安装相当简单，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant My 按钮，以在你的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“Radarr”附加组件
1. 检查“Radarr”附加组件的日志，以查看一切是否顺利。
1. 点击“打开网页界面”以打开 Radarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该附加组件运行时不需要任何配置。_

## 已知问题和限制

- 该附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  此功能涉及的变量太多，无法确保其正常工作，如果我们这样做，很容易就会出现故障。你可以考虑使用 iframe 面板作为替代。

## 更新日志 & 发版

该存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简单来说，版本号将根据以下规则递增：

- `MAJOR`: 不兼容或重大变更。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

你还可以在这里 [提交问题][issue] 到 GitHub。

## 作者 & 贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，
请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许向其提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件是“按原样”提供的，没有任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用或与该软件或其他交易相关的合同、侵权或其他行为而引起的任何索赔、损害或其他责任承担责任。

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