# Home Assistant 社区插件：Prowlarr

基于流行的 arr 堆栈构建的索引管理器/代理，可与您的各种 PVR 应用程序集成。

## 安装

该插件的安装非常简单，与安装任何其他 Home Assistant 插件没有不同。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该插件。
1. 启动“Prowlarr”插件。
1. 检查“Prowlarr”插件的日志以查看一切是否正常。
1. 点击“打开 Web 界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_该插件在运行时不需要任何配置。_

## 已知问题和限制

- 该插件不支持 Home Assistant 的 Ingress 功能（即将插件放入 Home Assistant 侧边栏的切换开关）。 
  考虑到要使其正常工作涉及的变量太多，如果我们这样做，容易导致破坏。您可以考虑使用 iframe 面板代替。

## 更新日志及版本

该存储库使用 [GitHub 的发布][releases] 功能来维护变更日志。

发布基于 [语义化版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以得到解答：

- 用于插件支持和功能请求的 [Home Assistant 社区插件 Discord 聊天服务器][discord]。
- 用于一般 Home Assistant 讨论和问题的 [Home Assistant Discord 聊天服务器][discord-ha]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以在这里 [提出问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 进行。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，处理软件时没有任何限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，及允许提供软件的人员这样做，但需遵守以下条件：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

软件按“原样”提供，不提供任何种类的明示或暗示的担保，包括但不限于适销性、适合特定目的和不侵犯他人权利的担保。在任何情况下，作者或版权持有人对因使用软件或与软件相关的任何索赔、损害或其他责任（无论是合同诉讼、侵权或其他）均不承担责任。

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