# Home Assistant Community Add-on: Bookstack

BookStack 是一个简单、自托管、易于使用的信息组织和存储平台。请支持该软件的开发者 [Bookstack]。

## 安装

该附加组件的安装非常简单，与安装其他 Home Assistant 附加组件没有区别。

1. 在附加组件商店中搜索 "bookstack" 附加组件并安装。
1. 启动 "bookstack" 附加组件
1. 检查 "bookstack" 附加组件的日志以查看是否一切正常。
1. 默认登录信息为 admin@admin.com/password。

## 配置

**注意**：_更改配置后请记得重启附加组件。_

示例附加组件配置：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
envvars:
  - name: SESSION_COOKIE_NAME
    value: bookstack_session
```

**注意**：_这仅是一个示例，请不要复制粘贴！创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更加详细或简略，这在处理未知问题时可能非常有用。可选值包括：

- `trace`：显示每个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即处理的运行时错误。
- `fatal`：出现了严重错误。附加组件变得不可用。

请注意，每个级别自动包括更高级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下， `log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项: `ssl`

在 Bookstack 面板的 Web 界面上启用/禁用 SSL（HTTPS）。设置为 `true` 以启用，`false` 则为禁用。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `remote_mysql_host`

如果使用外部数据库，则为 MYSQL/MariaDB 数据库的主机名/地址。

### 选项: `remote_mysql_database`

仅在使用远程 MYSQL 数据库时适用，数据库的名称。

### 选项: `remote_mysql_username`

仅在使用远程 MYSQL 数据库时适用，具有权限的用户名。

### 选项: `remote_mysql_password`

仅在使用远程 MYSQL 数据库时适用，上述用户的密码。

### 选项: `remote_mysql_port`

仅在使用远程 MYSQL 数据库时适用，数据库服务器侦听的端口。

### 选项: `show_appkey`

如果设置为 `true`，将在附加组件日志中显示当前配置的 appkey。这应该在恢复时记录。

### 选项: `appkey`

允许用户定义 appkey，以便从其他系统恢复。如果设置，将在首次运行时自动从配置中删除。

### 选项: `envvars`

这允许设置环境变量来控制 Bookstack 配置，具体参考：

<https://www.bookstackapp.com/docs/>

**注意**：_更改这些选项可能会对您的实例造成问题。使用风险自负！_

这些选项区分大小写，任何通过特定配置设置的项将优先于此设置。

#### 子选项: `name`

要设置的环境变量名称。

#### 子选项: `value`

要设置的环境变量值。

## 数据库使用

默认情况下，Bookstack 会自动使用和配置 Home Assistant 的 MariaDB 附加组件，该组件应在启动之前安装，这可以在配置中更改为使用外部 MySql/MariaDB 数据库。请注意，这两种选项之间没有简单的升级路径。

## 已知问题和限制

- 由于应用程序存储图像文件的方式，Ingress 将无法工作。

## 更新日志与版本发布

该存储库使用 [GitHub 的版本发布][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，格式为 `MAJOR.MINOR.PATCH`。简单来说，版本将根据以下内容增加：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord]，用于附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha]，用于 Home Assistant 一般讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]

您也可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

该存储库的最初设置由 [Paul Sinclair][sinclairpaul] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Paul Sinclair

特此免费授予任何获得本软件及相关文档文件（以下简称“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售软件副本的权利，并允许提供软件的人这样做，但需遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

该软件是“按现状”提供的，不提供任何形式的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人都不对因使用该软件或其他交易中产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下。

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