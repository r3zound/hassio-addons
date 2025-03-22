# Home Assistant Community Add-on: Prowlarr

基于流行的 arr 堆栈构建的索引器管理器/代理，以与您的各种 PVR 应用程序集成。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同之处。

1. 点击下方的 Home Assistant My 按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Prowlarr”插件。
1. 检查“Prowlarr”插件的日志，查看一切是否正常。
1. 点击“打开WEB UI”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此插件无需任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  包含太多变量使得无法正常工作，如果我们这样做，很可能会破坏。您可以考虑使用 iframe 面板作为替代。

## 更新日志 & 发布

此存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的bug修复和包更新。

## 支持

有问题吗？

您有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit]中的 [Reddit 子版块][reddit]。

您也可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，以不受限制地处理软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件的副本，并允许被提供软件的人如此操作，须符合以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件按“原样”提供，不提供任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定目的适合性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的任何其他交易而导致的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权或其他。

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