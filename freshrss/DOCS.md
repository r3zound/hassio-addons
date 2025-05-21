# Home Assistant 插件: FreshRSS

一个免费的、自托管的源聚合器。

## 安装

将此仓库添加到您的 [Hass.io](https://home-assistant.io/hassio/) 实例中：

`https://github.com/einschmidt/hassio-addons`

如果您遇到问题，可以参考 [官方文档](https://home-assistant.io/hassio/installing_third_party_addons/)。

然后安装 "FreshRSS" 插件。

## 配置

**注意**: _在更改配置后请记得重启插件。_

示例插件配置：

```yaml
log_level: info
base_url: example.domain.com
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
```

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要改变为更详细或更简略，这在处理未知问题时可能很有用。可能的值包括：

- `trace`: 显示每一个细节，如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的异常情况。
- `error`: 运行时错误，无需立即处理。
- `fatal`: 发生了严重错误。插件变得不可用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在排查问题。

### 选项: `base_url`

FreshRSS 实例可通过该地址访问。

### 选项: `ssl`

启用/禁用 Web 界面的 SSL (HTTPS)!
设置为 `true` 以启用，`false` 则禁用。

### 选项: `certfile`

用于 SSL 的证书文件。

**注意**: _该文件必须存储在 `/ssl/` 中，这是默认路径_

### 选项: `keyfile`

用于 SSL 的私钥文件。

**注意**: _该文件必须存储在 `/ssl/` 中，这是默认路径_

## 第三方扩展

此插件允许您使用 **addon_config** 文件夹存储和管理 FreshRSS 扩展。

- 此文件夹在插件内映射自 **Home Assistant addon_config 目录**。
- 如果是从 GitHub 仓库安装，则存储在：

```
/addon_configs/{REPO}_freshrss/extensions