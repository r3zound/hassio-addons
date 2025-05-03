# Home Assistant 插件：Cloudflared

Cloudflared通过安全隧道将您的Home Assistant实例连接到Cloudflare上的一个域名或子域名。这使您能够将您的Home Assistant实例和其他服务暴露到互联网，而无需在路由器上打开端口。此外，您可以利用Cloudflare Zero Trust进一步保护您的连接。

## 免责声明

请确保在使用此插件时遵守[Cloudflare自助订阅协议][cloudflare-sssa]。

## 初始设置

### 前提条件

1. 一个使用Cloudflare进行DNS的域名（例如example.com）。如果您没有，请参见[域名和Cloudflare设置][how-tos]。请注意，来自**Freenom**的域名不再有效，因此您必须选择/迁移到其他注册商。
2. 如果您还没有这样做，[为您的域名在Cloudflare中激活Websockets][cloudflare-websockets]。
3. 在本地隧道（由插件管理）或远程隧道（在Cloudflare的界面中管理）之间进行选择。[了解更多][addon-remote-or-local]。
4. 此插件应[安装][addon-installation]但尚未启动。

完成前提条件后，根据您选择的隧道类型继续以下步骤。

### 本地隧道插件设置（推荐）

在以下步骤中，插件将自动创建一个Cloudflare隧道，以暴露您的Home Assistant实例。

