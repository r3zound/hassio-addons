此插件创建一个代理，用于单独运行的 Frigate 服务器，从而使您可以在侧边栏中访问，而无需将 Frigate 作为插件运行。

请注意，此插件本身并不运行 Frigate。

## 配置

### 选项: `server`

`server` 选项设置 Frigate 服务器的地址。

必须采用 `http[s]://host:port` 格式。以下是有效的示例：

- `http://frigate.local:5000`
- `http://192.168.0.101:5000`
- `https://192.168.0.101:443`

### 选项: `proxy_pass_host`

确定我们是否应该将我们运行的主机（例如，`homeassistant.local`）传递给我们所代理的服务器。通常情况下，您可能希望将此设置为 `true`。

如果服务器需要接收 Frigate 实例的主机（而不是 Home Assistant 或此插件运行的主机），请将其设置为 `false`。如果您的 Frigate 实例位于 SSL 代理后面（如 Traefik 或 Caddy），则可能需要接收 Frigate 主机，以便正确路由请求。

### 选项: `proxy_pass_real_ip`

确定我们是否应该将客户端的真实 IP 地址传递给我们所代理的服务器。通常情况下，您可能希望将此设置为 `true`。

如果您需要知道请求来自 HA IP，请将其设置为 `false`。如果您的 Frigate 实例位于仅允许特定 IP 连接的代理后面，则可能是这种情况。

## 必需的依赖项

- 访问正在运行的 Frigate 服务器的网络权限

## 支持

如果您需要支持，请 [提出问题](https://github.com/blakeblackshear/frigate/issues/new/choose)。