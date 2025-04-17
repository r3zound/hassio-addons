# Home Assistant 附加组件：DuckDNS

## 安装

按照以下步骤在系统上安装附加组件：

1. 在 Home Assistant 前端导航至 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "DuckDNS" 附加组件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

1. 访问 [DuckDNS.org](https://www.duckdns.org/) 并通过任何可用的账户服务（谷歌、GitHub、Twitter、Persona、Reddit）登录创建账户。
2. 在 `域名` 部分，输入您希望注册的子域名，并点击 `添加域名`。
3. 如果注册成功，子域名将显示在 `域名` 部分，同时 `当前 IP` 显示为您当前访问 `duckdns.org` 的设备的公共 IP 地址。IP 地址将由 DuckDNS 附加组件更新。
4. 在 DuckDNS 附加组件的配置中，执行以下操作：
    - 从 `duckdns.org` 复制 DuckDNS 令牌（在显示账户详细信息的页面顶部），并粘贴到 `令牌` 选项中。
    - 用您注册的完整域名更新 `域名` 选项。例如，`my-domain.duckdns.org`。

## 配置

附加组件配置：

```yaml
lets_encrypt:
  accept_terms: true
  certfile: fullchain.pem
  keyfile: privkey.pem
token: sdfj-2131023-dslfjsd-12321
domains:
  - my-domain.duckdns.org
aliases: []
seconds: 300
```

此外，您还需要配置 Home Assistant Core 以识别 SSL 证书。这通过在您的 `configuration.yaml` 中为 [HTTP][HTTP] 集成配置设置以下配置来实现：

```yaml
http:
  ssl_certificate: /ssl/fullchain.pem
  ssl_key: /ssl/privkey.pem
```

### 选项组 `lets_encrypt`

以下选项适用于选项组：`lets_encrypt`。这些设置仅适用于 Let's Encrypt SSL 证书。

#### 选项 `lets_encrypt.accept_terms`

在阅读并接受 Let's Encrypt [订阅协议](https://letsencrypt.org/repository/) 后，将值更改为 `true` 以使用 Let's Encrypt 服务。

#### 选项 `lets_encrypt.certfile`

由 Let's Encrypt 生成的证书文件的名称。该文件用于 Home Assistant 附加组件的 SSL，建议保持文件名不变 (`fullchain.pem`) 以确保兼容性。

**注意**：_该文件存储在 `/ssl/` 中，这是 Home Assistant 的默认设置_

#### 选项 `lets_encrypt.keyfile`

由 Let's Encrypt 生成的私钥文件的名称。私钥文件用于 Home Assistant 附加组件的 SSL，建议保持文件名不变 (`privkey.pem`) 以确保兼容性。

**注意**：_该文件存储在 `/ssl/` 中，这是 Home Assistant 的默认设置_

#### 选项 `lets_encrypt.algo`

将使用的公钥算法。

支持的值：`rsa`、`prime256v1` 和 `secp384r1`。

默认值为 `secp384r1`

### 选项：`ipv4`（可选）

默认情况下，Duck DNS 会自动检测您的 IPv4 地址并使用该地址。
此选项允许您覆盖自动检测并手动指定 IPv4 地址。

如果您在此处指定 URL，它指向的资源的内容将被获取并用作地址。这使得可以使用像 https://api.ipify.org/ 或 https://ipv4.text.wtfismyip.com 的服务获取地址。

### 选项：`ipv6`（可选）

默认情况下，Duck DNS 会自动检测您的 IPv6 地址并使用该地址。
此选项允许您覆盖自动检测并手动指定 IPv6 地址。

如果您在此处指定 URL，它指向的资源的内容将被获取并用作地址。这使得可以使用像 https://api6.ipify.org/ 或 https://ipv6.text.wtfismyip.com 的服务获取地址。

### 选项：`token`

在 DuckDNS 账户登录页面顶部找到的 DuckDNS 身份验证令牌。进行任何对您账户登记的子域名的更改都需要此令牌。

### 选项：`domains`

在您账户下注册的 DuckDNS 子域名列表。可接受的命名规则为 `my-domain.duckdns.org`。

### 选项：`aliases`（可选）

在 `域名` 选项上配置的域名别名列表。
这在您想使用自己的域名时非常有用。
创建一个 CNAME 记录以指向 DuckDNS 子域名，并相应地设置此值。

例如：

```yaml
domains:
  - my-domain.duckdns.org
aliases:
  - domain: ha.my-domain.com
    alias: my-domain.duckdns.org
```

不要将您的自定义域名添加到 `domains` 数组中。在创建证书时，将使用所有唯一的域名和别名。

此外，不要忘记确保 dns-01 挑战能够到达 Duckdns。可能需要为此添加特定的 CNAME：

```
CNAME _acme-challenge.<own-domain>    _acme-challenge.<domain>.duckdns.org
CNAME                 <own-domain>                    <domain>.duckdns.org
```

### 选项：`seconds`

在更新 DuckDNS 子域名和续订 Let's Encrypt 证书之前等待的秒数。

## 已知问题和限制

- 登录时，DuckDNS 需要来自以下任一服务的免费账户：谷歌、GitHub、Twitter 或 Persona。
- 免费的 DuckDNS 账户限制为五个子域名。
- 在撰写本文时，Duck DNS 自己的 IPv6 自动检测
  [实际上不起作用][duckdns-faq]，但您可以使用 `ipv6` 的 URL 选项来解决此问题，继续阅读。

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 论坛][reddit]

如果您发现了错误，请 [在我们的 GitHub 上开启一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[duckdns]: https://www.duckdns.org
[duckdns-faq]: https://www.duckdns.org/faqs.jsp
[HTTP]: https://www.home-assistant.io/integrations/http/