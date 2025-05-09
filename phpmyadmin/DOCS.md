# Home Assistant Community Add-on: phpMyAdmin

phpMyAdmin 是一个用于 MySQL 和 MariaDB 的数据库管理工具。常用操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面进行操作，同时你仍然可以直接执行任何 SQL 语句。

这个附加组件是专门设计用于管理官方 Home Assistant MariaDB 附加组件。

## 安装

安装这个附加组件非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 点击下面的 Home Assistant My 按钮以在您的 Home Assistant 实例中打开该附加组件。

   [![在您的 Home Assistant 实例中打开此附加组件。][addon-badge]][addon]

2. 点击 "Install" 按钮安装附加组件。
3. 启动 "phpMyAdmin" 附加组件。
4. 享受这个附加组件！

## 配置

**注意**：_记得在更改配置后重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
```

**注意**：_这只是一个示例，请勿复制粘贴！创建您自己的！_

### 选项：`upload_limit`

默认情况下，上传的大小限制（用于导入等操作）设置为 64MB。您可以通过此选项增加该限制，例如，`100` 将是 100MB。

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁的输出，这在处理未知问题时可能会很有用。可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不是错误的例外情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：出现严重问题。附加组件变得无法使用。

请注意，每个级别自动包含来自更高级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## 已知问题和限制

- 此附加组件需要核心 MariaDB 附加组件版本 2.0 或更高版本。
- 此附加组件的创建目的是允许管理官方 Home Assistant MariaDB 附加组件。它无法连接到其他 MySQL 或 MariaDB 服务器。

## 更新日志和版本

该存储库使用 [GitHub 的版本][releases] 功能保持更新日志。

发行版基于 [语义版本控制][semver]，并采用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]以进行一般 Home Assistant 讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit]。

您还可以 [在此处打开一个问题][issue] GitHub。

## 作者和贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2021-2025 Franck Nijhof

特此免费授权任何获取本软件及相关文档文件（“软件”）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许向其提供该软件的人这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，没有任何种类的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他处理软件或与软件相关的任何索赔、损害或其他责任负责。

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