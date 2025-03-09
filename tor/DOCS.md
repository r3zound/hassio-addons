# Home Assistant 社区插件: Tor

此 Tor 插件允许您以 Onion 站点的形式访问您的 Home Assistant 实例，使用 [Tor 的隐藏服务](https://www.torproject.org/docs/hidden-services.html.en) 特性。启用此功能后，您无需打开防火墙端口或设置 HTTPS 即可启用安全的远程访问。

这在您想要实现以下用途时非常有用：

- 远程访问您的 Home Assistant 实例，而无需打开防火墙端口或设置 VPN。
- 不想或不知道如何获取 SSL/TLS 证书和 HTTPS 配置。
- 希望阻止攻击者访问/扫描您的端口和服务器。
- 希望阻止任何人知道您的家庭 IP 地址并查看您与 Home Assistant 的流量。

此插件还提供将 SOCKS 代理开放到 Tor 网络的功能。允许您通过 Home Assistant 安装访问 Tor。

## 安装

此插件的安装非常简单，与安装其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 按钮以在您的 Home Assistant 实例中打开插件。

   [![在您的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击“安装”按钮以安装插件。
3. 启动 “Tor” 插件。
4. 检查 “Tor” 插件的日志以查看是否一切正常。日志中还会显示您的 Tor .onion 地址。

## 配置

**注意**: _当配置发生更改时，请记得重新启动插件。_

示例插件配置：

```yaml
log_level: info
socks: true
http_tunnel: false
hidden_services: true
stealth: true
client_names:
  - haremote1
  - haremote2
ports:
  - 8123
bridges: []
```

**注意**: _这只是一个示例，请不要复制粘贴！创建您自己的配置！_

### 选项: `log_level`

`log_level` 选项控制插件生成的日志输出级别，可以更改为更详细或更简洁的输出，这在处理未知问题时可能很有用。可能的值包括：

- `trace`: 显示每一个细节，例如所有调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常是）有趣的事件。
- `warning`: 异常事件，但不是错误。
- `error`: 运行时错误，不需要立即处理。
- `fatal`: 发生了严重错误，插件变得不可用。

请注意，每个级别自动包括更高级别的日志消息，例如 `debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非您正在进行故障排除。

这些日志级别也会影响 Tor 程序的日志级别。

### 选项: `socks`

将此选项设置为 `true` 将打开端口 `9050`，以监听来自 SOCKS 协议应用程序的连接。启用此功能后，您可以在网络上的其他应用程序中使用 Tor 网络。

**注意**: _SOCKS 协议是未加密的（因为我们使用它时）未经身份验证的，因此以这种方式公开可能会泄露您的信息给任何监视您网络的人，并允许任何人将您的计算机用作开放代理。_

### 选项: `http_tunnel`

将此选项设置为 `true` 将打开端口 `9080`，以监听来自 HTTP 协议应用程序的连接。启用此功能后，您可以通过 HTTP 代理使用网络上的其他应用程序访问 Tor 网络。

### 选项: `hidden_services`

`hidden_services` 选项允许您在此插件中启用 [Tor 的隐藏服务](https://www.torproject.org/docs/hidden-services.html.en) 功能。您可以提供一个 Web 服务器、SSH 服务器等，而无需向用户透露您的 IP 地址。实际上，由于您未使用任何公共地址，您可以在防火墙后面运行隐藏服务。

### 选项: `stealth`

上面的“stealth”选项确保通过 Tor 访问您 Home Assistant 实例的流量对 Tor 网络中的其他节点也是隐藏的。

使用传统的隐藏服务，隐藏服务器在 Tor 网络中发布如何开始与之通信的信息（而不是其真实位置）。Tor 使用复杂的中间节点链接设置进行双向路由匿名化；服务器和客户端对端点的位置一无所知。客户端向网络询问如何以此信息访问隐藏服务。

此选项将 Tor 隐藏服务置于授权客户端模式。隐藏服务器发布加密的指令，说明如何开始通信，具有正确密钥的客户端可以解密此信息。如果您是授权客户端，您只能找到隐藏服务路径，如果获得此密钥，可以尝试建立连接。

启用 `stealth` 可以防止 DDOS，因为如果客户端没有密钥，就无法找到到服务器的路径。然而，这也要求客户端的配置。

### 选项: `client_names`

当您启用 `stealth` 选项时，此选项是必需的。

只有在此列出的客户端才被授权访问隐藏服务。有效的客户端名称长度为 1 到 16 个字符，只能使用字符 `A-Za-z0-9+-_`（不能包含空格）。如果设置了此选项，未授权的客户端将无法访问隐藏服务。

客户端需要在其配置文件中使用 HidServAuth 放置此授权数据。

### 选项: `ports`

配置要通过 Tor 隐藏服务发布的主机和端口。您可以列出多个主机和端口进行发布。

例如：

```yaml
ports:
  - "homeassistant:8123:80"
  - 22
```

此配置的接受语法为：

- hostname:local_port:published_port `"homeassistant:8123:8080"`
- local_ip:local_port:published_port `"192.168.1.60:8123:8080"`
- hostname:local_port `"homeassistant:8123"`
- local_port:published_port `"8123:8080"`
- local_port `"8123"`

如果您未定义发布端口，将使用本地端口。如果未定义主机名或 IP 地址，将使用 `homeassistant`。

### 选项: `bridges`

> 确保选项值明确，以避免意外使用传输插件和桥接。

桥接是 Tor 中继，帮助您绕过审查。桥接的访问由受支持的传输插件提供：

#### OBFS

由于桥接地址不公开，您需要自行请求它们。您有几个选项：

- 访问 [Tor](https://bridges.torproject.org/bridges/?transport=obfs4) 项目并按指示操作，或者
- 从 Gmail 或 Riseup 电子邮件地址发送电子邮件至 `bridges@torproject.org`
- 在 Telegram 上向 @GetBridgesBot 发送消息。点击“开始”，或在聊天中输入 /start 或 /bridges。

例如：

```yaml
bridges:
  - >-
    obfs4 123.45.67.89:443 EFC6A00EE6272355C023862378AC77F935F091E4
    cert=KkdWiWlfetJG9SFrzX8g1teBbgxtsc0zPiN5VLxqNNH+iudVW48CoH/XVXPQntbivXIqZA
    iat-mode=0
```

#### Webtunnel

访问 [Tor](https://bridges.torproject.org/bridges/?transport=webtunnel) 项目并按指示操作。

例如：

```yaml
bridges:
  - >-
    webtunnel 192.0.2.3:1
    DEADBEEFDEADBEEFDEADBEEFDEADBEEFDEADBEEF
    url=https://akbwadp9lc5fyyz0cj4d76z643pxgbfh6oyc-167-71-71-157.sslip.io/5m9yq0j4ghkz0fz7qmuw58cvbjon0ebnrsp0
    ver=0.0.1
```

#### Snowflake

什么是 [snowflake](https://support.torproject.org/censorship/what-is-snowflake/)，示例：

```yaml
bridges:
  - >-
    snowflake 192.0.2.3:80 2B280B23E1107BB62ABFC40DDCC8824814F80A72
    fingerprint=2B280B23E1107BB62ABFC40DDCC8824814F80A72
    url=https://snowflake-broker.torproject.net/
    ampcache=https://cdn.ampproject.org/
    front=www.google.com
    ice=stun:stun.l.google.com:19302,stun:stun.antisip.com:3478,stun:stun.bluesip.net:3478,stun:stun.dus.net:3478,stun:stun.epygi.com:3478,stun:stun.sonetel.com:3478,stun:stun.uls.co.za:3478,stun:stun.voipgate.com:3478,stun:stun.voys.nl:3478
    utls-imitate=hellorandomizedalpn
```

## Tor 客户端访问设置

使用此插件，您可以通过笔记本电脑或移动设备使用 Tor 浏览器和其他软件在 Tor 上访问您的 Home Assistant 实例。

但是，启用 `stealth` 选项后，客户端需要额外的配置才能连接。

将认证 Cookie 添加到您的笔记本电脑或移动设备上的 `torrc` 客户端配置。它看起来像这样：

```bash
HidServAuth abcdef1234567890.onion adEG02FAsdq/GAFeNSeLvc haremote1
```

对于 Windows、Mac 或 Linux 上的 Tor 浏览器，您可以在这里找到 torrc 文件：
`<tor 浏览器安装目录>/Browser/TorBrowser/tor/ssl/torrc`

添加条目后，重启浏览器，然后浏览到“dot onion”站点地址以连接到您的 Home Assistant 实例。

对于 [Orbot: Tor on Android](https://guardianproject.info/apps/orbot)，在 **Orbot** -> **菜单** -> **设置** 中添加到“Torrc 自定义配置”条目。重启 Orbot，然后使用 [Orfox 浏览器应用](https://guardianproject.info/apps/orfox)，并浏览到“dot onion”网站名称以访问您的 Home Assistant 实例。您还可以使用 Orbot 的 VPN 模式，从您设备上的任何应用程序启用 Tor 访问，例如 Tasker 或 Owntracks。

据我们所知，目前没有支持隐形功能的 iOS 应用程序。

您可以使用标准的 FireFox 浏览器访问 .onion 域，但需要在 FireFox 设置中启用此功能。在 FireFox 中，在地址栏输入 "about:config"，然后点击“我接受风险”以打开高级设置。搜索 "onion" 找到设置 "network.dns.blockDotOnion"，并切换设置以将其设置为 "false"。现在您应该能够访问 .onion 站点。

## 更新记录 & 发布

此存储库使用 [GitHub 的发布](https://github.com/hassio-addons/addon-tor/releases) 功能来保持变更日志。

发布基于 [语义版本控制](http://semver.org/spec/v2.0.0.htm)，使用格式 `MAJOR.MINOR.PATCH`。简而言之，版本将根据以下内容进行递增：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和增强。
- `PATCH`：向后兼容的 bug 修复和包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant 社区插件 Discord 聊天服务器](https://discord.me/hassioaddons) 以获得插件支持和功能请求。
- [Home Assistant Discord 聊天服务器](https://discord.gg/c5DvZ4e) 以进行一般的 Home Assistant 讨论和问题。
- Home Assistant [社区论坛](https://community.home-assistant.io/t/home-assistant-community-add-on-tor/33822?u=frenck)。
- 加入 [Reddit 板块](https://reddit.com/r/homeassistant) 在 [/r/homeassistant](https://reddit.com/r/homeassistant)。

您还可以 [在这里提出问题](https://github.com/hassio-addons/addon-tor/issues) 在 GitHub 上。

## 作者 & 贡献者

此存储库的最初设置由 [Franck Nijhof](https://github.com/frenck) 所做。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面](https://github.com/hassio-addons/addon-tor/graphs/contributors)。

## 许可证

MIT 许可证

版权 (c) 2017-2025 Franck Nijhof

特此授予任何获得本软件及相关文档文件（“软件”）副本的人，免费、不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本，并允许向其提供软件的人这样做，但需遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

该软件按“原样”提供，不作任何种类的保证，明确或隐含，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权或其他原因。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_tor&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-tor/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-tor/33822?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-tor/issues
[orbot]: https://guardianproject.info/apps/orbot
[orfox]: https://guardianproject.info/apps/orfox
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-tor/releases
[semver]: http://semver.org/spec/v2.0.0.htm
[tor-hidden-service]: https://www.torproject.org/docs/hidden-services.html.en
[tor-bridges-obfs4]: https://bridges.torproject.org/bridges/?transport=obfs4
[tor-bridges-webtunnel]: https://bridges.torproject.org/bridges/?transport=webtunnel
[what-is-snowflake]: https://support.torproject.org/censorship/what-is-snowflake/