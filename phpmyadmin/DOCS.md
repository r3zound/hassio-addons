# Home Assistant 社区插件: phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面执行，同时您仍然可以直接执行任何 SQL 语句。

此插件专门设计用于管理官方的 Home Assistant MariaDB 插件。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击 "安装" 按钮以安装插件。
1. 启动 "phpMyAdmin" 插件。
1. 享受插件的使用！

## 配置

**注意**: _当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
```

**注意**: _这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项: `upload_limit`

默认情况下，上传（例如导入）操作的大小限制设置为 64MB。可以通过此选项增加，例如，`100` 将是 100MB。

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，在处理未知问题时可能会很有用。可能的值有：

- `trace`: 显示每一个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的异常情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 出现严重问题，插件变得无法使用。

请注意，每个级别自动包括来自更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

## 已知问题和限制

- 此插件需要核心 MariaDB 插件版本 2.0 或更高。
- 此插件旨在管理官方 Home Assistant MariaDB 插件。它无法连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志 & 版本

该仓库使用 [GitHub 的发布][releases] 功能维护更新日志。

版本基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下情况增加：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以得到答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子论坛][reddit]。

您还可以在这里 [提交问题][issue] 到 GitHub。

## 作者 & 贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（统称为“软件”）的人，无需对软件进行任何限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件的副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

本软件是“按原样”提供的，不提供任何形式的保证，无论明示或暗示，包括但不限于对适销性、特定用途的适应性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件或其他交易相关的声明、损害或其他责任承担任何责任，无论是在合同、侵权或其他方面。

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