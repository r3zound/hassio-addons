# Home Assistant 社区插件: Radarr

用于 Usenet 和 Torrent 用户的电影组织/管理器。

## 安装

该插件的安装相当简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 按钮，打开您 Home Assistant 实例中的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“Radarr”插件。
1. 检查“Radarr”插件的日志，看看一切是否顺利。
1. 点击“打开 WEB UI”以打开 Radarr 接口。
1. 完成屏幕上显示的向导。

## 配置

_该插件不需要任何配置即可运行。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。
  有太多因素需要考虑，才能使其正常工作；如果我们这样做，容易发生故障。您可以考虑使用 iframe 面板。

## 更新日志与发布

此存储库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布根据 [语义版本控制][semver] 进行，格式为 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以在此 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的初始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2024-2025 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理该软件的权利不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售该软件的副本，以及允许向其提供软件的人这样做，前提是符合以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是按“原样”提供的，不提供任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人对因使用该软件或其他交易而引起的任何索赔、损害或其他责任（无论是合同、侵权或其他方式）不承担责任。

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