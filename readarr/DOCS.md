# Home Assistant Community Add-on: Readarr

书籍管理和自动化（电子书的 Sonarr）。

## 安装

该附加组件的安装非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开此附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击 "安装" 按钮来安装此附加组件。
1. 启动 "Readarr" 附加组件。
1. 检查 "Readarr" 附加组件的日志，看看一切是否顺利。
1. 点击 "打开网页界面" 以打开 Readarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该附加组件无需任何配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。考虑到要使其正常工作的变量实在太多，如果我们尝试实现，它也很容易被破坏。您可以考虑使用 iframe 面板。

## 更新日志与版本发布

本仓库使用 [GitHub 的 releases][releases] 功能维护变更日志。

版本发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下规则递增：

- `MAJOR`: 不兼容的或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选项可以获得解答：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以 [在这里打开一个问题][issue] GitHub。

## 作者与贡献者

本仓库的初始设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得该软件及其相关文档文件（“软件”）副本的人在软件中进行不受限制的处理，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件按“原样”提供，不附有任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用软件或与软件或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

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