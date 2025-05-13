# Home Assistant 社区附加组件：OpenSSL
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

OpenSSL - Homeassistant OS 的自签名证书

## 关于

OpenSSL 是一个软件库，用于确保计算机网络上通信的安全，防止窃听或识别另一端的参与者。它被大多数 HTTPS 网站和许多互联网服务器广泛使用。

OpenSSL 包含 SSL 和 TLS 协议的开源实现。核心库使用 C 编程语言编写，实现了基本的加密功能，并提供多种实用函数。可以使用各种计算机语言的包装器来使用 OpenSSL 库。

OpenSSL 软件基金会 (OSF) 在大多数法律事务中代表 OpenSSL 项目，包括贡献者许可协议、管理捐赠等。OpenSSL 软件服务 (OSS) 也代表 OpenSSL 项目，提供支持合同。

## 安装

[![FaserF Homeassistant 附加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装此附加组件非常简单，和安装其他自定义 Home Assistant 附加组件没有什么不同。<br />
只需点击上面的链接或将我的库添加到 hassio 附加组件仓库：<https://github.com/FaserF/hassio-addons>

启动附加组件后，将创建自签名证书并放置到：
/ssl/key_openssl.pem
/ssl/cert_openssl.pem

然后这些证书可以被其他附加组件使用，例如我的 apache2 网络服务器附加组件。
如果证书即将过期，只需重启附加组件一次，新证书将会被创建。
警告：重启附加组件后，以上命名的旧证书将被删除并覆盖！

## 配置

**注意**：_记得在更改配置后重启附加组件。_

示例附加组件配置：

```yaml
website_name: mywebsite.ddns.net
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建你自己的！_

### 选项：`website_name`

此选项是必要的。这将是自签名证书的网站名称。

## 支持

有问题吗？

你可以在这里 [打开问题][issue] GitHub。
请记住，这个软件仅在 Tinkerboard 上运行的 armv7 上进行了测试。

## 作者 & 贡献者

原程序来自 OpenSSL 项目。有关更多信息，请访问以下页面：<https://www.openssl.org/>
hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2021 FaserF & The OpenSSL Project

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包括在所有软件副本或实质性部分中。

软件是“按原样”提供的，不作任何形式的保证，无论明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人对因使用软件或与软件的使用或其他交易相关而产生的任何索赔、损害或其他责任不承擔任何责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg