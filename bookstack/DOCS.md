# Home Assistant Community Add-on: Bookstack

BookStack 是一个简单、可自托管、易于使用的平台，用于组织和存储信息。请支持该软件的开发者，访问 [Bookstack]。

## 安装

该插件的安装过程非常简单，与安装其他 Home Assistant 插件没有不同。

1. 在插件商店中搜索 "bookstack" 插件并安装它。
1. 启动 "bookstack" 插件。
1. 检查 "bookstack" 插件的日志，以确认一切正常。
1. 默认登录信息为 admin@admin.com/password。

## 配置

**注意**: _更改配置后请记得重启插件。_

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

**注意**: _这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以调整为更多或更少的详细信息，当您处理未知问题时，这可能会很有用。可能的值包括：

- `trace`: 显示每一个细节，如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的异常情况。
- `error`: 不需要立即行动的运行时错误。
- `fatal`: 出现严重问题，插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 同时也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排查故障。

### 选项: `ssl`

在 Bookstack 面板的网页界面上启用/禁用 SSL (HTTPS)。设置为 `true` 启用，设置为 `false` 否则。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**: _该文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**: _该文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `remote_mysql_host`

如果使用外部数据库，MYSQL/MariaDB 数据库的主机名/地址。

### 选项: `remote_mysql_database`

仅在使用远程 MYSQL 数据库时适用，数据库的名称。

### 选项: `remote_mysql_username`

仅在使用远程 MYSQL 数据库时适用，具有权限的用户名。

### 选项: `remote_mysql_password`

仅在使用远程 MYSQL 数据库时适用，以上用户的密码。

### 选项: `remote_mysql_port`

仅在使用远程 MYSQL 数据库时适用，数据库服务器监听的端口。

### 选项: `show_appkey`

如果设置为 `true`，将在插件日志中显示当前配置的 appkey。这应在恢复时记录。

### 选项: `appkey`

允许用户定义 appkey，以便从另一个系统恢复。如果设置则在第一次运行时会自动从配置中删除。

### 选项: `envvars`

这允许设置环境变量来控制 Bookstack 配置，具体文档请参考：

<https://www.bookstackapp.com/docs/>

**注意**: _更改这些选项可能会导致实例出现问题。自行承担风险使用！_

这些是区分大小写的，任何通过具体配置设置的项目将优先考虑。

#### 子选项: `name`

要设置的环境变量的名称。

#### 子选项: `value`

要设置的环境变量的值。

## 数据库使用

默认情况下，Bookstack 将自动使用并配置 Home Assistant 的 MariaDB 插件，该插件应在启动之前安装，您可以在配置中更改以使用外部 MySQL/MariaDB 数据库。请注意，这两种选项之间没有简单的升级路径。

## 已知问题和限制

- 由于应用程序存储图像文件的方式，Ingress 将无法正常工作。

## 更新日志与发布

此存储库使用 [GitHub 的 releases][releases] 功能维护变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简单来说，版本将根据以下内容进行递增：

- `MAJOR`: 不兼容或重大变化。
- `MINOR`: 向后兼容的新特性和增强功能。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种选择来获得答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 用于插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 用于一般 Home Assistant 讨论及问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您也可以在 [这里打开一个问题][issue] GitHub。

## 作者和贡献者

该存储库的原始设置由 [Paul Sinclair][sinclairpaul] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Paul Sinclair

特此授予任何获得本软件及相关文档文件（“软件”）副本的人免费许可，在不受限制的情况下处置软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，以及允许提供软件的人这样做，须遵循以下条件：

以上版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不作任何种类的保证，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用该软件或其他交易导致的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他行为中。

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