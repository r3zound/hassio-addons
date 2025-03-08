# Li Tin O`ve Weedle Assistant 插件: ntopng

这是一个用于 Home Assistant 的 ntopng 插件。
它包含了开源社区版本的 ntopng 
和开源的 netflow 收集器实现 netflow2ng

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 我的按钮，以在您的 Home
   Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

1. 点击“安装”按钮以安装插件。
1. 启动“示例”插件。
1. 检查“示例”插件的日志以查看它的运行情况。

## 配置

尽管这个插件只是一个示例插件，但它确实包含一些
配置选项供您玩耍。

**注意**: _更改配置后请记得重启插件。_

ntopng 插件配置：

```yaml
log_level: info
ssl: true
certfile: certfile.pem
keyfile: keyfile.pem
leave_front_door_open: false
ntop_auth: false
custom_scripts: false
dns_mode: 1
local_net:
  - 192.168.1.0/24
  - 192.168.30.0/22
export_flows: mysql;127.0.0.1;ntopng;user;secret_password
geoip_account_id: 123456
geoip_license_key: "Kdsalhdsl_lshahc_hskljd_as"
```

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以根据需要更改为更详细或更简洁，这可能在处理未知问题时很有用。可能的值包括：

- `trace`: 显示每个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 异常情况，但不是错误。
- `error`: 运行时错误，不需要立即采取行动。
- `fatal`: 发生严重错误。插件变得不可用。

请注意，每个级别自动包括来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您在进行故障排除。

### 选项: `ssl`

### 选项: `certfile`

### 选项: `keyfile`

### 选项: `leave_front_door_open`

### 选项: `ntop_auth`

### 选项: `custom_scripts`

### 选项: `dns_mode`

### 选项: `local_net`

### 选项: `export_flows`

### 选项: `geoip_account_id`

### 选项: `geoip_license_key`

## 更新日志与版本发布

这个仓库使用 [GitHub 的 releases][releases]
功能来维护变更日志。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下内容递增：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种方式可以获得答案：

- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]

您还可以在这里 [打开一个问题][issue] GitHub。

## 作者与贡献者

这个仓库的最初设置由 [Li Tin O`ve Weedle][litin] 完成。


## 许可证

Apache 2.0

版权 (c) 2023 Dominik Strnad

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_example&repository_url=https%3A%2F%2Fgithub.com%2Flitinoveweedle%2Fhassio-addons
[contributors]: https://github.com/litinoveweedle/hassio-addons/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io/t/repository-community-hass-io-add-ons/24705?u=litinoveweedle
[litin]: https://github.com/litinoveweedle
[issue]: https://github.com/litinoveweedle/hassio-addons/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/litinoveweedle/hassio-addons/ntopng/releases
[semver]: http://semver.org/spec/v2.0.0.html