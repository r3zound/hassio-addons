# Home Assistant 社区插件：Readarr

书籍管理和自动化（电子书的 Sonarr）。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. 单击下面的 Home Assistant 我的按钮以打开您 Home Assistant 实例上的插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 单击 “安装” 按钮以安装插件。
3. 启动 “Readarr” 插件。
4. 检查 “Readarr” 插件的日志以查看是否一切正常。
5. 单击 “打开 WEB 界面” 以打开 Readarr 界面。
6. 完成屏幕上显示的向导。

## 配置

_此插件运行不需要任何配置。_

## 已知问题和限制

- 此插件不支持 Home Assistant 的 Ingress 功能（即，将插件放入 Home Assistant 侧边栏的切换）。 
  考虑到需要处理的变量太多，所以很难让它正常工作，如果我们尝试这样做，很容易就会出问题。您可以考虑改用 iframe 面板。

## 更新日志与发行版本

此仓库使用 [GitHub 的发行][releases] 功能维护更新日志。

释放版本基于 [语义版本][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下规则递增：

- `MAJOR`：不兼容或重大变更。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 提供插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您还可以 [在这里打开问题][issue] GitHub。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2024-2025 Franck Nijhof

特此无偿授予任何获得此软件及相关文档文件（“软件”）副本的人员，处理该软件不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，受以下条件的约束：

上述版权声明和本许可声明应包含在所有副本或软件的重大部分中。

该软件是按“原样”提供的，不提供任何种类的保证，无论是明示还是暗示，包括但不限于适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人对因使用、合同、侵权或其他原因所引起的任何索赔、损害或其他责任不承担任何责任，无论是因使用软件或与之相关的交易而产生的。

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