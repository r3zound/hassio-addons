# Home Assistant 插件：Cloudflared

Cloudflared 通过安全隧道将您的 Home Assistant 实例连接到 Cloudflare 的域名或子域名。这使您能够在不打开路由器端口的情况下，将 Home Assistant 实例和其他服务暴露到互联网。此外，您可以利用 Cloudflare 零信任进一步保障您的连接。

## 声明

使用此插件时，请确保遵守[Cloudflare 自助订阅协议][cloudflare-sssa].

## 初始设置

### 先决条件

1. 一个使用 Cloudflare 进行 DNS 的域名（例如 example.com）。如果您没有域名，请参见[域名和 Cloudflare 设置][how-tos]。
   请注意，来自 **Freenom** 的域名不再有效，因此您必须选择/迁移到其他注册商。
2. 如果您还没有这样做，请为您的域名[在 Cloudflare 中激活 WebSockets][cloudflare-websockets]。
3. 在本地隧道（由插件管理）或远程隧道（在 Cloudflare 界面中管理）之间做出决定。[了解更多][addon-remote-or-local]。
4. 此插件应已[安装][addon-installation]但尚未启动。

完成先决条件后，根据您选择的隧道类型进行以下步骤。

### 本地隧道插件设置（推荐）

在以下步骤中，插件将自动创建一个 Cloudflare 隧道，以暴露您的 Home Assistant 实例。

