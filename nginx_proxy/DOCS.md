# Home Assistant 插件：NGINX Home Assistant SSL 代理

## 安装

按照以下步骤在系统上安装插件：

1. 在你的 Home Assistant 前端导航至 **设置** -> **插件** -> **插件商店**。
2. 找到 "NGINX Home Assistant SSL 代理" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

NGINX 代理插件通常与 [Duck DNS](https://github.com/home-assistant/addons/tree/master/duckdns) 和/或 [Let's Encrypt](https://github.com/home-assistant/addons/tree/master/letsencrypt) 插件结合使用，以设置对你的 Home Assistant 实例的安全远程访问。以下说明涵盖了这一场景。

1. 你的注册域名的证书应通过 [Duck DNS](https://github.com/home-assistant/addons/tree/master/duckdns)、[Let's Encrypt](https://github.com/home-assistant/addons/tree/master/letsencrypt) 或其他方法创建。确保 `/ssl` 目录中存在证书文件。
2. 你必须在 [Home Assistant configuration.yaml](https://www.home-assistant.io/docs/configuration/) 中添加以下部分。如果 `http` 部分使用了 `ssl_certificate`、`ssl_key` 或 `server_port` 键，请确保将它们删除。

   ```yaml
   http:
     use_x_forwarded_for: true
     trusted_proxies:
       - 172.30.33.0/24
   ```
3. 在 nginx 插件配置中，将 `domain` 选项更改为你注册的域名（来自 DuckDNS 或其他你控制的域名）。
4. 保持其他所有选项不变。
5. 保存配置。
6. 启动插件。
7. 耐心等几分钟。
8. 检查插件日志输出以查看结果。

## 配置

插件配置：

```yaml
domain: home.example.com
certfile: fullchain.pem
keyfile: privkey.pem
hsts: "max-age=31536000; includeSubDomains"
customize:
  active: false
  default: "nginx_proxy_default*.conf"
  servers: "nginx_proxy/*.conf"
cloudflare: false
real_ip_from: []
```

### 选项：`domain`（必需）

用于代理的服务器的完全限定域名。

### 选项：`certfile`（必需）

在 `/ssl` 目录中使用的证书文件。如果你使用默认设置通过 [Duck DNS](https://github.com/home-assistant/addons/tree/master/duckdns) 插件创建证书，请保持文件名不变。

### 选项：`keyfile`（必需）

在 `/ssl` 目录中使用的私钥文件。

### 选项：`hsts`（必需）

要发送的 [`Strict-Transport-Security`][hsts] HTTP 头的值。如果为空，则不会发送该头。

### 选项 `customize.active`（必需）

如果为真，默认服务器和其他服务器的额外 NGINX 配置文件将从 `/share` 目录中的 `default` 和 `servers` 变量指定的文件中读取。

### 选项 `customize.default`（必需）

默认服务器的 NGINX 配置的文件名，位于 `/share` 目录中。

### 选项 `customize.servers`（必需）

额外服务器的 NGINX 配置的文件名，位于 `/share` 目录中。

### 选项 `cloudflare`（可选）

如果启用，使用来自 Cloudflare 的 IP 地址列表配置 Nginx，这些地址将用于 `set_real_ip_from` 指令 Nginx 配置。这是为了使 `/config/customize.yaml` 中的 `ip_ban_enabled` 功能可以正常使用。

### 选项 `real_ip_from`（可选）

如果指定，配置 Nginx 使用代理协议从上游负载均衡器获取真实 IP； [更多信息](https://docs.nginx.com/nginx/admin-guide/load-balancer/using-proxy-protocol/)。

## 已知问题和限制

- 默认情况下，插件配置中禁用了 80 端口，以防该端口需要用于其他组件或插件，如 `emulated_hue`。

## 排查问题

- 通过此代理的请求返回 `400 Bad Request` 响应意味着你可能缺少 `trusted_proxies` 配置选项，请参见上文。

## 支持

有问题？

你可以通过几种方式获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。

如果你发现了一个错误，请 [在我们的 GitHub 上提 issue][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[hsts]: https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Strict-Transport-Security
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[repository]: https://github.com/hassio-addons/repository