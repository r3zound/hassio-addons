# 非官方 Home Assistant 插件: Promtail

Promtail 被打包为 Home Assistant 插件。

## 默认设置

默认情况下，此插件版本的 Promtail 将从 systemd 日志中尾随日志。这将包括来自所有插件、管理程序、home assistant、docker 以及主机系统本身的所有日志。如果您已安装 Loki 插件，它将把这些日志发送到同一存储库中的 Loki 插件。如果您希望按此设置，则无需额外配置。

如果您调整了 Loki 插件的配置，拥有单独的 Loki 插件或有其他日志文件希望 Promtail 监视，请查看下面的配置选项。

## 配置

### 选项: `additional_pipeline_stages`

一个 YAML 文件的绝对路径，其中包含要应用于 [默认日志抓取配置][addon-default-config] 的附加管道阶段的列表。此选项的主要用途是对您使用的特定插件的日志应用额外处理，以便在日志嘈杂或难以阅读时进行优化。

此文件必须仅包含一个 YAML 列表的管道阶段。它们将被添加到已列出的阶段的末尾。如果您不喜欢已列出的阶段，请使用 `skip_default_scrape_config` 和 `additional_scrape_configs` 自行编写。以下是该文件内容的示例：

```yaml
- match:
    selector: '{container_name="addon_cebe7a76_hassio_google_drive_backup"}'
    stages:
      - multiline:
          firstline: '^\x{001b}'
```

这个具体的例子适用于 [google drive backup 插件][addon-google-drive-backup]。它使用与 Home Assistant 相同的日志格式，并在每行日志开头输出转义字符以进行终端的颜色编码。在多行阶段中查找该字符可以使追踪信息与造成错误的日志条目在同一条日志中，从而提高可读性。

有关如何配置管道阶段的更多信息，请参阅 [promtail 文档][promtail-doc-stages]。

**注意**: 此插件有权访问 `/ssl`、`/share` 和 `/config/promtail`。请将文件放置在这些位置之一，其他位置将无法工作。

### 选项: `skip_default_scrape_config`

Promtail 将使用您可以在 [这里][addon-default-config] 找到的预定义配置抓取 `systemd journal`。如果您只想让它查看您指定的特定日志文件，或者不喜欢默认配置并想对其进行调整，请将此设置为 `true`。然后，唯一使用的抓取配置将是您在 `additional_scrape_configs` 文件中指定的那些。

**注意**: 此插件有权访问 `/ssl`、`/share` 和 `/config/promtail`。请将文件放置在这些位置之一，其他位置将无法工作。

### 选项: `additional_scrape_configs`

一个 YAML 文件的绝对路径，其中包含 Promtail 要使用的附加抓取配置的列表。此选项的主要用途是指向由不使用 `stdout` 进行所有日志记录的插件创建的附加日志文件。您还可以通过将此与 `skip_default_scrape_config` 结合使用来更改被抓取的系统日志。如果 `skip_default_scrape_config` 为 `true`，则此字段将变为必需（否则将没有抓取配置）。

该文件必须仅包含一个 YAML 列表的抓取配置。以下是该文件内容的示例：

```yaml
- job_name: zigbee2mqtt_messages
  pipeline_stages:
  static_configs:
    - targets:
        - localhost
      labels:
        job: zigbee2mqtt_messages
        __path__: /share/zigbee2mqtt/log/**.txt
```

这个具体的例子会导致 Promtail 抓取 [Zigbee2MQTT 插件][addon-z2m] 默认生成的 MQTT 日志。

Promtail 提供了许多配置抓取配置的选项。有关可用选项及如何配置它们的更多信息，请参阅 [scrape_configs][promtail-doc-scrape-configs] 文档。文档还提供了您可以使用的 [其他示例][promtail-doc-examples]。

我还建议在创建自定义抓取配置之前阅读 [Loki 最佳实践][loki-doc-best-practices] 指南。管道非常强大，但避免创建过多的标签，因为这会带来更大的麻烦而非好处。相反，考虑您可以通过 [LogQL][logql] 在另一端做些什么。

**注意**: 此插件有权访问 `/ssl`、`/share` 和 `/config/promtail`。请将文件放置在这些位置之一，其他位置将无法工作。

### 端口: `9080/tcp`

Promtail 在此端口上公开一个 [API][api]。这主要用于管理程序监视器的健康检查，而不需要在主机上公开该端口。大多数用户应该将此选项保持禁用，除非您有外部应用程序在进行健康检查。

对于创建自定义抓取配置的高级用户来说，该 API 的另一个用途是公开由 [metrics][promtail-doc-metrics] 管道阶段生成的指标。公开此端口将允许您从网络上的其他系统读取这些指标。

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简练，以便在处理未知问题时可能会有用。可能的值包括：

- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的异常情况。
- `error`: 运行时错误，不需要立即采取行动。

请注意，每个级别自动包括更高严重级别的日志消息，例如，`debug` 还显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## PLG Stack (Promtail, Loki 和 Grafana)

Promtail 不是一款独立应用程序，它的工作是寻找日志、处理日志并将其发送到 Loki。您很可能想要完整的 PLG 堆栈：

- Promtail 以处理和发送日志
- Loki 以聚合和索引日志
- Grafana 以可视化和监控日志

[addon-default-config]: https://github.com/mdegat01/addon-promtail/blob/main/promtail/rootfs/etc/promtail/default-scrape-config.yaml
[addon-google-drive-backup]: https://github.com/sabeechen/hassio-google-drive-backup
[addon-z2m]: https://github.com/zigbee2mqtt/hassio-zigbee2mqtt
[api]: https://grafana.com/docs/loki/latest/clients/promtail/#api
[logql]: https://grafana.com/docs/loki/latest/logql/
[loki-doc-best-practices]: https://grafana.com/docs/loki/latest/best-practices/
[promtail-doc-examples]: https://grafana.com/docs/loki/latest/clients/promtail/configuration/#example-static-config
[promtail-doc-metrics]: https://grafana.com/docs/loki/latest/clients/promtail/configuration/#metrics
[promtail-doc-scrape-configs]: https://grafana.com/docs/loki/latest/clients/promtail/configuration/#scrape_configs
[promtail-doc-stages]: https://grafana.com/docs/loki/latest/clients/promtail/stages/