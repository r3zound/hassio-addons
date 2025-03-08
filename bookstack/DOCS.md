# Home Assistant Community Add-on: Bookstack

BookStack 是一个简单的自托管、易于使用的信息组织和存储平台。请支持该软件的开发者，访问 [Bookstack]。

## 安装

此插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 在插件商店中搜索 "bookstack" 插件并安装。
1. 启动 "bookstack" 插件。
1. 检查 "bookstack" 插件的日志，查看一切是否正常。
1. 默认登录信息为 admin@admin.com/password。

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
envvars:
  - name: SESSION_COOKIE_NAME
    value: bookstack_session
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建你自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能非常有用。可能的值为：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常是）有趣的事件。
- `warning`：不是错误的异常情况。
- `error`：运行时错误，不需要立即处理。
- `fatal`：出现严重错误。插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如 `debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你在排查故障。

### 选项: `ssl`

在 Bookstack 面板的 Web 界面上启用/禁用 SSL（HTTPS）。设置为 `true` 以启用，设置为 `false` 以禁用。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置。_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认位置。_

### 选项: `remote_mysql_host`

如果使用外部数据库，MYSQL/MariaDB 数据库的主机名/地址。

### 选项: `remote_mysql_database`

仅在使用远程 MYSQL 数据库时适用，数据库的名称。

### 选项: `remote_mysql_username`

仅在使用远程 MYSQL 数据库时适用，具有权限的用户名。

### 选项: `remote_mysql_password`

仅在使用远程 MYSQL 数据库时适用，上述用户的密码。

### 选项: `remote_mysql_port`

仅在使用远程 MYSQL 数据库时适用，数据库服务器监听的端口。

### 选项: `show_appkey`

如果设置为 `true`，将显示当前配置的 appkey 在插件日志中。这应该在恢复时进行记录。

### 选项: `appkey`

允许用户定义 appkey，以便从其他系统恢复时使用。如果设置，将在首次运行时自动从配置中移除。

### 选项: `envvars`

这允许设置环境变量以控制 Bookstack 配置，如文档中所述：

<https://www.bookstackapp.com/docs/>

**注意**：_更改这些选项可能会导致实例出现问题。使用风险自负！_

这些选项对大小写敏感，任何特定配置设置的项将优先于其他项。

#### 子选项: `name`

要设置的环境变量的名称。

#### 子选项: `value`

要设置的环境变量的值。

## 数据库使用

默认情况下，Bookstack 将自动使用并配置 Home Assistant MariaDB 插件，该插件应该在启动之前安装，可以在配置中更改为使用外部 MySql/MariaDB 数据库。请注意，这两种选项之间没有简单的升级路径。

## 已知问题和限制

- 由于应用程序存储图像文件的方式，Ingress 将无法正常工作。

## 更新日志和发布

本存储库使用 [GitHub 的发布][releases] 功能保留变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下情况递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

你有几种方式可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取有关 Home Assistant 的一般讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit subreddit][reddit] 在 [/r/homeassistant][reddit]

你也可以在这里 [打开一个问题][issue] GitHub。

## 作者和贡献者

本存储库的原始设置由 [Paul Sinclair][sinclairpaul] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可

MIT 许可证

版权 (c) 2019-2025 Paul Sinclair

特此免费授权任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这么做，受以下条件的约束：

上述版权声明和本许可声明应包含在所有副本或重要部分中。

该软件按 "原样" 提供，不提供任何类型的保证，无论是明示或暗示，包括但不限于对适销性、特定目的适用性和非侵权的保证。作者或版权持有人在任何情况下均不对因使用该软件或其他交易而产生的任何索赔、损害或其他责任承担责任。

[bookstack]: https://www.bookstackapp.com/
[contributors]: https://github.com/hassio-addons/addon-bookstack/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/community-hass-io-xxxxx/xxxxx
[sinclairpaul]: https://github.com/sinclairpaul
[issue]: https://github.com/hassio-addons/addon-bookstack/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-bookstack/releases
[semver]: http://semver.org/spec/v2.0.0