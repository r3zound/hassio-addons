# 非官方 Home Assistant 插件：Traefik

Traefik 被打包为一个 Home Assistant 插件。

## 安装

按照以下步骤在您的系统上安装此插件：

1. 在您的 Home Assistant 前端导航到 **Supervisor -> Add-on Store**
1. 通过 URL 添加这个新的仓库 (`https://github.com/bluemaex/home-assistant-addons`)
1. 查找 "Traefik" 插件并点击它。
1. 点击 "INSTALL" 按钮

## 如何使用

在配置部分，您需要设置所需的配置路径。这可以是您 Home Assistant 配置或 Hass.io 共享目录中的一个目录，因为两者都是以只读方式挂载在此插件上的。

您在其中放置的任何 Traefik 端点配置都将被此插件自动读取。更新也将由 Traefik 自动处理。

您还可以在配置中启用 Let's Encrypt 支持，并在需要时设置附加环境变量。

此插件提供两个 Traefik 入口点。`web` 在 80 端口，`web-secure` 在 443 端口。

### 示例动态 Traefik 配置

```yaml
http:
  routers:
    redirectToHttpsRouter:
      entryPoints: ["web"]
      middlewares: ["httpsRedirect"]
      rule: "HostRegexp(`{host:.+}`)"
      service: noopService

    homeAssistantRouter:
      rule: "Host(`localhost`)"
      entryPoints: ["web-secure"]
      tls:
        certResolver: le
      service: homeAssistantService

    metricsRouter:
      rule: "Host(`localhost`) && PathPrefix(`/traefik-metrics`)"
      entryPoints: ["web-secure"]
      tls:
        certResolver: le
      service: prometheus@internal

  middlewares:
    httpsRedirect:
      redirectScheme:
        scheme: https

  services:
    noopService:
      loadBalancer:
        servers:
          - url: "http://localhost"

    homeAssistantService:
      loadBalancer:
        servers:
          - url: "http://homeassistant:8123"
```

## 配置

完整的插件示例配置，适用于使用 Cloudflare DNS 代理的 Let's Encrypt 及您 Home Assistant 配置目录中的动态配置：

```yaml
log_level: INFO
access_logs: false
forwarded_headers_insecure: true
dynamic_configuration_path: /config/traefik
letsencrypt:
  enabled: true
  email: example@home-assistant.io
  challenge_type: dnsChallenge
  provider: cloudflare
  delayBeforeCheck: 10
  resolvers:
    - "1.1.1.1:53"
pilot_token: "我的超级秘密 Pilot Token"
env_vars:
  - CF_DNS_API_TOKEN=您的_API_TOKEN
  - ANOTHER_ENV_VARIABLE=某个值
```

### 选项 `log_level`（必需）

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简单的日志，这在处理未知问题时可能会很有用。可能的值为：

- `trace`：显示每个细节，例如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：不算错误的异常情况。
- `error`：不需要立即采取措施的运行时错误。
- `fatal`：发生了严重错误，插件变得不可用。

请注意，每个级别自动包含来自更高严重性级别的日志消息，例如，`debug` 也会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

### 选项 `access_logs`（必需）

是否启用访问日志输出到标准输出。这些日志将显示在 Hass.io 插件面板中。

### 选项 `forwarded_headers_insecure`（必需）

启用不安全的转发头。当启用此选项时，转发头（`X-Forwarded-*`）将不被 Traefik 头替换。仅在您信任转发代理时启用此选项。

> **\_注意** 为了使 Cloudflare 的 `X-Forwarded-*` 代理头正常工作，必须启用此选项。\_

### 选项 `dynamic_configuration_path`（必需）

动态端点配置的目录路径。请参见上面的示例。

### 选项 `letsencrypt.enabled`（必需）

是否启用 Let's Encrypt。当启用此选项时，`le` 证书解析器将被激活供您使用。您还必须设置 Let's Encrypt 的电子邮件和挑战类型。否则，Traefik 将无法启动。

### 选项 `letsencrypt.email`

您想要用于 Let's Encrypt 的个人电子邮件。

> _**注意** 当启用 Let's Encrypt 时，这是必需的。_

### 选项 `letsencrypt.challenge_type`

您想要用于 Let's Encrypt 的挑战类型。有效选项为：

- `tlsChallenge`
- `httpChallenge`
- `dnsChallenge`

有关挑战类型及选择哪种类型的更多信息，请参见 Traefik 文档中关于此主题的 [ACME 部分](https://docs.traefik.io/https/acme/)。

### 选项 `letsencrypt.provider`

在使用 `dnsChallenge` 时，您还需要设置要使用的提供商。提供商列表可以在 Traefik 文档的 [Let's Encrypt 提供者部分](https://docs.traefik.io/https/acme/#providers) 中找到。

### 选项 `letsencrypt.delayBeforeCheck`

默认情况下，提供商将在允许 ACME 验证之前验证 TXT DNS 挑战记录。如果 `delayBeforeCheck` 设置且大于零，则此检查将在配置的秒数内延迟。

此设置在内部网络阻止外部 DNS 查询的情况下非常有用。有关更多信息，请查看关于此主题的 [Traefik 文档](https://docs.traefik.io/https/acme/#dnschallenge)。

### 选项 `letsencrypt.resolvers`

手动设置执行验证步骤时使用的 DNS 服务器。对内部分辨率与公共互联网的地址不相同的情况（例如，在使用 FQDN 作为主机名的 LAN 中）非常有用。

有关更多信息，请参见 Traefik 文档中关于此主题的 [resolvers 部分](https://docs.traefik.io/https/acme/#resolvers)。

### 选项 `pilot_token`

手动设置 Traefik pilot token，以将实例连接到您的 pilot 账户进行监控。

有关更多信息，请访问 [Traefik pilot 网站](https://https://pilot.traefik.io/)。

### 选项 `metrics`

您可以启用 Traefik 的 prometheus 指标服务。如果启用此项，您需要在配置文件中添加相应的路由器。

有关更多信息，请访问 [Traefik Prometheus 文档](https://doc.traefik.io/traefik/observability/metrics/prometheus/)。

```yaml
metricsRouter:
  rule: "Host(`hass.io`) && PathPrefix(`/metrics`)"
  entryPoints: ["web-secure"]
  tls:
    certResolver: le
  service: prometheus@internal
```

### 选项 `env_vars`

可选的环境变量，可以添加。这些附加配置值可以在 Let's Encrypt DNS 挑战提供商中是必要的。请参见上面的示例配置以获得具体示例。

## 入口点

此映像暴露两个用于 HTTP(S) 访问的端口。这些在 Traefik 中也被配置为入口点。您可以在动态配置中使用这些端口。

### 入口点 `web`，端口 `80`

端口 80 用于 HTTP 访问。

当使用受支持的 Let's Encrypt 提供商（例如 Cloudflare）与 DNS 挑战时，您还可以将此端口映射到另一个随机端口，并让 Cloudflare 执行 HTTP 到 HTTPS 的转发。

### 入口点 `web-secure`，端口 `443`

端口 443 用于 HTTPS 访问。