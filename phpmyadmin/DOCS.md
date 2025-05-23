# Home Assistant 社区附加组件: phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面执行，同时你仍然可以直接执行任何 SQL 语句。

此附加组件专为管理官方 Home Assistant MariaDB 附加组件而设计。

## 安装

安装此附加组件非常简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 我的按钮以在你的 Home Assistant 实例中打开此附加组件。

   [![在你的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

2. 点击“安装”按钮以安装此附加组件。
3. 启动“phpMyAdmin”附加组件。
4. 享受此附加组件吧！

## 配置

**注意**: _更改配置时，请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
```

**注意**: _这只是一个示例，不要复制和粘贴它！创建你自己的！_

### 选项: `upload_limit`

默认情况下，上传的大小限制（例如导入等操作）被设置为 64MB。可以通过此选项增加，例如，`100` 将是 100MB。

### 选项: `log_level`

`log_level` 选项控制附加组件输出的日志级别，可以更改为更详细或更简略，这在处理未知问题时可能非常有用。可能的值有：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 非错误的异常情况。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 出现严重问题。附加组件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你在故障排除。

## 已知问题和限制

- 此附加组件需要核心 MariaDB 附加组件版本 2.0 或更高版本。
- 此附加组件旨在管理官方 Home Assistant MariaDB 附加组件。它无法连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志与版本

该仓库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，采用 `MAJOR.MINOR.PATCH` 格式。简言之，版本将基于以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新特性与增强。
- `PATCH`: 向后兼容的bug修复和软件包更新。

## 支持

有问题吗？

你有几种获取解答的选择：

- Home Assistant 社区附加组件 Discord 聊天服务器 [discord] 以获取附加组件支持和功能请求。
- Home Assistant Discord 聊天服务器 [discord-ha] 以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

你也可以在这里 [打开问题][issue] GitHub。

## 作者与贡献者

此仓库的最初设置由 [Franck Nijhof][frenck] 进行。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021-2025 Franck Nijhof

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用、复制、修改、合并、发布、分发、再授权和/或销售本软件的副本，并允许提供给软件的人这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的主要部分中。

该软件按“原样”提供，不附任何类型的保证，明示或暗示，包括但不限于适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有人对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任，不论是基于合同、侵权或其他原因，不承担任何责任。

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