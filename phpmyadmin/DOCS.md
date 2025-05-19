# Home Assistant Community Add-on: phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面执行，同时您仍然可以直接执行任何 SQL 语句。

此插件是专门为管理官方的 Home Assistant MariaDB 插件而设计的。

## 安装

此插件的安装非常简单，与安装其他 Home Assistant 插件没有不同。

1. 单击下面的 Home Assistant 我的按钮，以在您的 Home Assistant 实例中打开该插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 单击“安装”按钮以安装该插件。
1. 启动“phpMyAdmin”插件。
1. 享受插件的使用！

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
```

**注意**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项：`upload_limit`

默认情况下，上传的大小限制（例如导入操作）设置为 64MB。可以通过此选项增加，例如，`100` 将是 100MB。

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在您处理未知问题时可能很有用。可能的值是：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：发生了非常严重的问题。插件变得不可用。

请注意，每个级别自动包含更严重级别的日志信息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排除故障。

## 已知问题和限制

- 此插件需要核心 MariaDB 插件版本 2.0 或更高版本。
- 此插件创建的目的是允许管理官方的 Home Assistant MariaDB 插件。它不能连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志及版本发布

此存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

版本发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强功能。
- `PATCH`：向后兼容的错误修复和程序包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 频道][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 频道][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

您也可以 [在这里打开一个问题][issue] GitHub。

## 作者和贡献者

此存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021-2025 Franck Nijhof

特此免费许可任何获得本软件及相关文档文件（“软件”）副本的人在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，以及允许提供软件的人员这样做，但须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

本软件是“按原样”提供的，不作任何类型的保证，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因软件或其使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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