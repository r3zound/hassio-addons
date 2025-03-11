# Home Assistant Community Add-on: Prowlarr

基于流行的 arr 栈构建的索引器管理器/代理，以与您的各种 PVR 应用集成。

## 安装

此附加组件的安装非常简单，与安装其他 Home Assistant 附加组件并无不同。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击 "Install" 按钮以安装该附加组件。
1. 启动 "Prowlarr" 附加组件。
1. 检查 "Prowlarr" 附加组件的日志，以查看一切是否正常。
1. 点击 "OPEN WEB UI" 以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件不需要任何配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换开关）。
  考虑到可能影响的变量太多，因此很难做到这一点，若能做到，出错的可能性也很大。您可以考虑使用 iframe 面板。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能维护更新日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权所有(c) 2024 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地使用软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件的副本，以及允许向其提供软件的人这样做，需遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不提供任何种类的担保，无论明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_prowlarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-prowlarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-prowlarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-prowlarr/releases
[semver]: http://semver.org/spec/v2.0.0.html