# 非官方 Home Assistant 插件：Promtail

Promtail 作为 Home Assistant 插件捆绑。

## 默认设置

默认情况下，这个插件版本的 Promtail 将从 systemd 日志中获取日志。这将包括来自所有插件、监视器、Home Assistant、Docker 和宿主系统本身的所有日志。如果您安装了 Loki 插件，它会将这些日志发送到同一存储库中的 Loki 插件。如果这是您想要的设置，则无需其他配置。

如果您调整了 Loki 插件的配置，有一个单独的 Loki 插件或有其他您希望 Promtail 监控的日志文件，请参见下面的配置选项。

## 配置

### 选项：`additional_pipeline_stages`

指向 YAML 文件的绝对路径，该文件包含要应用于 [默认日志抓取配置][addon-default-config] 的附加管道阶段的列表。它的主要用途是对来自您使用的特定插件的日志应用额外处理，如果这些日志嘈杂或难以阅读。

此文件必须仅包含一个 YAML 列表的管道阶段。它们将被添加到已列出的阶段的末尾。如果您不喜欢列出的阶段，请使用 `skip_default_scrape_config` 和 `additional_scrape_configs` 自行编写。以下是此文件内容的示例：

```yaml
- match:
    selector: '{container_name="addon_cebe7a76_hassio_google_drive_backup"}'
    stages:
      - multiline:
          firstline: '^\x{001b}'
```

这个特定示例适用于 [google drive backup 插件][addon-google-drive-backup]。它使用与 Home Assistant 相同的日志格式，并在每个日志行的开头输出转义字符以进行终端中的颜色编码。在多行阶段中查找该内容使得tracebacks与导致它们的错误包含在同一日志条目中，从而更易于阅读。

有关如何配置管道阶段的更多信息，请参见 [promtail 文档][promtail-doc-stages]。

**注意**：此插件可以访问 `/ssl`、`/share` 和 `/config/promtail`。将文件放在这些位置之一，其他位置无法使用。

### 选项：`skip_default_scrape_config`

Promtail 将使用您可以在 [这里][addon-default-config] 找到的预定义配置抓取 `systemd journal`。如果您只想查看您指定的特定日志文件，或者您不喜欢默认配置并想要进行调整，请将其设置为 `true`。然后，使用的唯一抓取配置将是您在 `additional_scrape_configs` 文件中指定的那些。

**注意**：此插件可以访问 `/ssl`、`/share` 和 `/config/promtail`。将文件放在这些位置之一，其他位置无法使用。

### 选项：`additional_scrape_configs`

指向 YAML 文件的绝对路径，该文件包含 Promtail 要使用的附加抓取配置的列表。此选项的主要用途是指向由不使用 `stdout` 进行所有日志记录的插件创建的附加日志文件。您还可以通过将其与 `skip_default_scrape_config` 结合使用来更改抓取的系统日志。 **注意**：如果 `skip_default_scrape_config` 为 `true`，则此字段为必填项（否则将没有抓取配置）。

该文件必须仅包含 YAML 列表的抓取配置。以下是此文件内容的示例：

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

这个特定示例将导致 Promtail 默认抓取 Zigbee2MQTT 插件[addon-z2m]生成的 MQTT 日志。

Promtail 提供了许多配置抓取配置的选项。有关可用选项及其配置的更多信息，请参见有关 [抓取配置][promtail-doc-scrape-configs] 的文档。文档还提供了您可以使用的 [其他示例][promtail-doc-examples]。

我还建议在创建自定义抓取配置之前阅读 [Loki 最佳实践][loki-doc-best-practices] 指南。管道功能强大，但应避免创建过多标签，这样做弊大于利。相反，请查看您可以在另一端用 [LogQL][logql] 做什么。

**注意**：此插件可以访问 `/ssl`、`/share` 和 `/config/promtail`。将文件放在这些位置之一，其他位置无法使用。

### 端口：`9080/tcp`

Promtail 在此端口公开 [API][api]。这主要用于 supervisor 监视器的健康检查，无需在宿主机上暴露它。大多数用户应该禁用此选项，除非您有外部应用程序进行健康检查。

对于创建自定义抓取配置的高级用户，API的另一个用途是暴露由 [metrics][promtail-doc-metrics] 管道阶段生成的指标。暴露此端口将允许您从网络上的另一个系统读取这些指标。

### 选项：`log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能很有用。可能的值包括：

- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不是错误的异常事件。
- `error`: 不需要立即采取行动的运行时错误。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## PLG 堆栈 (Promtail, Loki 和 Grafana)

Promtail 不是一个独立的应用程序，它的工作是查找日志、处理日志并将其发送到 Loki。您最可能想要完整的 PLG 堆栈：

- Promtail 处理和发送日志
- Loki 聚合和索引这些日志
- Grafana 可视化和监控这些日志

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