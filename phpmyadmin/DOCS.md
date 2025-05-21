# Home Assistant社区插件: phpMyAdmin

phpMyAdmin是一个用于MySQL和MariaDB的数据库管理工具。经常使用的操作（管理数据库、表、列、关系、索引、用户、权限等）可以通过用户界面进行，同时你仍然能够直接执行任何SQL语句。

此插件专门设计用于管理官方的Home Assistant MariaDB插件。

## 安装

安装此插件非常简单，与安装其他Home Assistant插件没有区别。

1. 点击下面的Home Assistant我的按钮，以在你的Home Assistant实例中打开插件。

   [![在你的Home Assistant实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 启动“phpMyAdmin”插件。
4. 享受插件！

## 配置

**注意**: _在更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
```

**注意**: _这只是一个示例，不要复制和粘贴！请创建你自己的！_

### 选项: `upload_limit`

默认情况下，上传的大小限制（如导入操作）设置为64MB。可以通过此选项增加，例如，`100`将为100MB。

### 选项: `log_level`

`log_level`选项控制插件的日志输出级别，可以更改为较少或较多的详细信息，这在处理未知问题时可能很有用。可能的值有：

- `trace`: 显示每个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 异常发生，但不是错误。
- `error`: 运行时错误，无需立即处理。
- `fatal`: 发生严重错误。插件变得无法使用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug`也会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非你在排除故障。

## 已知问题和限制

- 此插件需要核心MariaDB插件版本2.0或更高。
- 此插件是为了管理官方的Home Assistant MariaDB插件而创建的。它无法连接到其他MySQL或MariaDB服务器。

## 更新日志及发布

此存储库使用[GitHub的发布][releases]功能保持变更日志。

发布基于[语义版本控制][semver]，使用`MAJOR.MINOR.PATCH`的格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的bug修复和包更新。

## 支持

有问题吗？

你有几种选择可以获得答案：

- Home Assistant社区插件Discord聊天服务器[discord]以获取插件支持和功能请求。
- Home Assistant Discord聊天服务器[discord-ha]进行一般的Home Assistant讨论和问题。
- Home Assistant[社区论坛][forum]。
- 加入[Reddit子版块][reddit] (/r/homeassistant)。

你也可以在这里[打开问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由[Franck Nijhof][frenck]进行。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可

MIT许可证

版权所有 (c) 2021-2025 Franck Nijhof

特此免费授权，任何获得此软件及相关文档文件（“软件”）副本的人，可以无任何限制地使用本软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售本软件的副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

本软件“按原样”提供，不附有任何形式的担保，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人对于因使用本软件或与软件或其他交易相关的任何索赔、损害或其他责任，不承担任何责任，无论是在合同诉讼、侵权或其他方面。

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