# Home Assistant Community Add-on: Prowlarr

基于流行的arr栈构建的索引管理器/代理，以集成您的各种PVR应用程序。

## 安装

这个附加组件的安装相当简单，与安装任何其他Home Assistant附加组件并无不同。

1. 点击下面的Home Assistant My按钮，在您的Home Assistant实例中打开该附加组件。

   [![在您的Home Assistant实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“Prowlarr”附加组件。
1. 检查“Prowlarr”附加组件的日志，看看一切是否顺利。
1. 点击“打开网页界面”以打开Prowlarr界面。
1. 完成屏幕上显示的向导。

## 配置

_该附加组件运行时不需要任何配置。_

## 已知问题和限制

- 该附加组件不支持Home Assistant的Ingress功能（即，将附加组件放入Home Assistant侧边栏的切换）。
  有太多变量需要考虑以使其正常工作，如果我们这样做，很容易就会破坏。您可以考虑使用iframe面板来替代。

## 更新日志与发布

该仓库使用[GitHub的发布][releases]
功能保持变更日志。

发布版本基于[语义版本控制][semver]，并使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下情况递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修正和包更新。

## 支持

有问题吗？

您可以通过几种方式获得解答：

- [Home Assistant Community Add-ons Discord聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般Home Assistant讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入[Reddit子论坛][reddit]中的[/r/homeassistant][reddit]

您还可以在这里[提交问题][issue]到GitHub。

## 作者与贡献者

该仓库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，
请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权 (c) 2024 Franck Nijhof

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，处理该软件不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本的权利，并允许获得该软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不提供任何类型的保证，明示或暗示，包括但不限于对适销性、特定用途的适应性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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