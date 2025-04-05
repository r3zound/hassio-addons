# Home Assistant 插件: Cloudflared

Cloudflared 通过安全隧道将您的 Home Assistant 实例连接到 Cloudflare 上的一个域名或子域名。这使您能够在不打开路由器端口的情况下，将 Home Assistant 实例和其他服务暴露到互联网。此外，您还可以利用 Cloudflare Zero Trust 来进一步保护您的连接。

## 免责声明

请确保在使用此插件时遵守 [Cloudflare 自助订阅协议][cloudflare-sssa]。

## 初始设置

### 前提条件

1. 一个使用 Cloudflare 进行 DNS 的域名（例如 example.com）。如果您没有域名，请参阅 [域名和 Cloudflare 设置][how-tos]。请注意，来自 **Freenom** 的域名已不再有效，因此您必须选择/迁移到其他注册商。
2. 在本地隧道（由插件管理）和远程隧道（在 Cloudflare 界面中管理）之间选择。 [了解更多][addon-remote-or-local]。
3. 此插件应 [已安装][addon-installation] 但尚未启动。

完成前提条件后，根据您选择的隧道类型继续操作。

### 本地隧道插件设置（推荐）

在以下步骤中，插件将自动创建一个 Cloudflare 隧道以暴露您的 Home Assistant 实例。

