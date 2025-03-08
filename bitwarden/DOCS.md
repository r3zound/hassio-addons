# Home Assistant社区插件：Vaultwarden（Bitwarden）

Bitwarden是一个开源密码管理器，可以将敏感信息（如网站凭据）存储在加密保管库中。

Bitwarden平台提供多种客户端应用程序，包括网页界面、桌面应用程序、浏览器扩展和移动应用。

这个插件基于轻量级和开源的[Vaultwarden][vaultwarden]实现，允许您自托管这个令人惊叹的密码管理器。

密码盗窃是一个严重问题。您使用的网站和应用程序每天都在遭受攻击。安全漏洞发生，您的密码被窃取。当您在各处重复使用相同的密码时，黑客很容易访问您的电子邮件、银行和其他重要账户。使用密码管理器！

## 安装

这个插件的安装非常简单，与安装任何其他Home Assistant插件没有区别。

1. 点击下方的Home Assistant我的按钮，打开您的Home Assistant实例中的插件。

   [![在您的Home Assistant实例中打开这个插件。][addon-badge]][addon]

2. 点击“安装”按钮安装插件。
3. 启动“Vaultwarden（Bitwarden）”插件。
4. 检查“Vaultwarden（Bitwarden）”插件的日志，查看一切是否正常，并获取管理员令牌/密码。
5. 点击“打开网页界面”按钮打开Vaultwarden。
6. 在URL后添加`/admin`以访问管理员面板，例如，`http://hassio.local:7277/admin`。使用您在步骤4中获得的管理员令牌登录。
7. 日志中的管理员/令牌仅在保存或更改之前显示。点击管理员面板中的保存以使用随机生成的密码，或更改为您选择的密码。
8. 请务必将您的管理员令牌存储在安全的地方。**插件将再也不会显示它！**

## 配置

**注意**：_更改配置后请记得重启插件。_

示例插件配置：

```yaml
log_level: info
ssl: false
certfile: fullchain.pem
keyfile: privkey.pem
request_size_limit: 10485760
```

**注意**：_这只是一个示例，别复制粘贴！创建您自己的！_

### 选项：`log_level`

`log_level`选项控制插件的日志输出级别，可以更改为更少或更多的详细信息，这在处理未知问题时可能会很有用。可能的值有：

- `trace`：显示每一个细节，如所有调用的内部函数。
- `debug`：显示详细的调试信息。
- `info`：正常（通常）有趣的事件。
- `warning`：非错误的异常情况。
- `error`：运行时错误，不需要立即采取行动。
- `fatal`：出了重大问题。插件变得不可用。

请注意，每个级别会自动包含更严重级别的日志消息，例如，`debug`还会显示`info`消息。默认情况下，`log_level`设置为`info`，这是推荐的设置，除非您在排除故障。

### 选项：`ssl`

启用/禁用SSL（HTTPS）。将其设置为`true`以启用，`false`则禁用。

**注意**：_SSL设置仅适用于直接访问，对Ingress服务没有效果。_

### 选项：`certfile`

要用于SSL的证书文件。

**注意**：_该文件必须存储在`/ssl/`中，这是默认位置。_

### 选项：`keyfile`

要用于SSL的私钥文件。

**注意**：_该文件必须存储在`/ssl/`中，这是默认位置。_

### 选项：`request_size_limit`

默认情况下，API调用的大小限制为10MB。这对于大多数情况应该足够，但是如果您想支持大导入，这可能会限制您。另一方面，您可能希望将请求大小限制为小于10MB的值，以防止API滥用和可能的DOS攻击，尤其是在资源有限的情况下运行时。

要设置限制，您可以使用此设置：10MB为`10485760`。

## 已知问题和限制

- 由于Bitwarden Vault网页界面的技术限制，目前此插件无法支持Ingress。
- 一些网络浏览器（如Chrome）不允许在不安全的上下文中使用Web Crypto API。在这种情况下，您可能会收到“无法读取属性'importKey'”的错误。要解决此问题，您需要启用SSL并使用HTTPS访问网页界面。

## 更新日志和版本

该存储库使用[GitHub的版本][releases]功能保持变更日志。

版本基于[语义版本控制][semver]，并采用`MAJOR.MINOR.PATCH`格式。简而言之，版本将根据以下内容递增：

- `MAJOR`：不兼容的或重大更改。
- `MINOR`：向后兼容的新功能和增强功能。
- `PATCH`：向后兼容的错误修复和包更新。

## 支持

有问题？

您有几种选择可以得到解答：

- [Home Assistant社区添加插件Discord聊天服务器][discord]以获得插件支持和功能请求。
- [Home Assistant Discord聊天服务器][discord-ha]以进行一般的Home Assistant讨论和问题。
- Home Assistant [社区论坛][forum]。
- 加入[Reddits子版块][reddit]中的[/r/homeassistant][reddit]

您也可以在这里[开一个问题][issue] GitHub。

## 作者及贡献者

该存储库的最初设置由[Franck Nijhof][frenck]完成。

有关所有作者和贡献者的完整列表，请查看[贡献者页面][contributors]。

## 许可证

MIT许可证

版权所有(c) 2019-2025 Franck Nijhof

特此免费授予任何获取本软件及其相关文档文件（“软件”）的人员，在不受限制的条件下处理软件的权限，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本的权利，并允许向其提供软件的人这样做，但需遵守以下条件：

上述版权声明和本许可声明应包括在软件的所有副本或实质性部分中。

软件按“原样”提供，不提供任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或与软件或其他交易中有关的任何索赔、损害或其他责任承担责任，无论是在合同诉讼、侵权或其他方面。

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_bitwarden&repository_url=https%3A%2F%2Fgithub.com%2Fhassio-addons%2Frepository
[contributors]: https://github.com/hassio-addons/addon-bitwarden/graphs/contributors
[discord-ha]: https://discord.gg/c5DvZ4e
[discord]: https://discord.me/hassioaddons
[forum]: https://community.home-assistant.io/t/home-assistant-community-add-on-bitwarden-rs/115573?u=frenck
[frenck]: https://github.com/frenck
[issue]: https://github.com/hassio-addons/addon-bitwarden/issues
[reddit]: https://reddit.com/r/homeassistant
[releases]: https://github.com/hassio-addons/addon-bitwarden/releases
[semver]: https://semver.org/spec/v2.0.0.html
[vaultwarden]: https://github.com/dani-garcia/vaultwarden