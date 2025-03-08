# Home Assistant 插件：yarr

又一个 RSS 阅读器

## 安装

将这个仓库添加到你的 [Hass.io](https://home-assistant.io/hassio/) 实例中：

`https://github.com/einschmidt/hassio-addons`

如果遇到问题，可以参考 [官方文档](https://home-assistant.io/hassio/installing_third_party_addons/)。

然后安装 "yarr!" 插件。

## 配置

**注意**：_记得在更改配置后重启插件。_

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要设置为更详细或更简洁，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示所有细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常是）有趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是推荐的设置，除非你在进行故障排除。

### 选项：`login.username`

设置 yarr 的登录用户名。不能为空。

### 选项：`login.password`

设置 yarr 的登录密码。不能为空。

### 选项：`ssl`

在 yarr 的 Web 界面上启用/禁用 SSL (HTTPS)！
设置为 `true` 以启用，设置为 `false` 则禁用。

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/`，这是默认位置_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/`，这是默认位置_

### 选项：`db_path`

此选项允许你覆盖默认的数据库文件存储路径。例如，可以使用不同的配置，如 `/share/yarr/yarr.db` 而不是 `/data/yarr.db`。

如果不配置，插件将自动使用默认值：`/data/yarr.db`