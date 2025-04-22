# Home Assistant 社区附加组件：Prowlarr

基于流行的 arr 栈构建的索引器管理器/代理，以便与您的各种 PVR 应用程序集成。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装附加组件。
1. 启动“Prowlarr”附加组件
1. 检查“Prowlarr”附加组件的日志，以查看一切是否正常。
1. 点击“打开 Web 界面”以打开 Prowlarr 界面。
1. 完成屏幕上显示的向导。

## 配置

_此附加组件无需任何配置即可运行。_

## 已知问题和限制

- 此附加组件不支持 Home Assistant 的 Ingress 功能（即，将附加组件放入 Home Assistant 侧边栏的切换）。
  有太多变量需要考虑才能使其正常工作，如果我们这样做，很容易出错。您可以考虑使用 iframe 面板。

## 更新日志与版本发布

该存储库使用 [GitHub 的版本发布][releases] 功能保持更新日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选项可以得到答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 参与 [Reddit 子论坛][reddit] 的讨论 [/r/homeassistant][reddit]。

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 进行。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024 Franck Nijhof

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理软件时不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本的权利，并允许提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

软件是“按现状”提供的，没有任何种类的保证，明示或暗示，包括但不限于适销性、特定用途的适用性和不侵权。在任何情况下，作者或版权持有人均不对因软件或软件的使用或其他交易引起的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权或其他原因。

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