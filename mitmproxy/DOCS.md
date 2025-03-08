# Web UI

要访问 mitmproxy 的 Web UI，访问 `http://<host-ip>:8081`（或您配置的端口）。  
目前没有其他方法。当 [#3234](https://github.com/mitmproxy/mitmproxy/issues/3234) 完全修复时将会改变。

# Configuration

mitmproxy 的配置可以通过附加配置中的键值对进行。  
只需将一个新的对添加到 `options` 数组中。 _请将所有设置添加为字符串！_

示例：

```yaml
options:
  - name: "anticache"
    value: "true"
  - name: "certs"
    value: "/ssl/mycert.pem"
```

所有可能设置的列表可以在 [这里](https://docs.mitmproxy.org/stable/concepts-options/#available-options) 找到。  
如果您需要写入文件，`/share` 文件夹已被映射到附加中。

## Certificates

要访问 Home Assistant 的证书，`/ssl` 文件夹已以只读方式映射。  
请注意，mitmproxy 以 pem 文件的形式请求证书。

### Own ca certificate

如果您希望自己的 CA 签名流量，可以使用 `custom_ca` 选项。  
有关 CA 证书要求的更多信息，请参阅 [这里](https://docs.mitmproxy.org/stable/concepts-certificates/#ca-and-cert-files)

示例：

```yaml
options:
  - name: "anticache"
    value: "true"
custom_ca: /ssl/ca-cert.pem
```

## Fixed Settings

还有一些设置是固定的，不能更改其值。这些是：

* `web_host`
* `web_port`
* `listen_port`
* `confdir`
* `onboarding_host`
* `onboarding_port`

# Onboarding

要将 mitmproxy CA 安装为受信任的证书授权，请访问 `http://<host>:8082` 的入门页面。  
请注意，您的流量必须通过 mitmproxy 进行路由才能访问该页面。