如果您只想暴露其他服务，可以将 `external_hostname` 留空，并按照[以下描述](#configuration)设置 `additional_hosts`。

1. 在 Home Assistant 配置中配置 `http` 集成功能，如[以下描述](#configurationyaml)
2. 将 `external_hostname` 插件选项设置为您希望用于远程访问的域名/子域名，例如 `ha.example.com`
3. 启动插件（这将覆盖所有与 `external_hostname` 或 `additional_hosts` 匹配的现有 DNS 记录）
4. 在新标签页中粘贴插件日志中的 URL，以便与 Cloudflare 进行身份验证
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`

现在，您的 Cloudflare 团队仪表板中应该列出了一个隧道。请查看下面的其他配置选项。

### 远程隧道插件设置（高级）

在以下步骤中，您将手动在零信任仪表板中创建 Cloudflare 隧道，并将令牌提供给插件。

1. 在 Home Assistant 配置中将 `http` 集成功能配置为[以下描述](#configurationyaml)
2. 按照[此如何做][addon-remote-tunnel]在 Cloudflare 团队仪表板中创建 Cloudflare 隧道
3. 将 `tunnel_token` 插件选项设置为您的[tunnel token][create-remote-managed-tunnel]（将忽略所有其他配置）
4. 启动插件，检查日志以确认一切如预期般进行
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`

您的隧道现在应与 Cloudflared 插件关联。所有配置更改应在 Cloudflare Teams 仪表板中进行。

## 配置

**这些配置选项仅适用于本地隧道设置**。通过远程隧道设置可以实现更高级的配置。

- [`external_hostname`](#option-external_hostname)
- [`additional_hosts`](#option-additional_hosts)
- [`tunnel_name`](#option-tunnel_name)
- [`catch_all_service`](#option-catch_all_service)
- [`nginx_proxy_manager`](#option-nginx_proxy_manager)
- [`use_builtin_proxy`](#option-use_builtin_proxy)
- [`post_quantum`](#option-post_quantum)
- [`run_parameters`](#option-run_parameters)
- [`log_level`](#option-log_level)

### 概览：插件配置

**注意**：_记得在更改配置时重新启动插件。_

示例插件配置：

```yaml
external_hostname: ha.example.com
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: website.example.com
    service: http://192.168.1.3:8080
```

**注意**：_这只是一个示例，切勿复制粘贴！请创建您自己的！_

### 选项： `external_hostname`

将 `external_hostname` 选项设置为您希望用于访问 Home Assistant 的域名或子域名。

这是可选的，可以使用 `additional_hosts` 来仅暴露其他服务。

**注意**：_隧道名称在您的 Cloudflare 账户中需要是唯一的。_

```yaml
external_hostname: ha.example.com
```

### 选项： `additional_hosts`

您可以使用 Cloudflare Tunnel 的内部反向代理定义 Home Assistant 旁边的其他主机。这样，您可以使用隧道访问其他系统，如磁盘阵列、路由器或其他任何东西。

与用来访问 Home Assistant 的 `external_hostname` 选项一样，DNS 记录将在 Cloudflare 自动创建。

在主机名中添加（可选）`disableChunkedEncoding` 选项，以禁用分块传输编码。这在运行 WSGI 服务器（例如 Proxmox）时非常有用。请访问[Cloudflare 文档][disablechunkedencoding]以获取更多信息。

下面是三个额外主机的示例条目：

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

**注意 1**：_如果您从列表中删除一个主机名，它将不再提供服务。但是，您仍然应手动删除 Cloudflare 中的 DNS 记录，因为插件无法删除。_

**注意 2**：_如果您要完全删除 `additional_hosts` 选项，您必须在配置中添加一个空数组，如下所示：_

```yaml
additional_hosts: []
```

### 选项： `tunnel_name`

`tunnel_name` 选项允许将隧道名称更改为与默认的 `homeassistant` 不同的名称。

**注意**：_隧道名称在您的 Cloudflare 账户中需要是唯一的。_

```yaml
tunnel_name: myHomeAssistant
```

### 选项： `catch_all_service`

如果您希望将来自未在 `external_hostname` 或 `additional_hosts` 中定义的任何主机名的所有请求转发，您可以使用此选项并定义要转发到的 URL。例如，这可以用于反向代理。

**注意**：_如果您希望将 HA 插件[Nginx Proxy Manager][nginx_proxy_manager]用作反向代理，您应设置标志 `nginx_proxy_manager`（[见下文](#option-nginx_proxy_manager)）而不是使用此选项。_

```yaml
catch_all_service: http://192.168.1.100
```

**注意**：_这仍然会将您定义的 `external_hostname` 路由到 Home Assistant，并将任何潜在的 `additional_hosts` 路由到您在配置中定义的地方。任何其他传入流量将被路由到定义的服务。_

为了通过隧道路由主机名，您必须为所有主机名在 Cloudflare 中创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目中获取的隧道 URL。

您还可以通过添加名称为 `*` 的 CNAME 记录，在 Cloudflare 中添加[通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

### 选项： `nginx_proxy_manager`

如果您希望将 Cloudflare Tunnel 与插件[Nginx Proxy Manager][nginx_proxy_manager]一起使用，可以通过设置此选项来实现。它会自动将 `catch_all_service` 设置为 Nginx Proxy Manager 的内部 URL。您无需将 `catch_all_service` 选项添加到配置中（如果您添加了该选项，将会被忽略）。

```yaml
nginx_proxy_manager: true
```

**注意**：_与 `catch_all_service` 一样，这仍然会将您定义的 `external_hostname` 路由到 Home Assistant，并将任何潜在的 `additional_hosts` 路由到您在配置中定义的地方。任何其他传入流量将路由到 Nginx Proxy Manager。_

为了通过隧道路由主机名，您必须为所有主机名在 Cloudflare 中创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目中获取的隧道 URL。

您还可以通过添加名称为 `*` 的 CNAME 记录，在 Cloudflare 中添加[通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

最后，您必须在 Nginx Proxy Manager 中设置您的代理主机，并将它们转发到您希望的位置。

### 选项： `use_builtin_proxy`

如果启用，连接到 Home Assistant 将通过内置的 Nginx 代理进行。Nginx 被实现为解决实时日志问题的权宜之计。有关详细信息，请参见讨论[＃744](https://github.com/brenner-tobias/addon-cloudflared/discussions/744)

**注意**：_此选项默认启用。_

### 选项： `post_quantum`

如果您希望 Cloudflared 使用后量子加密进行隧道，则设置此标志。

**注意**：_当 `post_quantum` 被设置时，cloudflared 限制自己使用 QUIC 传输进行隧道连接。这可能会为某些用户带来问题。此外，它只允许后量子混合密钥交换，而不会回退到非后量子连接。_

```yaml
post_quantum: true
```

### 选项： `run_parameters`

您可以使用此参数向 cloudflared 守护进程添加其他运行参数。请查看[Cloudflare 文档][cloudflare-run_parameter]以获取所有可用参数及其说明。

可添加的有效参数包括：

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

**注意**：_这些参数将添加到默认情况中的参数 "no-autoupdate"、"metrics" 和 "loglevel"。此外，对于本地管理的隧道，将添加 "origincert" 和 "config"，而 "token" 将添加到远程管理的隧道中。您无法通过此选项覆盖这些参数。_

**注意**：_如果您正在使用需要路径的选项，可以将 /config 作为根路径。可以通过 VS-code 插件通过 /addon_configs 访问此路径。_

```yaml
run_parameters:
  - "--region=us"
  - "--protocol=http2"
  - "--loglevel=debug"
```

### 选项： `log_level`

`log_level` 选项控制插件的日志输出级别，并可以更改为更详细或更简洁，这在处理未知问题时可能会有所帮助。

**注意**：_如果要更改隧道本身的日志级别，可以使用 `run_parameters` 的 `--loglevel` 选项。_

```yaml
log_level: debug
```

可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：并非错误的异常事件。
- `error`：运行时错误，不需要立即行动。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别都自动包括来自更高级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## Home Assistant 配置

### configuration.yaml

由于 Home Assistant 阻止来自代理/反向代理的请求，您需要告诉您的实例允许来自 Cloudflared 插件的请求。插件在本地运行，因此 HA 必须信任 Docker 网络。为此，请在 `/config/configuration.yaml` 中添加以下行：

**注意**：_这些行中不需要调整任何内容，因为 Docker 网络的 IP 范围始终相同。_

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

**如果您使用 HA 的非标准托管方法（例如 Proxmox），您可能需要在此处添加其他 IP（范围）。在尝试连接后检查您的 HA 日志以找到正确的 IP。**

记得在更改配置时重新启动 Home Assistant。

如果您在修改配置时需要帮助，请遵循[高级配置教程][advancedconfiguration]。

## 插件维基

有关更多高级[如何做][how-tos]和[故障排除部分][troubleshooting]，请访问[GitHub 上的插件维基][addon-wiki]。

## 作者与贡献者

该存储库的最初设置由[Tobias Brenner][tobias]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT 许可证

版权 (c) 2025 Tobias Brenner

特此免费授予任何获得此软件及相关文档文件（以下简称“软件”）副本的人，以不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件副本的权利，并允许提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件是“按原样”提供的，没有任何种类的担保，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用该软件或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权诉讼或其他情况下。

[addon-installation]: https://github.com/brenner-tobias/addon-cloudflared#installation
[addon-remote-tunnel]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos#how-to-configure-remote-tunnels
[addon-remote-or-local]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos#local-vs-remote-managed-tunnels
[addon-wiki]: https://github.com/brenner-tobias/addon-cloudflared/wiki
[advancedconfiguration]: https://www.home-assistant.io/getting-started/configuration/
[cloudflare-sssa]: https://www.cloudflare.com/en-gb/terms/
[cloudflare-run_parameter]: https://developers.cloudflare.com/cloudflare-one/connections/connect-networks/configure-tunnels/tunnel-run-parameters/
[cloudflare-websockets]: https://developers.cloudflare.com/network/websockets/
[contributors]: https://github.com/brenner-tobias/addon-cloudflared/graphs/contributors
[how-tos]: https://github.com/brenner-tobias/addon-cloudflared/wiki/How-tos
[nginx_proxy_manager]: https://github.com/hassio-addons/addon-nginx-proxy-manager
[tobias]: https://github.com/brenner-tobias
[troubleshooting]: https://github.com/brenner-tobias/addon-cloudflared/wiki/Troubleshooting
[disablechunkedencoding]: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/configuration/configuration-file/ingress#disablechunkedencoding
[create-remote-managed-tunnel]: https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/install-and-setup/tunnel-guide/#1-create-a-tunnel