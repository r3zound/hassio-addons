# Home Assistant Community Add-on: Radarr

用于 usenet 和 torrent 用户的电影组织/管理器。

## 安装

此附加组件的安装非常简单，与安装任何其他 Home Assistant 附加组件没有不同。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击 "安装" 按钮以安装附加组件。
1. 启动 "Radarr" 附加组件
1. 检查 "Radarr" 附加组件的日志，以查看一切是否顺利。
1. 点击 "打开 Web 界面" 打开 Radarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件不需要任何配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 特性（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑才能使其正常工作，如果我们这样做，将很容易出错。您可以考虑使用 iframe 面板代替。

## 更新日志与发布

此代码库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义化版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的问题修复和软件包更新。

## 支持

有问题？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 小组][reddit] 在 [/r/homeassistant][reddit]

您还可以 [在这里报告问题][issue] GitHub。

## 作者与贡献者

此代码库的初始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请检查 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（以下简称“软件”）副本的个人，在不受限制的情况下使用软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件的副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可证声明应包含在软件的所有副本或重要部分中。

软件是“按原样”提供的，不保证任何种类，无论是明示还是隐含，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不应对因使用或其他交易中产生的软件或与其相关的软件承担任何索赔、损害或其他责任，无论是合同、侵权还是其他方式。

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