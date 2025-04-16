# Home Assistant Community Add-on: Prowlarr

基于流行的 arr 堆栈构建的索引器管理器/代理，以与您的各种 PVR 应用程序集成。

## 安装

此附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例上打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“Prowlarr”附加组件。
1. 检查“Prowlarr”附加组件的日志，以查看是否一切正常。
1. 点击“打开网页界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件在运行时不需要任何配置。_

## 已知问题和局限性

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即将附加组件放入 Home Assistant 边栏的切换）。
  有太多变量需要考虑，才能使其正常工作，如果我们这样做，就很容易出错。您可以考虑改用 iframe 面板。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的 bug 修复和软件包更新。

## 支持

有问题吗？

您有几种选项可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可

版权所有 (c) 2024 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免版权费的权利，在软件中不受限制地处理，包括不限于使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

本软件按“原样”提供，没有任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用该软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权还是其他方面。

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