# Home Assistant 社区附加组件：phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用的操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面执行，同时您仍然可以直接执行任何 SQL 语句。

该附加组件专门设计用于管理官方 Home Assistant MariaDB 附加组件。

## 安装

安装这个附加组件非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

1. 点击“安装”按钮以安装该附加组件。
1. 启动“phpMyAdmin”附加组件。
1. 享受该附加组件！

## 配置

**注意**：_在更改配置时，请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
```

**注意**：_这只是一个示例，请不要直接复制粘贴！创建您自己的！_

### 选项：`upload_limit`

默认情况下，上传的大小限制（用于诸如导入等操作）设置为 64MB。可以通过此选项增加，例如，`100` 将是 100MB。

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的异常事件。
- `error`：运行时错误，通常不需要立即处理。
- `fatal`：发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- 此附加组件需要核心 MariaDB 附加组件版本 2.0 或更高。
- 此附加组件旨在管理官方 Home Assistant MariaDB 附加组件。它无法连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志与发布

该仓库使用 [GitHub 的发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下情况进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几个选项来获取答案：

- [Home Assistant 社区附加组件 Discord 聊天服务器][discord] 获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 获取有关 Home Assistant 的一般讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]。

您也可以 [在这里提出问题][issue] GitHub。

## 作者与贡献者

该仓库的初始设置由 [Franck Nijhof][frenck] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2021-2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人无限制地处理该软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件副本的权利，以及允许提供软件的人员这样做，前提是遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

软件是按“原样”提供的，没有任何种类的明确或隐含的担保，包括但不限于适销性、特定用途的适用性和不侵犯的担保。在任何情况下，作者或版权持有人都不对因使用软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权还是其他行为中。

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