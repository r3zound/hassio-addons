# Home Assistant Community Add-on: OpenSSL
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

OpenSSL - 用于 Homeassistant OS 的自签名证书

## 关于

OpenSSL 是一个软件库，用于保护计算机网络上的通信安全，防止窃听或需要验证另一方的身份。它被大多数 HTTPS 网站广泛使用。

OpenSSL 包含 SSL 和 TLS 协议的开源实现。核心库用 C 编程语言编写，实现了基本的密码功能，并提供各种实用功能。允许在多种计算机语言中使用 OpenSSL 库的包装器也可用。

OpenSSL 软件基金会（OSF）在大多数法律事务中代表 OpenSSL 项目，包括贡献者许可协议、管理捐赠等。OpenSSL 软件服务（OSS）也代表 OpenSSL 项目，提供支持合同。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件并没有不同。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件仓库：<https://github.com/FaserF/hassio-addons>

启动附加组件后，将创建一个自签名证书并放置在：
/ssl/key_openssl.pem
/ssl/cert_openssl.pem

这些可以被其他附加组件使用，例如我的 apache2 网页服务器附加组件。
如果证书即将过期，只需重启一次附加组件，新证书将被创建。
警告：重启附加组件后，上述名称的旧证书将被删除及覆盖！

## 配置

**注意**：_记得在更改配置时重启附加组件。_

附加组件配置示例：

```yaml
website_name: mywebsite.ddns.net
```

**注意**：_这只是一个示例，请不要复制粘贴！创建你自己的！_

### 选项： `website_name`

这个选项是必需的。这将是自签名证书的网站名称。

## 支持

有疑问？

你可以在这里 [提交问题][issue] GitHub。
请记住，这个软件仅在运行于 Tinkerboard 的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 OpenSSL 项目。有关更多信息，请访问此页面：<https://www.openssl.org/>
该 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2021 FaserF & The OpenSSL 项目

特此授予任何获取本软件及相关文档文件（“软件”）副本的人无偿使用该软件的权利，具体包括不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件副本的权利，以及允许其提供给的人员在遵守以下条件的前提下进行上述行为：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，不提供任何类型的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或其他交易造成的任何索赔、损害或其他责任承担责任，无论是合同、侵权或其他方式。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg