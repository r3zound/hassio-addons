# Home Assistant Community Add-on: OpenSSL
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

OpenSSL - Homeassistant OS 的自签名证书

## 关于

OpenSSL 是一个软件库，用于保护计算机网络上通信的应用程序，防止窃听或识别另一方。它被大多数 HTTPS 网站使用，广泛用于互联网服务器。

OpenSSL 包含 SSL 和 TLS 协议的开源实现。核心库使用 C 编程语言编写，实现基本的加密功能并提供各种实用功能。允许在多种计算机语言中使用 OpenSSL 库的包装器是可以获取的。

OpenSSL 软件基金会 (OSF) 在大多数法律事务中代表 OpenSSL 项目，包括贡献者许可协议、管理捐赠等等。OpenSSL 软件服务 (OSS) 也代表 OpenSSL 项目，负责支持合同。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装过程非常简单，与安装其他自定义 Home Assistant 插件没有不同。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库中： <https://github.com/FaserF/hassio-addons>

启动插件后，将创建自签名证书并放置于：
/ssl/key_openssl.pem
/ssl/cert_openssl.pem

然后可以被其他插件使用，例如我的 apache2 webserver 插件。
如果证书即将过期，只需重新启动一次插件，新证书将会被创建。
警告：重启插件后，以上命名的旧证书将被删除和覆盖！

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

```yaml
website_name: mywebsite.ddns.net
```

**注意**：_这只是一个示例，请不要复制和粘贴！请创建你自己的！_

### 选项: `website_name`

此选项是必需的。它将是自签名证书的网站名称。

## 支持

有问题？

你可以在 [这里打开一个问题][issue] GitHub。
请记住，这个软件仅在运行在 Tinkerboard 的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 OpenSSL 项目。如需更多信息，请访问此页面： <https://www.openssl.org/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2021 FaserF & OpenSSL 项目

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许向这些人提供软件副本的人这样做，前提是满足以下条件：

以上版权声明和本许可证声明应包含在所有软件副本或重要部分中。

该软件是按“原样”提供的，没有任何种类的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对任何索赔、损害或其他责任负责，无论是基于合同、侵权或其他方面，均不对因使用软件或与软件的使用或其他交易相关的任何索赔负责。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg