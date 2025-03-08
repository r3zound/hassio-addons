# Home Assistant 社区插件：SQLite Web

这使您能够轻松浏览保存在数据库中的所有表和内容。

## 安装

此插件的安装相当简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“SQLite Web”插件
1. 检查“SQLite Web”插件的日志以查看一切是否正常。
1. 点击“打开网页 UI”以打开 SQLite Web 界面。
1. 使用您的 Home Assistant 用户登录。

## 配置

**注意**：_记住在更改配置时重新启动插件。_

### 选项：数据库

一个可选的数据库路径，可以设置为指示 SQLite Web 使用特定的数据库文件。如果未设置，将使用默认的 Home Assistant 数据库文件位置。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能保持更改日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将基于以下内容递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有多种方式可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord]，以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，以进行一般的 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该存储库的初始设置由 [Joakim Sørensen][ludeeus] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2018-2019 Joakim Sørensen  
版权所有 (c) 2019-2025 Franck Nijhof

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人处理软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许被提供软件的人这样做，受到以下条件的限制：

以上版权声明和本许可声明应包含在所有软件的副本或实质部分中。

该软件是按“原样”提供的，没有任何形式的保证，无论是明示还是暗示，包括但不限于适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易相关的合同、侵权或其他行为而导致的任何索赔、损害或其他责任承担责任。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_sqlite-web&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-sqlite-web/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-sqlite-web/68912?u=frenck
[issue]: https://github.com/hassio-addons/addon-sqlite-web/issues
[ludeeus]: https://github.com/ludeeus
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-sqlite-web/releases
[semver]: http://semver.org/spec/v2.0.0.html