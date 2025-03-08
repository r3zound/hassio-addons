# Home Assistant 社区附加组件：pterodactyl 面板
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl 面板游戏服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

**警告：目前仅有限工作。现在可以被视为测试版且不稳定。如果您的游戏服务器丢失等情况，请不要责怪我。**
**对于我来说，我至今无法登录。似乎与 redis 有关，但我不太明白具体是什么。**

Pterodactyl® 是一个免费、开源的游戏服务器管理面板，使用 PHP、React 和 Go 构建。Pterodactyl 考虑到安全性，在隔离的 Docker 容器中运行所有游戏服务器，同时向最终用户提供美观直观的用户界面。<br />
不要再安于现状。让游戏服务器在您的平台上成为一流公民。

## 安装

[![FaserF Homeassistant 添加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，和安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 添加组件仓库： <https://github.com/FaserF/hassio-addons>

## 配置

在安装此组件之前，需要 MariaDB 集成！

然后在 MariaDB 附加组件中创建一个名为 "pterodactyl" 的新用户，具有对数据库 "panel" 的完全权限。

**注意**：_在配置更改时，请记得重启附加组件。_

附加组件配置示例：

```yaml
password: your_MariaDB_password
ssl: false
certfile: itdoesntmatter_as_ssl_is_set_to_false
keyfile: itdoesntmatter_as_ssl_is_set_to_false
```
<br />
推荐的附加组件配置示例：

```yaml
password: your_MariaDB_password
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，不要复制粘贴！请自己创建！_

### 选项：`password`

该选项是必需的。MariaDB "pterodactyl" 用户的密码。

### 选项：`ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。

如果您需要自签名证书，请查看我的 openssl 附加组件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 目录下，这是默认位置。_

### 选项：`reset_database`

启用后可以重置 pterodactyl 的数据库文件。请注意此操作无法撤销！小心使用。

### 选项：`password`

该选项是必需的。您的 pterodactyl 用户的 MariaDB 密码。

**注意**：_文件必须存储在 `/share/` 文件夹中的某个位置。_

## 默认登录凭据

电子邮件： <admin@example.com>
用户名： admin
密码： 在选项 `password` 中定义的密码

## Ingress

该附加组件将支持 Homeassistant Ingress。到目前为止，它仍在进行中！

## 支持

有问题或疑问？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，该软件仅在 armv7 的 Raspberry Pi 4 上进行测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。有关更多信息，请访问此页面： <https://pterodactyl.io/>
该 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2022 FaserF 及 pterodactyl 项目

特此免费授予任何获得此软件及相关文档文件（以下简称“软件”）副本的人，允许其在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或销售软件副本，并且允许提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

软件是“按原样”提供的，没有任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定用途的适用性以及不侵权的保证。在任何情况下，作者或版权持有者都不对因软件或软件使用或其他交易而引起的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权还是其他原因。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues