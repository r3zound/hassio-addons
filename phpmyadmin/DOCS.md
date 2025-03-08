# Home Assistant 社区插件：phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用的操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面进行，并且您仍然可以直接执行任何 SQL 语句。

该插件专门设计用于管理官方 Home Assistant MariaDB 插件。

## 安装

该插件的安装过程非常简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“phpMyAdmin”插件。
1. 尽情享用该插件！

## 配置

**注意**：_在更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`upload_limit`

默认情况下，上传（例如导入等操作）的大小限制设置为 64MB。可以通过此选项增加该限制，例如，将 `100` 设置为 100MB。

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在您处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每一个细节，像所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出现严重问题，插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

## 已知问题和限制

- 该插件需要核心 MariaDB 插件版本 2.0 或更高版本。
- 该插件旨在允许管理官方 Home Assistant MariaDB 插件。它无法连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志与版本发布

该存储库使用 [GitHub 的发行功能][releases] 保持变更日志。

版本发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和改进。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您可以通过几种方式获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 提供插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您还可以在 [这里提交问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 进行。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021-2025 Franck Nijhof

特此无偿授予任何获得该软件及相关文档文件（“软件”）副本的人，在软件中自由处理，包括不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许被提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，不附有任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人都不对因使用该软件或与之相关的使用或其他交易而导致的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他情况下。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_phpmyadmin&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-phpmyadmin/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-phpmyadmin/171729?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-phpmyadmin/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-phpmyadmin/releases
[semver]: https://semver.org/spec/v2.0.0.html