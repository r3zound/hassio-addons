# Home Assistant 插件：Cloudflared

Cloudflared 通过安全隧道将您的 Home Assistant 实例连接到 Cloudflare 的域或子域。这允许您在不打开路由器端口的情况下将 Home Assistant 实例和其他服务暴露到互联网。此外，您还可以利用 Cloudflare 零信任进一步保护您的连接。

## 声明

在使用本插件时，请确保您遵守 [Cloudflare 自助订阅协议][cloudflare-sssa]。

## 初始设置

### 前提条件

1. 一个使用 Cloudflare 进行 DNS 的域名（例如 example.com）。如果您还没有，请参见 [域名和 Cloudflare 设置][how-tos]。请注意，来自 **Freenom** 的域名不再有效，因此您必须选择/迁移到其他注册商。
2. 如果您还未完成，请[为您的域名激活 Cloudflare 中的 Websockets][cloudflare-websockets]。
3. 决定使用本地隧道（由插件管理）还是远程隧道（在 Cloudflare 界面中管理）。[了解更多][addon-remote-or-local]。
4. 本插件应该是[已安装][addon-installation]但尚未启动。

完成前提条件后，请根据您选择的隧道类型继续以下操作。

### 本地隧道插件设置（推荐）

在接下来的步骤中，插件将自动创建一个 Cloudflare 隧道以暴露您的 Home Assistant 实例。

