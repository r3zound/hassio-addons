# Web UI

要访问 mitmproxy 的 web ui，请访问 `http://<host-ip>:8081`（或您配置的端口）。
目前没有其他方法。当 [#3234](https://github.com/mitmproxy/mitmproxy/issues/3234) 完全修复时将会有所更改。

# 配置

mitmproxy 的配置可以通过附加配置中的键值对来完成。
只需在 `options` 数组中添加一个新对。_请将所有设置作为字符串添加！_

示例：

```yaml
options:
  - name: "anticache"
    value: "true"
  - name: "certs"
    value: "/ssl/mycert.pem"
```

所有可能设置的列表可以在 [这里](https://docs.mitmproxy.org/stable/concepts-options/#available-options) 找到。
如果您需要写入文件，`/share` 文件夹已映射到附加功能中。

## 证书

要访问 Home Assistant 的证书，`/ssl` 文件夹以只读方式映射。
请注意，mitmproxy 请求证书作为 pem 文件。

### 自己的 CA 证书

如果您希望自己的 CA 签署流量，可以使用 `custom_ca` 选项。
有关 CA 证书要求的更多信息，请参见 [这里](https://docs.mitmproxy.org/stable/concepts-certificates/#ca-and-cert-files)。

示例：

```yaml
options:
  - name: "anticache"
    value: "true"
custom_ca: /ssl/ca-cert.pem
```

## 固定设置

还有一些设置是固定不变的。它们是：

* `web_host`
* `web_port`
* `listen_port`
* `confdir`
* `onboarding_host`
* `onboarding_port`

# 入门

要将 mitmproxy CA 安装为受信任的证书颁发机构，可以在 `http://<host>:8082` 上访问入门页面。
请注意，您的流量必须通过 mitmproxy 路由才能访问该页面。