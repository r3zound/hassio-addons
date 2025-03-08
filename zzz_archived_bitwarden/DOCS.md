# Home Assistant 社区插件：Bitwarden RS

Bitwarden 是一个开源密码管理器，能够将敏感信息如网站凭证存储在加密的保险库中。

Bitwarden 平台提供了多种客户端应用程序，包括网页界面、桌面应用程序、浏览器扩展和移动应用。

该插件基于轻量级开源的 [Bitwarden RS][bitwarden-rs] 实现，允许您自托管这个出色的密码管理器。

密码被盗是一个严重的问题。您使用的网站和应用程序每天都在遭受攻击。安全漏洞时常发生，您的密码可能会被盗。当您在各处重复使用相同的密码时，黑客就能轻易访问您的电子邮件、银行和其他重要账户。使用密码管理器吧！

## 安装

该插件的安装过程相当简单，与安装任何其他 Home Assistant 插件没有不同。

1. 在 Supervisor 插件商店中搜索 "Bitwarden RS" 插件并进行安装。
1. 启动 "Bitwarden RS" 插件。
1. 检查 "Bitwarden RS" 插件的日志，查看一切是否正常，并获取管理员令牌/密码。
1. 点击 "OPEN WEB UI" 按钮以打开 Bitwarden RS。
1. 在 URL 中添加 `/admin` 以访问管理员面板，例如，`http://hassio.local:7277/admin`。使用第 3 步中获得的管理员令牌登录。
1. 日志中的管理员/令牌仅在保存或更改之前显示。请在管理员面板中点击保存以使用随机生成的密码，或者将其更改为您选择的密码。
1. 确保将您的管理员令牌安全存储。

## 配置

**注意**：_记得在更改配置后重启插件。_

插件配置示例：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
request_size_limit: 10485760
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level` 选项控制插件输出日志的级别，可以更改为更多或更少的详细信息，这在您处理未知问题时可能很有用。可能的值包括：

- `trace`：显示每个细节，例如所有被调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：异常但不是错误的发生。
- `error`：不需要立即处理的运行时错误。
- `fatal`：发生了严重错误。插件变得不可用。

请注意，每个级别自动包含来自更严重级别的日志消息，例如，`debug` 还会显示 `info` 消息。默认情况下，`log_level` 被设置为 `info`，这是建议的设置，除非您正在排查故障。

### 选项：`ssl`

启用/禁用 SSL（HTTPS）。将其设置为 `true` 以启用，`false` 则相反。

**注意**：_SSL 设置仅适用于直接访问，对 Ingress 服务没有影响。_

### 选项：`certfile`

用于 SSL 的证书文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置。_

### 选项：`keyfile`

用于 SSL 的私钥文件。

**注意**：_该文件必须存储在 `/ssl/` 中，这是默认设置。_

### 选项：`request_size_limit`

默认情况下，API 调用限制为 10MB。这对于大多数情况来说应该足够，然而如果您想支持大文件导入，这可能会成为限制。另一方面，您可能希望将请求大小限制设置为更小的值，以防止 API 滥用和可能的 DOS 攻击，尤其是在资源有限的情况下。

要设置限制，可以使用此设置：10MB 为 `10485760`。

## 已知问题和限制

- 由于 Bitwarden Vault 网页界面的技术限制，此插件目前不支持 Ingress。
- 一些网页浏览器，如 Chrome，不允许在不安全的上下文中使用 Web Crypto API。在这种情况下，您可能会遇到错误，例如 `Cannot read property 'importKey'`。要解决此问题，您需要启用 SSL，并使用 HTTPS 访问网页界面。

## 更新记录和版本

该存储库使用 [GitHub 的版本][releases] 功能来维护变更日志。日志的格式基于 [保持变更日志][keepchangelog]。

版本基于 [语义版本控制][semver]，使用 `MAJOR.MINOR.PATCH` 的格式。简而言之，版本将根据以下标准增量更新：

- `MAJOR`：不兼容或重大更改。
- `MINOR`：向后兼容的新功能和改进。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题吗？

您有几种方式可以获取答案：

- [Home Assistant 社区插件 Discord 聊天服务器][discord] 获取插件支持和功能请求。
- [Home Assistant Discord 聊天服务器][discord-ha] 进行一般 Home Assistant 讨论和问题交流。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

您还可以在 GitHub 上 [提交问题][issue]。

## 作者和贡献者

该存储库的最初设置由 [Franck Nijhof][frenck] 完成。

有关所有作者和贡献者的完整列表，请查看 [贡献者页面][contributors]。

## 许可证

MIT 许可证

版权所有 (c) 2019-2020 Franck Nijhof

特此免费授予任何获得本软件及相关文档文件（以下简称 "软件"）的人员使用软件的权利，无限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供该软件的人这样做，需遵循以下条件：

上述版权声明和本许可声明必须包括在所有软件的副本或重要部分中。

本软件是按 "原样" 提供的，不存在任何种类的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人对于因使用软件或与软件的其他交易而产生的任何索赔、损害或其他责任均不承担责任。

[bitwarden-rs]: https://github.com/dani-garcia/bitwarden_rs
[contributors]: https://github.com/hassio-addons/addon-bitwarden/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-bitwarden-rs/115573?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-bitwarden/issues
[keepchangelog]: http://keepachangelog.com/en/1.0.0/
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-bitwarden/releases
[semver]: http://semver.org/spec/v2.0.0.htm