如果您只想暴露其他服务，可以将 `external_hostname` 置为空，并将 `additional_hosts` 设置为 [下面描述的内容](#configuration)。

1. 在您的 Home Assistant 配置中配置 `http` 集成，如 [下面描述的内容](#configurationyaml)
2. 将 `external_hostname` 插件选项设置为您希望用于远程访问的域名/子域名，例如 `ha.example.com`
3. 启动插件（这将覆盖任何与 `external_hostname` 或 `additional_hosts` 匹配的现有 DNS 条目）
4. 在新标签页中粘贴插件日志中的 URL，以便与 Cloudflare 进行身份验证
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`

现在，您的 Cloudflare Teams 仪表板中应该列出了一个隧道。请查看下面的其他配置选项。

### 远程隧道插件设置（高级）

在以下步骤中，您将手动在 Zero Trust Dashboard 中创建一个 Cloudflare 隧道，并将令牌提供给插件。

1. 在您的 Home Assistant 配置中配置 `http` 集成，如 [下面描述的内容](#configurationyaml)
2. 按照 [此操作指南][addon-remote-tunnel] 在 Cloudflare Teams 仪表板中创建一个 Cloudflare 隧道
3. 将 `tunnel_token` 插件选项设置为您的 [隧道令牌][create-remote-managed-tunnel]（所有其他配置将被忽略）
4. 启动插件，检查日志以确认一切按预期进行
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`

您的隧道现在应该与 Cloudflared 插件关联。任何配置更改应在 Cloudflare Teams 仪表板中进行。

## 配置

**这些配置选项仅适用于本地隧道设置**。更高级的配置可以通过远程隧道设置实现。

- [`external_hostname`](#option-external_hostname)
- [`additional_hosts`](#option-additional_hosts)
- [`tunnel_name`](#option-tunnel_name)
- [`catch_all_service`](#option-catch_all_service)
- [`nginx_proxy_manager`](#option-nginx_proxy_manager)
- [`post_quantum`](#option-post_quantum)
- [`run_parameters`](#option-run_parameters)
- [`log_level`](#option-log_level)

### 概览：插件配置

**注意**：_更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
external_hostname: ha.example.com
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: website.example.com
    service: http://192.168.1.3:8080
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项: `external_hostname`

将 `external_hostname` 选项设置为您希望用于访问 Home Assistant 的域名或子域名。

这是可选的，您可以使用 `additional_hosts` 来仅暴露其他服务。

**注意**：_隧道名称在您的 Cloudflare 帐户中必须是唯一的。_

```yaml
external_hostname: ha.example.com
```

### 选项: `additional_hosts`

您可以使用 Cloudflare 隧道的内部反向代理来定义其他主机，除了 Home Assistant。这样，您可以使用隧道访问其他系统，例如磁盘站、路由器或其他任何东西。

与用于 Home Assistant 的 `external_hostname` 选项一样，DNS 条目将在 Cloudflare 中自动创建。

向主机名添加（可选）`disableChunkedEncoding` 选项，以禁用分块传输编码。如果您正在运行 WSGI 服务器，例如 Proxmox，这非常有用。有关更多信息，请访问 [Cloudflare 文档][disablechunkedencoding]。

请在下面找到三个额外主机的示例条目：

```yaml
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: diskstation.example.com
    service: https://192.168.1.2:5001
  - hostname: website.example.com
    service: http://192.168.1.3:8080
    disableChunkedEncoding: true
```

**注意 1**：_如果您从列表中删除一个主机名，它将不再服务。但是，您还应手动从 Cloudflare 删除 DNS 条目，因为插件无法删除它。_

**注意 2**：_如果要完全删除 `additional_hosts` 选项，则必须在配置中添加一个空数组，如下所示：_

```yaml
additional_hosts: []
```

### 选项: `tunnel_name`

`tunnel_name` 选项允许将隧道名称更改为其他名称，而不是默认为 `homeassistant`。

**注意**：_隧道名称在您的 Cloudflare 帐户中必须是唯一的。_

```yaml
tunnel_name: myHomeAssistant
```

### 选项: `catch_all_service`

如果您想将所有来自没有在 `external_hostname` 或 `additional_hosts` 中定义的主机名的请求转发，您可以使用此选项并定义要转发到的 URL。例如，这可以用于反向代理。

**注意**：_如果您想将 HA 插件 [Nginx Proxy Manager][nginx_proxy_manager] 用作反向代理，您应该设置标志 `nginx_proxy_manager` （[见下文](#option-nginx_proxy_manager)），而不是使用此选项。_

```yaml
catch_all_service: http://192.168.1.100
```

**注意**：_这仍会将您定义的 `external_hostname` 路由到 Home Assistant，以及任何潜在的 `additional_hosts` 路由到您在配置中定义的地方。所有其他传入流量将被路由到定义的服务。_

为了通过隧道路由主机名，您必须为所有主机名在 Cloudflare 中创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目获得的隧道 URL。

或者，您可以通过添加带有 `*` 作为名称的 CNAME 记录，在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

### 选项: `nginx_proxy_manager`

如果您想将 Cloudflare 隧道与插件 [Nginx Proxy Manager][nginx_proxy_manager] 一起使用，可以通过设置此选项来实现。它将自动将 catch_all_service 设置为 Nginx Proxy Manager 的内部 URL。您无需将选项 `catch_all_service` 添加到您的配置中（如果您仍然添加它，将被忽略）。

```yaml
nginx_proxy_manager: true
```

**注意**：_与 `catch_all_service` 一样，这仍将路由您定义的 `external_hostname` 到 Home Assistant，以及任何潜在的 `additional_hosts` 到您在配置中定义的地方。所有其他传入流量将被路由到 Nginx Proxy Manager。_

为了通过隧道路由主机名，您必须为所有主机名在 Cloudflare 中创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目获得的隧道 URL。

或者，您可以通过添加带有 `*` 作为名称的 CNAME 记录，在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

最后，您必须在 Nginx Proxy Manager 中设置您的代理主机，并将它们转发到您所需的位置。

### 选项: `post_quantum`

如果您希望 Cloudflared 在隧道中使用后量子密码学，请设置此标志。

**注意**：_当设置 `post_quantum` 时，cloudflared 将只使用 QUIC 传输作为隧道连接。这可能会导致某些用户出现问题。此外，它将只允许后量子混合密钥交换，而不会回退到非后量子连接。_

```yaml
post_quantum: true
```

### 选项: `run_parameters`

您可以使用此参数向 cloudflared 守护进程添加其他运行参数。请查阅 [Cloudflare 文档][cloudflare-run_parameter] 以获取所有可用参数及其解释。

可以添加的有效参数包括：

- --​​edge-bind-address
- --edge-ip-version
- --grace-period
- --logfile
- --loglevel
- --pidfile
- --protocol
- --region
- --retries
- --tag
- --ha-connections

**注意**：_这些参数添加到默认存在的参数 "no-autoupdate"、"metrics" 和 "loglevel"。此外，对于本地管理的隧道，添加了 "origincert" 和 "config"，而 "token" 适用于远程管理的隧道。您无法通过此选项覆盖这些参数。_

**注意**：_如果您使用需要路径的选项，可以使用 /config 作为根目录。这个路径可以通过 VS-code 插件 via /addon_configs 访问。_

```yaml
run_parameters:
  - "--region=us"
  - "--protocol=http2"
  - "--loglevel=debug"
```

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能很有用。

**注意**：_如果您想更改隧道本身的日志级别，可以使用 `run_parameters` 中的 `--loglevel` 选项。_

```yaml
log_level: debug
```

可能的值包括：

- `trace`: 显示每个细节，例如调用的所有内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）有趣的事件。
- `warning`: 不属于错误的异常情况。
- `error`: 不需要立即采取行动的运行时错误。
- `fatal`: 发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更高级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐设置，除非您正在进行故障排除。

## Home Assistant 配置

### configuration.yaml

由于 Home Assistant 阻止来自代理/反向代理的请求，您需要告诉您的实例允许从 Cloudflared 插件发出请求。插件在本地运行，因此 HA 必须信任 Docker 网络。为此，请将以下行添加到您的 `/config/configuration.yaml` 中：

**注意**：_这些行不需要更改，因为 Docker 网络的 IP 范围始终是相同的。_

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

更改配置时，请记得重新启动 Home Assistant。

如果您需要帮助更改配置，请按照 [高级配置教程][advancedconfiguration] 进行操作。

## 插件维基

有关更高级的 [操作指南][how-tos] 和 [故障排除部分][troubleshooting]，请访问 [GitHub 上的插件维基][addon-wiki]。

## 作者 & 贡献者

本存储库的最初设置由 [Tobias Brenner][tobias] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2025 Tobias Brenner

特此免费授予任何获得该软件及相关文档文件（简称“软件”）副本的人，以无任何限制使用该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件副本的权利，并允许向其提供该软件的人员这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在所有副本或重要部分中。

该软件是以“原样”提供的，没有任何类型的明示或暗示担保，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任。

[addon-installation]: https://github.com/brenner-tobias/addon-cloudflared#installation
[addon-remote-tunnel]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos#how-to-configure-remote-tunnels
[addon-remote-or-local]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos#local-vs-remote-managed-tunnels
[addon-wiki]: https://github.com/brenner-tobias/addon-cloudflared/wiki
[advancedconfiguration]: https://www.home-assistant.io/getting-started/configuration/
[cloudflare-sssa]: https://www.cloudflare.com/en-gb/terms/
[cloudflare-run_parameter]: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/tunnel-run-parameters/
[contributors]: https://github.com/brenner-tobias/addon-cloudflared/graphs/contributors
[how-tos]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos
[nginx_proxy_manager]: https://github.com/hassio-addons/addon-nginx-proxy-manager
[tobias]: https://github.com/brenner-tobias
[troubleshooting]: https://github.com/brenner-tobias/addon-cloudflared/wiki/Troubleshooting
[disablechunkedencoding]: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/configuration/configuration-file/ingress#disablechunkedencoding
[create-remote-managed-tunnel]: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/#1-create-a-tunnel