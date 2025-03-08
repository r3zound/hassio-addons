# Home Assistant Community Add-on: Bookstack

BookStack 是一个简单的，自托管的，易于使用的信息组织和存储平台。请支持这个软件的开发者，访问 [Bookstack]。

## 安装

这个附加组件的安装相当简单，与安装任何其他 Home Assistant 附加组件没有区别。

1. 在附加组件商店中搜索 "bookstack" 附加组件并安装。
1. 启动 "bookstack" 附加组件。
1. 检查 "bookstack" 附加组件的日志以查看是否一切正常。
1. 默认登录信息为 admin@admin.com/password。

## 配置

**注意**：_记得在更改配置时重启附加组件。_

附加组件配置示例：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
envvars:
  - name: SESSION_COOKIE_NAME
    value: bookstack_session
```

**注意**：_这只是一个示例，请不要复制粘贴！创建你自己的！_

### 选项：`log_level`

`log_level` 选项控制附加组件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值如下：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常的（通常是）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生了严重错误。附加组件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 级别也显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你在故障排除。

### 选项：`ssl`

在 Bookstack 面板的 web 界面上启用/禁用 SSL（HTTPS）。设置为 `true` 启用，设置为 `false` 则禁用。

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认的_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_文件必须存储在 `/ssl/` 中，这是默认的_

### 选项：`remote_mysql_host`

如果使用外部数据库，则为 MYSQL/MariaDB 数据库的主机名/地址。

### 选项：`remote_mysql_database`

仅适用于使用远程 MYSQL 数据库的情况，数据库名称。

### 选项：`remote_mysql_username`

仅适用于使用远程 MYSQL 数据库的情况，具有权限的用户名。

### 选项：`remote_mysql_password`

仅适用于使用远程 MYSQL 数据库的情况，上述用户的密码。

### 选项：`remote_mysql_port`

仅适用于使用远程 MYSQL 数据库的情况，数据库服务器监听的端口。

### 选项：`show_appkey`

如果设置为 `true`，将在附加组件日志中显示当前配置的 appkey。这在恢复时应记录。

### 选项：`appkey`

允许用户定义 appkey，以便从其他系统进行恢复。如果设置，将在首次运行时自动从配置中删除。

### 选项：`envvars`

这允许设置环境变量以控制 Bookstack 配置，具体文档请参见：

<https://www.bookstackapp.com/docs/>

**注意**：_更改这些选项可能会导致你的实例出现问题。使用风险自负！_

这些选项区分大小写，特定配置设置的任何项目将优先考虑。

#### 子选项：`name`

要设置的环境变量的名称。

#### 子选项：`value`

要设置的环境变量的值。

## 数据库使用

默认情况下，Bookstack 将自动使用和配置 Home Assistant MariaDB 附加组件，该组件应在启动之前安装，可以在配置中更改为使用外部 MySql/MariaDB 数据库。请注意，这两种选项之间没有简便的升级路径。

## 已知问题和限制

- 由于应用程序存储图像文件的方式，Ingress 将无法正常工作。

## 更新日志与发布

该存储库使用 [GitHub 的发布][releases] 功能保持变更日志。

发布基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 格式。简而言之，版本将根据以下内容进行增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新特性和增强。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

你有几种选择可以得到答案：

- [Home Assistant Community Add-ons Discord 聊天服务器][discord] 以获取附加组件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以进行一般 Home Assistant 讨论和提问。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

你也可以在这里 [提交问题][issue] 到 GitHub。

## 作者与贡献者

该存储库的原始设置由 [Paul Sinclair][sinclairpaul] 创建。

要查看所有作者和贡献者的完整列表，请访问 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 Paul Sinclair

特此免费授权任何获得本软件及其相关文档文件（“软件”）副本的人处理该软件，无限制地使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这样做，符合以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件是“按原样”提供的，不附有任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方式中。

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