# Home Assistant 插件：DuckDNS

## 安装

按照以下步骤在您的系统上安装插件：

1. 在 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "DuckDNS" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

1. 访问 [DuckDNS.org](https://www.duckdns.org/) 并通过任何可用的帐户服务（Google、Github、Twitter、Persona、Reddit）登录以创建一个帐户。
2. 在 `域` 部分，输入您希望注册的子域名称并点击 `添加域`。
3. 如果注册成功，子域将列在 `域` 部分，并且 `当前 IP` 将显示您当前用于访问 `duckdns.org` 的设备的公共 IP 地址。该 IP 地址将由 DuckDNS 插件更新。
4. 在 DuckDNS 插件配置中，执行以下操作：
    - 从 `duckdns.org` 复制 DuckDNS 令牌（在帐户详细信息页面的顶部列出）并粘贴到 `令牌` 选项中。
    - 用您注册的完整域名更新 `域` 选项。例如，`my-domain.duckdns.org`。

## 配置

插件配置：

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

此外，您还需要配置 Home Assistant 核心以获取 SSL 证书。这可以通过在您的 `configuration.yaml` 中为 [HTTP][HTTP] 集成配置设置以下配置来完成：

```yaml
http:
  ssl_certificate: /ssl/fullchain.pem
  ssl_key: /ssl/privkey.pem
```

### 选项组 `lets_encrypt`

以下选项是选项组：`lets_encrypt` 的内容。这些设置仅适用于 Let's Encrypt SSL 证书。

#### 选项 `lets_encrypt.accept_terms`

一旦您阅读并接受了 Let's Encrypt [用户协议](https://letsencrypt.org/repository/)，请将值更改为 `true` 以使用 Let's Encrypt 服务。

#### 选项 `lets_encrypt.certfile`

由 Let's Encrypt 生成的证书文件的名称。该文件用于 Home Assistant 插件的 SSL，并建议保持文件名不变（`fullchain.pem`）以保证兼容性。

**注意**：_该文件存储在 `/ssl/`，这是 Home Assistant 的默认位置_

#### 选项 `lets_encrypt.keyfile`

由 Let's Encrypt 生成的私钥文件的名称。该私钥文件用于 Home Assistant 插件的 SSL，并建议保持文件名不变（`privkey.pem`）以保证兼容性。

**注意**：_该文件存储在 `/ssl/`，这是 Home Assistant 的默认位置_

#### 选项 `lets_encrypt.algo`

将要使用的公钥算法。

支持的值：`rsa`、`prime256v1` 和 `secp384r1`。

默认值为 `secp384r1`。

### 选项：`ipv4`（可选）

默认情况下，Duck DNS 将自动检测您的 IPv4 地址并使用该地址。
此选项允许您覆盖自动检测并手动指定一个 IPv4 地址。

如果您在此处指定了一个 URL，将获取它所指向的资源的内容并用作地址。这使得能够使用类似 https://api.ipify.org/ 或 https://ipv4.text.wtfismyip.com 的服务获取地址。

### 选项：`ipv6`（可选）

默认情况下，Duck DNS 将自动检测您的 IPv6 地址并使用该地址。
此选项允许您覆盖自动检测并手动指定一个 IPv6 地址。

如果您在此处指定了一个 URL，将获取它所指向的资源的内容并用作地址。这使得能够使用类似 https://api6.ipify.org/ 或 https://ipv6.text.wtfismyip.com 的服务获取地址。

### 选项：`token`

在 DuckDNS 帐户登录页面顶部找到的 DuckDNS 认证令牌。该令牌在对注册在您帐户下的子域进行任何更改时是必须的。

### 选项：`domains`

注册在您帐户下的 DuckDNS 子域列表。可接受的命名约定是 `my-domain.duckdns.org`。

### 选项：`aliases`（可选）

在 `domains` 选项中配置的域的别名列表。
在您希望使用自己的域的情况下，这非常有用。
创建一个 CNAME 记录指向 DuckDNS 子域，并相应地设置此值。

例如：

```yaml
domains:
  - my-domain.duckdns.org
aliases:
  - domain: ha.my-domain.com
    alias: my-domain.duckdns.org
```

不要将您的自定义域名添加到 `domains` 数组中。对于证书创建，将使用所有唯一的域和别名。

此外，请确保 dns-01 挑战可以访问 Duckdns。这可能需要添加特定的 CNAME：

```
CNAME _acme-challenge.<own-domain>    _acme-challenge.<domain>.duckdns.org
CNAME                 <own-domain>                    <domain>.duckdns.org
```

### 选项：`seconds`

在更新 DuckDNS 子域和续订 Let's Encrypt 证书之前等待的秒数。

## 已知问题和限制

- 要登录，DuckDNS 要求从以下任何服务获得一个免费的帐户：Google、Github、Twitter 或 Persona。
- 免费的 DuckDNS 帐户限制为五个子域。
- 在撰写本文时，Duck DNS 自身的 IPv6 自动检测
  [实际上是无效的][duckdns-faq]，但您可以使用 `ipv6` 的 URL 选项来解决此问题，继续阅读。

## 支持

有问题吗？

您可以通过多个选项获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了错误，请 [在我们的 GitHub 上打开问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant
[duckdns]: https://www.duckdns.org
[duckdns-faq]: https://www.duckdns.org/faqs.jsp
[HTTP]: https://www.home-assistant.io/integrations/http/