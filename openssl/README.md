# Home Assistant Community Add-on: OpenSSL
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

OpenSSL - Homeassistant OS 的自签名证书

## 关于

OpenSSL 是一个软件库，用于保护计算机网络上的通信，防止窃听或识别另一端的参与者。它被广泛应用于互联网服务器，包括大多数 HTTPS 网站。

OpenSSL 包含 SSL 和 TLS 协议的开源实现。核心库用 C 编程语言编写，实现了基本的加密功能，并提供各种实用功能。可以找到允许在多种计算机语言中使用 OpenSSL 库的封装。

OpenSSL 软件基金会 (OSF) 在大多数法律方面代表 OpenSSL 项目，包括贡献者许可协议、管理捐款等。OpenSSL 软件服务 (OSS) 也代表 OpenSSL 项目，提供支持合同。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装相当简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

启动插件后，将创建一个自签名证书并存放在：
/ssl/key_openssl.pem
/ssl/cert_openssl.pem

这些证书可以被其他插件使用，例如我的 apache2 网络服务器插件。
如果证书即将到期，只需重启一次插件，新证书将会生成。
警告：重启插件后，以上命名的旧证书将被删除并覆盖！

## 配置

**注意**：_在修改配置后，请记得重启插件。_

示例插件配置：

```yaml
website_name: mywebsite.ddns.net
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项：`website_name`

此选项是必需的。这将是自签名证书的站点名称。

## 支持

有问题吗？

您可以在 [这里打开一个问题][issue] GitHub。
请记住，此软件仅在 Tinkerboard 上运行的 armv7 上进行了测试。

## 作者 & 贡献者

原始程序来自 OpenSSL 项目。欲了解更多信息，请访问此页面： <https://www.openssl.org/>
此 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2021 FaserF 和 OpenSSL 项目

特此免费授权任何获得此软件及相关文档文件（"软件"）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许被提供软件的人按以下条件进行操作：

上述版权声明和此许可声明应包含在所有软件的副本或重要部分中。

该软件是按 "原样" 提供的，未经任何形式的保证，无论是明示或暗示，包括但不限于适销性、特定用途的适用性和非侵权。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件有关的其他交易所引起的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg