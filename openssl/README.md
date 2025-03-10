# Home Assistant Community Add-on: OpenSSL
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

OpenSSL - Homeassistant OS 的自签名证书

## 关于

OpenSSL 是一个软件库，用于保护计算机网络上的通信，防止窃听或需要识别另一端的参与方。它被互联网服务器广泛使用，包括大多数 HTTPS 网站。

OpenSSL 包含 SSL 和 TLS 协议的开源实现。核心库用 C 编程语言编写，实现了基本的加密功能并提供了各种实用功能。也提供了允许在多种计算机语言中使用 OpenSSL 库的包装器。

OpenSSL 软件基金会 (OSF) 代表 OpenSSL 项目在大多数法律事务中，包括贡献者许可证协议、管理捐赠等。OpenSSL 软件服务 (OSS) 也代表 OpenSSL 项目，用于支持合同。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库中： <https://github.com/FaserF/hassio-addons>

启动插件后，将创建一个自签名证书并放置在：
/ssl/key_openssl.pem
/ssl/cert_openssl.pem

这些证书可以被其他插件使用，例如我的 apache2 网络服务器插件。
如果证书即将到期，只需重新启动一次插件，将创建新的证书。
警告：重新启动插件后，以上命名的旧证书将被删除并覆盖！

## 配置

**注意**：_记得在更改配置后重新启动插件。_

示例插件配置：

```yaml
website_name: mywebsite.ddns.net
```

**注意**：_这只是一个示例，别复制粘贴！创建你自己的！_

### 选项： `website_name`

这个选项是必需的。这将是自签名证书的网站名称。

## 支持

有问题吗？

你可以在 [这里打开问题][issue] GitHub。
请记住，此软件仅在 Tinkerboard 上的 armv7 上测试。

## 作者 & 贡献者

原程序来自 OpenSSL 项目。有关更多信息，请访问此页面： <https://www.openssl.org/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2021 FaserF & OpenSSL 项目

特此免费授予任何获得此软件及其相关文档文件（"软件"）副本的人，在不受限制的情况下处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许提供该软件的人这样做，但须符合以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

软件是按 "原样" 提供的，没有任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg