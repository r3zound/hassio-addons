# Home Assistant 插件：FreshRSS

一个免费的、自托管的聚合器。

## 安装

将该仓库添加到您的 [Hass.io](https://home-assistant.io/hassio/) 实例中：

`https://github.com/einschmidt/hassio-addons`

如果遇到问题，可以查看 [官方文档](https://home-assistant.io/hassio/installing_third_party_addons/)。

然后安装 "FreshRSS" 插件。

## 配置

**注意**：_更改配置后，请记得重启插件。_

示例插件配置：

```yaml
log_level: info
base_url: example.domain.com
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

### 选项： `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要调整为更详细或更简单的输出，这在处理未知问题时可能会很有帮助。可能的值包括：

- `trace`：显示每个细节，比如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不是错误。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误，插件变得不可用。

请注意，每个级别自动包括来自更高级别的日志消息，例如，`debug` 级别也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排查。

### 选项： `base_url`

FreshRSS 实例可访问的地址。

### 选项： `ssl`

启用/禁用网络界面的 SSL（HTTPS）！将其设置为 `true` 以启用，反之则为 `false`。

### 选项： `certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项： `keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置_

## 第三方扩展

此插件允许您使用 **addon_config** 文件夹存储和管理 FreshRSS 扩展。

- 此文件夹在插件内映射自 **Home Assistant addon_config 目录**。
- 如果是从 GitHub 仓库安装，将存储在：

```
/addon_configs/{REPO}_freshrss/extensions