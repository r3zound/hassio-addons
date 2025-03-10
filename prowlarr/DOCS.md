# Home Assistant 社区附加组件：Prowlarr

基于流行的 arr 栈构建的索引管理器/代理，以集成您的各种 PVR 应用程序。

## 安装

此附加组件的安装相当简单，与安装任何其他 Home Assistant 附加组件没有什么不同。

1. 点击下面的 Home Assistant 我的按钮，以打开您 Home Assistant 实例中的附加组件。

   [![在你的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Prowlarr”附加组件
1. 检查“Prowlarr”附加组件的日志以查看一切是否顺利。
1. 点击“打开网页界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件无需任何配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换开关）。
  考虑到要使其正常工作需要考虑的变量太多，如果我们这样做，很容易会破坏。您可以考虑使用 iframe 面板作为替代。

## 更新日志和发布

此库使用 [GitHub 的发布][releases] 功能来维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的bug修复和包更新。

## 支持

有问题？

您有几种选择可以获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获得附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者及贡献者

此库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许被提供软件的人这样做，但需遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件按“原样”提供，不带任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或与软件有关的其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权诉讼或其他诉讼中。

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