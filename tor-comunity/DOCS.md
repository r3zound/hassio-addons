# Home Assistant 社区插件: Tor

这个 Tor 插件允许你通过 [Tor 的隐私服务][tor-hidden-service] 功能将你的 Home Assistant 实例作为一个 Onion 网站进行访问。在启用此功能后，你无需打开防火墙端口或设置 HTTPS 即可实现安全的远程访问。

这在以下情况下非常有用：

- 远程访问你的 Home Assistant 实例，而无需打开防火墙端口或设置 VPN。
- 不想或不知道如何获取 SSL/TLS 证书和 HTTPS 配置。
- 希望阻止攻击者访问/扫描你的端口和服务器。
- 希望防止任何人知道你的家庭 IP 地址以及查看你与 Home Assistant 之间的流量。

该插件还提供了通过 Tor 网络开放 SOCKS 代理的可能性，允许你通过 Home Assistant 安装从任何支持 SOCKS 的应用程序访问 Tor。

## 安装

这个插件的安装非常简单，与安装任何其他 Home Assistant 插件没有区别。

1. 点击下面的 Home Assistant 按钮以打开你 Home Assistant 实例中的插件。

   [![在你的 Home Assistant 实例中打开此插件。][addon-badge]][addon]

2. 点击 "安装" 按钮以安装插件。
3. 启动 "Tor" 插件。
4. 检查 "Tor" 插件的日志以查看一切是否顺利。日志还会显示你的 Tor .onion 地址。

## 配置

**注意**: _记得在更改配置后重启插件。_

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

**注意**: _这只是一个示例，不要直接复制粘贴！创建你自己的！_

### 选项: `log_level`

`log_level` 选项控制插件的日志输出级别，可以更改为更详细或更简洁，在处理未知问题时可能会很有用。可能的值包括：

- `trace`: 显示每个细节，例如所有被调用的内部函数。
- `debug`: 显示详细的调试信息。
- `info`: 正常（通常）感兴趣的事件。
- `warning`: 不是错误的特殊事件。
- `error`: 不需要立即处理的运行时错误。
- `fatal`: 出现严重错误。插件无法使用。

请注意，每个级别自动包含更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 设置为 `info`，这是推荐的设置，除非你正在进行故障排除。

这些日志级别也会影响 Tor 程序的日志级别。

### 选项: `socks`

将此选项设置为 `true` 会打开 `9050` 端口，以监听来自 SOCKS 应用程序的连接。启用此功能允许你在网络中的其他应用程序上使用 Tor 网络。

**注意**: _SOCKS 协议是未加密的，并且（如我们所用）未经认证，因此以这种方式公开可能会泄露你网络中的信息，并允许任何人将你的计算机用作开放代理。_

### 选项: `http_tunnel`

将此选项设置为 `true` 会打开 `9080` 端口，以监听来自 HTTP 应用程序的连接。启用此功能允许你在网络中的其他应用程序通过 HTTP 代理访问 Tor 网络。

### 选项: `hidden_services`

`hidden_services` 选项允许你在此插件中启用 [Tor 的隐私服务][tor-hidden-service] 功能。你可以提供一个 Web 服务器、SSH 服务器等，而不需要向用户揭示你的 IP 地址。实际上，由于你不使用任何公共地址，你可以在防火墙后面运行隐私服务。

### 选项: `stealth`

上面的 “stealth” 选项确保通过 Tor 进行到您的 Home Assistant 实例的流量即使对 Tor 网络中的其他节点也是隐藏的。

使用传统的隐私服务，隐私服务器在 Tor 网络中发布如何开始与它通信的方式（而不是它的真实位置）。Tor 使用复杂的中间节点连接设置进行双向路由匿名化；服务器和客户端对端点的位置一无所知。客户端询问网络如何使用这些信息到达隐私服务。

此选项将 Tor 隐私服务置于授权客户端模式。隐私服务器发布如何开始通信的加密指令，具有正确密钥的客户端可以解密此信息。如果你是授权的客户端，你只能找到隐私服务路径，然后如果你拥有此密钥，可以尝试建立连接。

启用 `stealth` 可以防止 DDoS 攻击，因为如果客户端没有密钥，它就无法找到到服务器的路径。然而，这也要求客户端配置。

### 选项: `client_names`

一旦启用 `stealth` 选项，此选项是必需的。

只有这里列出的客户端被授权访问隐私服务。有效的客户端名称长度为 1 到 16 个字符，并且仅使用 `A-Za-z0-9+-_` 中的字符（没有空格）。如果设置了此选项，则没有授权的客户端将无法访问隐私服务。

客户端需要在其配置文件中使用 HidServAuth 输入此授权数据。

### 选项: `ports`

配置通过 Tor 隐私服务发布的主机和端口。你可以列出多个主机和端口进行发布。

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

如果未定义发布的端口，则将使用本地端口。
如果未定义主机名或 IP 地址，将使用 `homeassistant`。

### 选项: `bridges`

> 确保选项值清晰，以避免意外使用传输插件和桥接。

桥接是 Tor 中继，帮助你规避审查。
通过支持的传输插件提供对桥接的访问：

#### OBFS

由于桥接地址不是公开的，你需要自行请求它们。你有几个选择：

- 访问 [Tor][tor-bridges-obfs4] 项目并遵循说明，或
- 从 Gmail 或 Riseup 邮箱地址发送邮件至 `bridges@torproject.org`
- 发送消息至 Telegram 上的 @GetBridgesBot。点击 'Start' 或在聊天中输入 /start 或 /bridges。

例如：

```yaml
bridges:
  - >-
    obfs4 123.45.67.89:443 EFC6A00EE6272355C023862378AC77F935F091E4
    cert=KkdWiWlfetJG9SFrzX8g1teBbgxtsc0zPiN5VLxqNNH+iudVW48CoH/XVXPQntbivXIqZA
    iat-mode=0
```

#### Webtunnel

访问 [Tor][tor-bridges-webtunnel] 项目并遵循说明。

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

什么是 [snowflake][what-is-snowflake]，示例：

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

使用此插件，您可以从笔记本电脑或移动设备通过 Tor 访问您的 Home Assistant 实例，使用 Tor Browser 和其他软件。

然而，启用 `stealth` 选项后，客户端需要额外配置才能连接。

在你的笔记本电脑或移动设备上的 `torrc` 客户端配置中添加身份验证 cookie。它看起来像这样：

```bash
HidServAuth abcdef1234567890.onion adEG02FAsdq/GAFeNSeLvc haremote1
```

对于 Windows、Mac 或 Linux 上的 Tor 浏览器，你可以在这里找到 torrc 文件：
`<tor browser install directory>/Browser/TorBrowser/tor/ssl/torrc`

添加条目后，重启浏览器，然后浏览到 "dot onion" 网站地址以连接到你的 Home Assistant 实例。

对于 [Orbot: Android 上的 Tor][orbot]，在 **Orbot** -> **菜单**
-> **设置** 中将其添加到 "Torrc 自定义配置" 条目。重启 Orbot，然后使用 [Orfox 浏览器应用][orfox]，并浏览到 "dot onion" 网站名称以访问你的 Home Assistant 实例。你也可以使用 Orbot 的 VPN 模式，
允许来自你设备上的任何应用程序的 Tor 访问，
例如 Tasker 或 Owntracks。

据我们所知，目前没有 iOS 应用程序支持 stealth 功能。

你可以使用标准的 FireFox 浏览器访问 .onion 域，但需要在 FireFix 设置中启用此功能。在 FireFox 中，在地址栏输入 "about:config" 然后点击 '我接受风险' 以打开高级设置。
搜索 "onion" 找到设置 "network.dns.blockDotOnion" 并切换该设置，使其设置为 "false"。现在你应该能够访问 .onion 网站。

## 更新日志 & 发布

此存储库使用 [GitHub 的发布][releases] 功能来保持变更日志。

发布基于 [语义版本控制][semver]，并使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将基于以下内容进行增量：

- `MAJOR`: 不兼容或重大更改。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和包更新。

## 支持

有问题？

你有几种方式可以得到解答：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 以获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 以获取有关 Home Assistant 的一般讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

你也可以在这里 [打开一个问题][issue] GitHub。

## 作者 & 贡献者

本存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2017-2025 Franck Nijhof

特此免费授予任何获得此软件及其相关文档文件（以下简称“软件”）副本的人，允许在不受限制的情况下使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许向其提供软件的人员这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有副本或实质性部分的该软件中。

该软件是按 "原样" 提供的，不附有任何形式的担保，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

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