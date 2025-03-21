# Home Assistant 插件: Cloudflared

Cloudflared 通过安全隧道将你的 Home Assistant 实例连接到 Cloudflare 的某个域名或子域名。这使得你可以在不打开路由器端口的情况下将你的 Home Assistant 实例和其他服务暴露到互联网。此外，你还可以利用 Cloudflare Zero Trust 进一步保护你的连接。

## 免责声明

在使用此插件时，请确保遵守 [Cloudflare 自助订阅协议][cloudflare-sssa]。

## 初始设置

### 前提条件

1. 一个使用 Cloudflare 进行 DNS 的域名（例如 example.com）。如果你没有域名，请参见 [域名和 Cloudflare 设置][how-tos]。
   请注意，来自 **Freenom** 的域名不再可用，因此你需要选择/迁移到另一家注册商。
1. 在本地隧道（由插件管理）或远程隧道（在 Cloudflare 界面中管理）之间进行选择。 [了解更多][addon-remote-or-local]。
1. 此插件应 [安装][addon-installation] 但尚未启动。

完成前提条件后，根据你选择的隧道类型进行操作。

### 本地隧道插件设置（推荐）

在以下步骤中，插件将自动创建一个 Cloudflare 隧道以公开你的 Home Assistant 实例。

如果你只想暴露其他服务，可以将 `external_hostname` 留空，并将 `additional_hosts` 设置为 [下面描述的](#configuration)。

1. 按照 [下面描述的](#configurationyaml) 方法配置 Home Assistant 配置中的 `http` 集成。
1. 将 `external_hostname` 插件选项设置为你希望用于远程访问的域名/子域名，例如 `ha.example.com`。
1. 启动插件（这将覆盖任何与 `external_hostname` 或 `additional_hosts` 匹配的现有 DNS 条目）。
1. 在新标签中粘贴插件日志中的 URL 与 Cloudflare 进行身份验证。
1. 通过远程 URL 访问你的 Home Assistant，不带端口，例如 `https://ha.example.com/`。

现在应该在你的 Cloudflare Teams 仪表板中列出一个隧道。
请查看下面的其他配置选项。

### 远程隧道插件设置（高级）

在以下步骤中，你将手动在 Zero Trust 仪表板中创建一个 Cloudflare 隧道，并将令牌提供给插件。

1. 按照 [下面描述的](#configurationyaml) 方法配置 Home Assistant 配置中的 `http` 集成。
1. 在 Cloudflare Teams 仪表板中创建一个 Cloudflare 隧道，遵循 [此步骤][addon-remote-tunnel]。
1. 将 `tunnel_token` 插件选项设置为你的 [隧道令牌][create-remote-managed-tunnel]（其他所有配置将被忽略）。
1. 启动插件，检查日志以确认一切正常。
1. 通过远程 URL 访问你的 Home Assistant，不带端口，例如 `https://ha.example.com/`。

你的隧道现在应与 Cloudflared 插件相关联。所有配置更改应在 Cloudflare Teams 仪表板中进行。

## 配置

**这些配置选项仅适用于本地隧道设置**。更高级的配置可以通过远程隧道设置来实现。

- [`external_hostname`](#option-external_hostname)
- [`additional_hosts`](#option-additional_hosts)
- [`tunnel_name`](#option-tunnel_name)
- [`catch_all_service`](#option-catch_all_service)
- [`nginx_proxy_manager`](#option-nginx_proxy_manager)
- [`post_quantum`](#option-post_quantum)
- [`run_parameters`](#option-run_parameters)
- [`log_level`](#option-log_level)

### 概述: 插件配置

**注意**: _在更改配置时，请记得重启插件。_

示例插件配置：

```yaml
external_hostname: ha.example.com
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: website.example.com
    service: http://192.168.1.3:8080
```

**注意**: _这只是一个示例，不要复制和粘贴！创建你自己的！_

### 选项: `external_hostname`

将 `external_hostname` 选项设置为你希望用于访问 Home Assistant 的域名或子域名。

这是可选的，`additional_hosts` 可以用于仅暴露其他服务。

**注意**: _隧道名称在你的 Cloudflare 帐户中必须是唯一的。_

```yaml
external_hostname: ha.example.com
```

### 选项: `additional_hosts`

你可以使用 Cloudflare 隧道的内部反向代理来定义除了 Home Assistant 之外的额外主机。这样，你可以使用隧道访问其他系统，例如磁盘站、路由器或其他任何东西。

与用于 Home Assistant 的 `external_hostname` 选项一样，DNS 条目将在 Cloudflare 上自动创建。

将（可选的）`disableChunkedEncoding` 选项添加到主机名，以禁用分块传输编码。如果你正在运行 WSGI 服务器（例如 Proxmox），这非常有用。请访问 [Cloudflare 文档][disablechunkedencoding] 获取更多信息。

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

**注意 1**: _如果你从列表中删除主机名，它将不再提供服务。不过，你还应手动从 Cloudflare 中删除 DNS 条目，因为它无法由插件删除。_

**注意 2**: _如果你想完全删除 `additional_hosts` 选项，你必须在配置中添加一个空数组，如下所示：_

```yaml
additional_hosts: []
```

### 选项: `tunnel_name`

`tunnel_name` 选项允许将隧道名称更改为其他名称，而不是默认的 `homeassistant`。

**注意**: _隧道名称在你的 Cloudflare 帐户中必须是唯一的。_

```yaml
tunnel_name: myHomeAssistant
```

### 选项: `catch_all_service`

如果你想转发来自 `external_hostname` 或 `additional_hosts` 中未定义的任何主机名的所有请求，可以使用此选项并定义一个要转发到的 URL。例如，这可以用于反向代理。

**注意**: _如果你想使用 HA 插件 [Nginx Proxy Manager][nginx_proxy_manager] 作为反向代理，应设置标志 `nginx_proxy_manager`（[见下文](#option-nginx_proxy_manager)），而不是使用此选项。_

```yaml
catch_all_service: http://192.168.1.100
```

**注意**: _这仍然会将你的 `external_hostname` 路由到 Home Assistant，以及任何潜在的 `additional_hosts` 指向配置中定义的位置。任何其他传入流量将路由到定义的服务。_

为了通过隧道路由主机名，你需要在 Cloudflare 中为所有主机名创建单独的 CNAME 记录，指向你的 `external_hostname` 或直接指向你可以从 `external_hostname` 的 CNAME 条目中获得的隧道 URL。

或者，你可以通过添加名称为 `*` 的 CNAME 记录，在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

### 选项: `nginx_proxy_manager`

如果你想使用 Cloudflare 隧道与插件 [Nginx Proxy Manager][nginx_proxy_manager]，可以通过设置此选项来实现。它会自动将 `catch_all_service` 设置为 Nginx Proxy Manager 的内部 URL。你不必在配置中添加 `catch_all_service` 选项（如果你添加了，它将被忽略）。

```yaml
nginx_proxy_manager: true
```

**注意**: _与 `catch_all_service` 一样，这仍然将你的 `external_hostname` 路由到 Home Assistant，以及任何潜在的 `additional_hosts` 指向配置中定义的位置。任何其他传入流量将路由到 Nginx Proxy Manager。_

为了通过隧道路由主机名，你需要在 Cloudflare 中为所有主机名创建单独的 CNAME 记录，指向你的 `external_hostname` 或直接指向你可以从 `external_hostname` 的 CNAME 条目中获得的隧道 URL。

或者，你可以通过添加名称为 `*` 的 CNAME 记录，在 Cloudflare 中添加 [通配符 DNS 记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

最后，你需要在 Nginx Proxy Manager 中设置你的代理主机并将其转发到你喜欢的位置。

### 选项: `post_quantum`

如果你希望 Cloudflared 在隧道中使用后量子加密，请设置此标志。

**注意**: _当设置 `post_quantum` 时，cloudflared 将限制自己使用 QUIC 传输来进行隧道连接。这可能会给某些用户带来问题。此外，它只允许后量子混合密钥交换，而不回退到非后量子连接。_

```yaml
post_quantum: true
```

### 选项: `run_parameters`

你可以使用此参数为 cloudflared 守护进程添加其他运行参数。请查看 [Cloudflare 文档][cloudflare-run_parameter] 以获取所有可用参数及其说明。

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

**注意**: _这些参数将添加到默认存在的参数 "no-autoupdate"、"metrics" 和 "loglevel"。此外，对于本地管理的隧道，"origincert" 和 "config" 被添加，而 "token" 是针对远程管理隧道的。你不能通过此选项覆盖这些参数。_

**注意**: _如果你使用的选项需要路径，可以使用 /config 作为根路径。这个路径可以通过 VS-code 插件通过 /addon_configs 访问。_

```yaml
run_parameters:
  - "--region=us"
  - "--protocol=http2"
  - "--loglevel=debug"
```

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简单的设置，这在处理未知问题时可能很有用。

**注意**: _如果你想更改隧道本身的日志级别，可以使用 `run_parameters` 的 `--loglevel` 选项。_

```yaml
log_level: debug
```

可能的值有：

- `trace`：显示每个细节，像是所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）感兴趣的事件。
- `warning`：不属于错误的异常情况。
- `error`：运行时错误，不需要立即处理。
- `fatal`：发生了严重错误，插件变得无法使用。

请注意，每个级别自动包含来自更高严重级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你正在进行故障排除。

## Home Assistant 配置

### configuration.yaml

由于 Home Assistant 阻止来自代理/反向代理的请求，因此你需要告知你的实例允许来自 Cloudflared 插件的请求。插件在本地运行，因此 HA 必须信任 docker 网络。为此，请在你的 `/config/configuration.yaml` 中添加以下行：

**注意**: _这些行中的内容无需做任何调整，因为 docker 网络的 IP 范围始终是相同的。_

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

在更改配置时，请记得重启 Home Assistant。

如果你需要帮助更改配置，请按照 [高级配置教程][advancedconfiguration]。

## 插件维基

有关更多高级 [使用指南][how-tos] 和 [故障排除部分][troubleshooting]，请访问 [GitHub 上的插件维基][addon-wiki]。

## 作者与贡献者

本仓库的最初设置由 [Tobias Brenner][tobias] 完成。

要查看所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2025 Tobias Brenner

特此授予任何获取本软件及其相关文档文件（“软件”）的人员免费许可，无限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件的副本，并允许提供软件的人员这样做，前提是满足以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

本软件按“原样”提供，不作任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性的保证，以及不侵权。在任何情况下，作者或版权持有者均不对因使用软件或其它交易而引起或与之相关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权还是其他诉讼中。