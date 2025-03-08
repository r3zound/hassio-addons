# Home Assistant Community Add-on: Lidarr

看起来像Sonarr，但为音乐而制作。

## 安装

该附加组件的安装非常简单，与安装任何其他Home Assistant附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以打开您 Home Assistant 实例上的附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Lidarr”附加组件。
1. 检查“Lidarr”附加组件的日志，以查看一切是否顺利。
1. 点击“打开网页界面”以打开Lidarr界面。
1. 完成屏幕上显示的向导。

## 配置

_该附加组件无需任何配置即可运行。_

## 已知问题和限制

- 该附加组件不支持 Home Assistant 的 Ingress 功能（即将附加组件放入 Home Assistant 侧边栏的切换开关）。
  要使其正常工作需要考虑的变量过多，如果我们这样做，很容易就会出错。您可以考虑使用iframe面板代替。

## 更新日志和版本

该存储库使用 [GitHub的发布][releases] 功能保持变更日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大变化。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几个选项可以得到答案：

- [Home Assistant Community Add-ons Discord聊天服务器][discord] 进行附加组件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha] 进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit subreddit][reddit]。

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 提供。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理软件的权利，不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和此许可声明应包含在所有软件的复制品或重要部分中。

该软件是按“原样”提供的，不附有任何种类的担保，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对任何因软件或使用或其他交易而引起的、以合同、侵权或其他方式提出的索赔、损害或其他责任负责。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_lidarr&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-lidarr/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-lidarr/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-lidarr/releases
[semver]: http://semver.org/spec/v2.0.0.html