如果您只想暴露其他服务，可以将 `external_hostname` 设为空，并将 `additional_hosts` 设置为[如下所述](#configuration)。

1. 按[如下所述](#configurationyaml) 在您的 Home Assistant 配置中配置 `http` 集成。
2. 将 `external_hostname` 插件选项设置为您希望用于远程访问的域名/子域名，例如 `ha.example.com`。
3. 启动插件（这将覆盖任何与 `external_hostname` 或 `additional_hosts` 匹配的现有 DNS 条目）。
4. 将插件日志中的 URL 粘贴到新标签中以通过 Cloudflare 进行身份验证。
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`。

现在应该在您的 Cloudflare 团队仪表板中列出一个隧道。请查看以下额外配置选项。

### 远程隧道插件设置（高级）

在接下来的步骤中，您将手动在零信任仪表板中创建 Cloudflare 隧道，并将令牌提供给插件。

1. 按[如下所述](#configurationyaml) 在您的 Home Assistant 配置中配置 `http` 集成。
2. 在 Cloudflare 团队仪表板中创建一个 Cloudflare 隧道，按照[本指南][addon-remote-tunnel]。
3. 将 `tunnel_token` 插件选项设置为您的 [隧道令牌][create-remote-managed-tunnel] （所有其他配置将被忽略）。
4. 启动插件，检查日志以确认一切正常。
5. 通过远程 URL 访问您的 Home Assistant，无需端口，例如 `https://ha.example.com/`。

您的隧道现在应该与 Cloudflared 插件相关联。任何配置更改应在 Cloudflare 团队仪表板中进行。

## 配置

**这些配置选项仅适用于本地隧道设置**。使用远程隧道设置可以实现更高级的配置。

- [`external_hostname`](#option-external_hostname)
- [`additional_hosts`](#option-additional_hosts)
- [`tunnel_name`](#option-tunnel_name)
- [`catch_all_service`](#option-catch_all_service)
- [`nginx_proxy_manager`](#option-nginx_proxy_manager)
- [`use_builtin_proxy`](#option-use_builtin_proxy)
- [`post_quantum`](#option-post_quantum)
- [`run_parameters`](#option-run_parameters)
- [`log_level`](#option-log_level)

### 概述：插件配置

**注意**：_请记得在更改配置时重启插件。_

示例插件配置：

```yaml
external_hostname: ha.example.com
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: website.example.com
    service: http://192.168.1.3:8080
```

**注意**：_这只是一种示例，不要复制和粘贴！创建您自己的！_

### 选项： `external_hostname`

将 `external_hostname` 选项设置为您希望用于访问 Home Assistant 的域名或子域名。

这是可选的，可以改为使用 `additional_hosts` 来仅暴露其他服务。

**注意**：_隧道名称在您的 Cloudflare 账户中需要是唯一的。_

```yaml
external_hostname: ha.example.com
```

### 选项： `additional_hosts`

您可以使用 Cloudflare 隧道的内部反向代理来定义额外的主机，从而除了 Home Assistant 之外还可以访问其他系统，如磁盘站、路由器或任何其他设备。

与用于 Home Assistant 的 `external_hostname` 选项一样，DNS 条目将在 Cloudflare 中自动创建。

将（可选） `disableChunkedEncoding` 选项添加到主机名，以禁用分块传输编码。如果您正在运行 WSGI 服务器，例如 Proxmox，这非常有用。有关更多信息，请访问 [Cloudflare 文档][disablechunkedencoding]。

以下是三个附加主机的示例条目：

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

**注意 1**：_如果您从列表中删除了一个主机名，则该主机将不再被服务。然而，您还应该手动从 Cloudflare 中删除 DNS 条目，因为插件无法删除它。_

**注意 2**：_如果您想完全删除 `additional_hosts` 选项，您必须在配置中添加一个空数组，如下所示：_

```yaml
additional_hosts: []
```

### 选项： `tunnel_name`

`tunnel_name` 选项允许将隧道名称更改为除默认名称 `homeassistant` 之外的其他名称。

**注意**：_隧道名称在您的 Cloudflare 账户中需要是唯一的。_

```yaml
tunnel_name: myHomeAssistant
```

### 选项： `catch_all_service`

如果您希望将来自未在 `external_hostname` 或 `additional_hosts` 中定义的任何主机名的所有请求转发，可以使用此选项并定义一个要转发的 URL。例如，这可以用于反向代理。

**注意**：_如果您希望将 HA 插件 [Nginx Proxy Manager][nginx_proxy_manager] 用作反向代理，则应设置标志 `nginx_proxy_manager`（[见下文](#option-nginx_proxy_manager)），并且不使用此选项。_

```yaml
catch_all_service: http://192.168.1.100
```

**注意**：_这仍将把您定义的 `external_hostname` 路由到 Home Assistant，并且任何潜在的 `additional_hosts` 路由到您在配置中定义的地方。任何其他传入流量将被路由到定义的服务。_

为了通过隧道路由主机名，您必须在 Cloudflare 中为所有主机名创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目中获得的隧道 URL。

您还可以通过添加一个名称为 `*` 的 CNAME 记录在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

### 选项： `nginx_proxy_manager`

如果您希望将 Cloudflare 隧道与插件 [Nginx Proxy Manager][nginx_proxy_manager] 一起使用，可以通过设置此选项来实现。它将自动将 `catch_all_service` 设置为 Nginx Proxy Manager 的内部 URL。您无需在配置中添加选项 `catch_all_service` （如果您添加，它将被忽略）。

```yaml
nginx_proxy_manager: true
```

**注意**：_与 `catch_all_service` 一样，这仍将把您定义的 `external_hostname` 路由到 Home Assistant，并且任何潜在的 `additional_hosts` 路由到您在配置中定义的地方。任何其他传入流量将被路由到 Nginx Proxy Manager。_

为了通过隧道路由主机名，您必须在 Cloudflare 中为所有主机名创建单独的 CNAME 记录，指向您的 `external_hostname` 或直接指向您可以从 `external_hostname` 的 CNAME 条目中获得的隧道 URL。

您还可以通过添加一个名称为 `*` 的 CNAME 记录在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

最后，您必须在 Nginx Proxy Manager 中设置您的代理主机，并将它们转发到您喜欢的地方。

### 选项： `use_builtin_proxy`

如果启用，则连接到 Home Assistant 将通过内置 Nginx 代理进行。Nginx 的实现是为了解决实时日志的问题。有关参考，请参见讨论 [#744](https://github.com/brenner-tobias/addon-cloudflared/discussions/744)。

**注意**：_此选项默认启用。_

### 选项： `post_quantum`

如果您希望 Cloudflared 为隧道使用后量子密码学，请设置此标志。

**注意**：_当设置 `post_quantum` 时，cloudflared 将限制为QUIC 传输进行隧道连接。这可能会对某些用户造成问题。此外，它只允许后量子混合密钥交换，而不会回退到非后量子连接。_

```yaml
post_quantum: true
```

### 选项： `run_parameters`

您可以使用此参数向 cloudflared 守护进程添加其他运行参数。请查阅 [Cloudflare 文档][cloudflare-run_parameter] 以获取所有可用参数及其说明。

可以添加的有效参数有：

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

**注意**：_这些参数是添加到默认存在的参数 "no-autoupdate"、"metrics" 和 "loglevel" 中。此外，对于本地管理的隧道，还添加了 "origincert" 和 "config"，而对于远程管理的隧道则添加了 "token"。您无法通过此选项覆盖这些参数。_

**注意**：_如果您使用了需要路径的选项，可以使用 /config 作为根路径。此路径可以通过 VS-code 插件通过 /addon_configs 访问。_

```yaml
run_parameters:
  - "--region=us"
  - "--protocol=http2"
  - "--loglevel=debug"
```

### 选项： `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁的输出，这在您处理未知问题时可能会很有用。

**注意**：_如果您想更改隧道本身的日志级别，可以使用 `run_parameters` 的 `--loglevel` 选项。_

```yaml
log_level: debug
```

可能的值有：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常事件，但不属于错误。
- `error`：运行时错误，虽然不需要立即处理。
- `fatal`：发生了严重错误，插件变得无法使用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

## Home Assistant 配置

### configuration.yaml

由于 Home Assistant 拦截来自代理/反向代理的请求，您需要告诉实例允许来自 Cloudflared 插件的请求。插件是在本地运行的，因此 HA 必须信任 Docker 网络。为此，请在您的 `/config/configuration.yaml` 中添加以下行：

**注意**：_在这些行中没有需要适应的内容，因为 Docker 网络的 IP 范围始终相同。_

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

**如果您使用非标准的 HA 托管方法（例如 Proxmox），您可能需要在此处添加另一个 IP（范围）。在尝试连接后检查您的 HA 日志以找到正确的 IP。**

记得在更改配置时重启 Home Assistant。

如果您需要帮助更改配置，请遵循 [高级配置教程][advancedconfiguration]。

## 插件维基

有关更多高级[操作指南][how-tos]和[故障排除部分][troubleshooting]，请访问 [GitHub 上的插件维基][addon-wiki]。

## 作者与贡献者

此存储库的最初设置由 [Tobias Brenner][tobias] 进行。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2025 Tobias Brenner

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人，使用、复制、修改、合并、发布、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和此许可声明应包含在所有副本或重要部分中。

本软件是“按原样”提供的，没有任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、适合特定用途和非侵权的保证。在任何情况下，作者或版权持有者均不对因使用或其他交易而产生的索赔、损害或其他责任承担责任，无论是在合同、侵权还是其他方面。

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