如果您只想暴露其他服务，则可以将`external_hostname`留空，并将`additional_hosts`设置为[下面描述的内容](#configuration)。

1. 按照[下面描述的内容](#configurationyaml)在您的Home Assistant配置中配置`http`集成。
2. 将`external_hostname`插件选项设置为您想用于远程访问的域名/子域名，例如`ha.example.com`。
3. 启动插件（这将覆盖任何与`external_hostname`或`additional_hosts`匹配的现有DNS条目）。
4. 在新标签页中粘贴插件日志中的URL以进行Cloudflare身份验证。
5. 通过远程URL访问您的Home Assistant，而无需端口，例如`https://ha.example.com/`。

现在，您在Cloudflare团队仪表板中应该可以看到一个隧道。请查看下面的其他配置选项。

### 远程隧道插件设置（高级）

在以下步骤中，您将手动在Zero Trust仪表板中创建一个Cloudflare隧道，并将令牌提供给插件。

1. 按照[下面描述的内容](#configurationyaml)在您的Home Assistant配置中配置`http`集成。
2. 在Cloudflare团队仪表板中创建一个Cloudflare隧道，遵循[此如何做][addon-remote-tunnel]。
3. 将`tunnel_token`插件选项设置为您的[tunnel token][create-remote-managed-tunnel]（所有其他配置将被忽略）。
4. 启动插件，检查日志以确认一切正常。
5. 通过远程URL访问您的Home Assistant，而无需端口，例如`https://ha.example.com/`。

您的隧道现在应该与Cloudflared插件相关联。任何配置更改均应在Cloudflare团队仪表板中进行。

## 配置

**这些配置选项仅适用于本地隧道设置**。使用远程隧道设置可以实现更高级的配置。

- [`external_hostname`](#option-external_hostname)
- [`additional_hosts`](#option-additional_hosts)
- [`tunnel_name`](#option-tunnel_name)
- [`catch_all_service`](#option-catch_all_service)
- [`nginx_proxy_manager`](#option-nginx_proxy_manager)
- [`post_quantum`](#option-post_quantum)
- [`run_parameters`](#option-run_parameters)
- [`log_level`](#option-log_level)

### 概述：插件配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
external_hostname: ha.example.com
additional_hosts:
  - hostname: router.example.com
    service: http://192.168.1.1
  - hostname: website.example.com
    service: http://192.168.1.3:8080
```

**注意**：_这仅是一个示例，请勿复制粘贴！创建您自己的配置！_

### 选项：`external_hostname`

将`external_hostname`选项设置为您想用于访问Home Assistant的域名或子域名。

这是可选的，可以使用`additional_hosts`来仅暴露其他服务。

**注意**：_在您的Cloudflare帐户中，隧道名称需要是唯一的。_

```yaml
external_hostname: ha.example.com
```

### 选项：`additional_hosts`

您可以使用Cloudflare隧道的内部反向代理在Home Assistant旁边定义其他主机。这样，您可以使用隧道访问其他系统，如磁盘站、路由器或其他任何东西。

与用于Home Assistant的`external_hostname`选项一样，DNS条目将在Cloudflare中自动创建。

将（可选）`disableChunkedEncoding`选项添加到主机名，以禁用分块传输编码。这在运行WSGI服务器时非常有用，例如Proxmox。请访问[Cloudflare文档][disablechunkedencoding]以获取更多信息。

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

**注意 1**：_如果您从列表中删除主机名，将不再提供该主机名。不过，您也应从Cloudflare手动删除DNS条目，因为插件无法删除它。_

**注意 2**：_如果您想完全删除`additional_hosts`选项，必须在配置中添加一个空数组，如下所示：_

```yaml
additional_hosts: []
```

### 选项：`tunnel_name`

` тунел_name`选项允许将隧道名称更改为其他名称，而不是默认的`homeassistant`。

**注意**：_隧道名称需要在您的Cloudflare帐户中是唯一的。_

```yaml
tunnel_name: myHomeAssistant
```

### 选项：`catch_all_service`

如果您想转发所有未在`external_hostname`或`additional_hosts`中定义的主机名的请求，您可以使用此选项并定义一个要转发到的URL。例如，这可以用于反向代理。

**注意**：_如果您想使用HA插件[Nginx Proxy Manager][nginx_proxy_manager]作为反向代理，您应该设置`nginx_proxy_manager`标志（[见下文](#option-nginx_proxy_manager)），而不是使用此选项。_

```yaml
catch_all_service: http://192.168.1.100
```

**注意**：_这仍将路由您定义的`external_hostname`到Home Assistant，以及您在配置中定义的任何潜在`additional_hosts`。任何其他传入流量将被路由到定义的服务。_

为了通过隧道路由主机名，您必须在Cloudflare中为它们创建单独的CNAME记录，指向您的`external_hostname`或直接指向您可以从`external_hostname`的CNAME条目获得的隧道URL。

或者，您可以通过添加名称为`*`的CNAME记录来在Cloudflare中添加[通配符DNS记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

### 选项：`nginx_proxy_manager`

如果您希望将Cloudflare隧道与插件[Nginx Proxy Manager][nginx_proxy_manager]一起使用，可以通过设置此选项来做到这一点。它会自动将catch_all_service设置为Nginx Proxy Manager的内部URL。您不必将选项`catch_all_service`添加到您的配置中（如果您确实添加，它将被忽略）。

```yaml
nginx_proxy_manager: true
```

**注意**：_与`catch_all_service`一样，这仍将路由您定义的`external_hostname`到Home Assistant，以及您在配置中定义的任何潜在`additional_hosts`。任何其他传入流量将被路由到Nginx Proxy Manager。_

为了通过隧道路由主机名，您必须在Cloudflare中为它们创建单独的CNAME记录，指向您的`external_hostname`或直接指向您可以从`external_hostname`的CNAME条目获得的隧道URL。

或者，您可以通过添加名称为`*`的CNAME记录来在Cloudflare中添加[通配符DNS记录](https://blog.cloudflare.com/wildcard-proxy-for-everyone/)。

最后，您必须在Nginx Proxy Manager中设置您的代理主机，并将它们转发到您喜欢的位置。

### 选项：`post_quantum`

如果您希望Cloudflared为隧道使用后量子密码学，请设置此标志。

**注意**：_当`post_quantum`被设置后，cloudflared将仅限于隧道连接的QUIC传输。这可能会导致某些用户出现问题。此外，它将只允许后量子混合密钥交换，而不会回退到非后量子连接。_

```yaml
post_quantum: true
```

### 选项：`run_parameters`

您可以使用此参数向cloudflared守护进程添加其他运行参数。请查看[Cloudflare文档][cloudflare-run_parameter]以获取所有可用参数及其说明。

有效的参数包括：

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

**注意**：_这些参数将添加到默认存在的参数“no-autoupdate”、“metrics”和“loglevel”。此外，对于本地管理的隧道，添加了“origincert”和“config”，而对远程管理的隧道，则添加了“token”。您无法通过此选项覆盖这些参数。_

**注意**：_如果您使用的是需要路径的选项，可以将/config用作根目录。此路径可以通过VS-code插件访问，例如，路径为/addon_configs。_

```yaml
run_parameters:
  - "--region=us"
  - "--protocol=http2"
  - "--loglevel=debug"
```

### 选项：`log_level`

`log_level`选项控制插件的日志输出级别，可以更改为更详细或更简洁，这在处理未知问题时可能会很有用。

**注意**：_如果您想更改隧道本身的日志级别，可以使用`run_parameters`中的`--loglevel`选项。_

```yaml
log_level: debug
```

可能的值包括：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：不需要立即采取行动的运行时错误。
- `fatal`：发生严重错误。插件变得不可用。

请注意，每个级别自动包括更严重级别的日志消息，例如，`debug`也显示`info`消息。默认情况下，`log_level`设置为`info`，这为推荐设置，除非您正在进行故障排除。

## Home Assistant 配置

### configuration.yaml

由于Home Assistant阻止来自代理/反向代理的请求，您需要告诉实例允许Cloudflared插件的请求。该插件在本地运行，因此HA必须信任docker网络。为此，请在您的`/config/configuration.yaml`中添加以下行：

**注意**：_在这些行中没有必要适应任何内容，因为docker网络的IP范围始终相同。_

```yaml
http:
  use_x_forwarded_for: true
  trusted_proxies:
    - 172.30.33.0/24
```

**如果您使用的是HA的非标准托管方法（例如Proxmox），您可能需要在此处添加另一个IP（范围）。连接尝试后检查HA日志以找到正确的IP。**

请记得在配置更改时重新启动Home Assistant。

如果您需要帮助更改配置，请遵循[高级配置教程][advancedconfiguration]。

## 插件 Wiki

有关更多高级[操作指南][how-tos]和[故障排除部分][troubleshooting]，请访问[GitHub上的插件Wiki][addon-wiki]。

## 作者与贡献者

本仓库的最初设置由[Tobias Brenner][tobias]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权（c）2025 Tobias Brenner

此处授予任何获得本软件及相关文档文件（“软件”）副本的人免费地使用该软件的权利，包括不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件副本，以及允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或重要部分的Software中。

本软件按“原样”提供，没有任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵犯的保证。在任何情况下，作者或版权持有人都不对因使用本软件或其他交易而导致的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权或其他责任行为。

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