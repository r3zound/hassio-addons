# Home Assistant Community Add-on: pterodactyl面板
![支持aarch64架构][aarch64-shield] ![支持amd64架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl面板游戏服务器适用于Homeassistant OS

![Ingress支持](../_images/pterodactyl/ingress.png)

## 关于

**警告：目前仅有限功能。现在可以认为它处于测试版且不稳定。如果您的游戏服务器丢失等，请不要责怪我。**
**对我而言，我到现在都无法登录。似乎与redis有关，但我不确切知道是什么。**

Pterodactyl® 是一个免费的开源游戏服务器管理面板，使用PHP、React和Go构建。考虑到安全性，Pterodactyl在隔离的Docker容器中运行所有游戏服务器，同时向最终用户提供一个美观和直观的UI。<br />
不要再满足于低于标准的解决方案。让游戏服务器在您的平台上成为一等公民。

## 安装

[![FaserF Homeassistant插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义Home Assistant插件没有不同。<br />
只需点击上面的链接或将我的库添加到hassio插件库：<https://github.com/FaserF/hassio-addons>

## 配置

在安装此插件之前需要MariaDB集成！

之后，在MariaDB插件中创建一个名为“pterodactyl”的新用户，并对数据库“panel”拥有完全权限。

**注意**：_记得在配置更改时重启插件。_

插件配置示例：

```yaml
password: your_MariaDB_password
ssl: false
certfile: itdoesntmatter_as_ssl_is_set_to_false
keyfile: itdoesntmatter_as_ssl_is_set_to_false
```
<br />
推荐示例插件配置：

```yaml
password: your_MariaDB_password
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，不要复制粘贴！创建你自己的！_

### 选项：`password`

此选项为必需。MariaDB中“pterodactyl”用户的密码。

### 选项：`ssl`

启用/禁用Web界面的SSL (HTTPS)。

如果您需要自签名证书，请查看我的openssl插件：<https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在`/ssl/`中，这是默认位置_

### 选项：`reset_database`

启用后可以重置pterodactyl的数据库文件。请注意此操作无法撤销！使用时请小心。

### 选项：`password`

此选项为必需。您的MariaDB密码用于pterodactyl用户。

**注意**：_文件必须存储在`/share/`文件夹中的某个地方_

## 默认登录凭据

电子邮件：<admin@example.com>
用户名：admin
密码：在选项`password`中定义的密码

## Ingress

此插件将支持Homeassistant Ingress。到目前为止，它仍在进行中！

## 支持

有问题或疑问？

您可以在这里[打开一个问题][issue] GitHub。
请记住，此软件仅在Raspberry Pi 4上的armv7上测试。

## 作者与贡献者

该程序的原始版本来自pterodactyl项目。有关更多信息，请访问此页面：<https://pterodactyl.io/>
该hassio插件由[FaserF]提供。

## 许可证

MIT许可证

版权所有 (c) 2019-2022 FaserF & pterodactyl项目

特此免费授予任何获得该软件及相关文档文件（“软件”）副本的人，无限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本的权利，并允许向其提供该软件的人这样做，前提是遵守以下条件：

上述版权声明和此许可声明应包含在所有副本或软件的实质性部分中。

本软件按“原样”提供，没有任何形式的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起或与之相关的任何索赔、损害或其他责任负责，无论是合同诉讼、侵权行为还是其他。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues