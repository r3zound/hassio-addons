# Home Assistant Community Add-on: pterodactyl Panel
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Panel 游戏服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

**警告: 目前仅有限的工作。现在可以认为是 beta 和不稳定。如果您的游戏服务器丢失等，请不要指责我。**
**对我来说，我到现在还无法登录。似乎和 redis 有关系，但我不太清楚具体是什么。**

Pterodactyl® 是一个免费、开源的游戏服务器管理面板，基于 PHP、React 和 Go 构建。Pterodactyl 在设计时考虑了安全性，所有游戏服务器都在隔离的 Docker 容器中运行，同时向终端用户提供美观且直观的用户界面。<br />
不要再将就了。让游戏服务器成为您平台上的第一公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装相当简单，与安装任何其他自定义 Home Assistant 插件并无不同。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

在安装这个插件之前，需要先安装 MariaDB 集成！

然后在 MariaDB 插件中创建一个名为 "pterodactyl" 的新用户，并赋予该用户对 "panel" 数据库的完全权限。

**注意**: _记得在配置更改时重启插件。_

示例插件配置：

```yaml
password: your_MariaDB_password
ssl: false
certfile: itdoesntmatter_as_ssl_is_set_to_false
keyfile: itdoesntmatter_as_ssl_is_set_to_false
```
<br />
推荐的示例插件配置：

```yaml
password: your_MariaDB_password
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**: _这只是一个示例，不要复制和粘贴！请创建您自己的！_

### 选项: `password`

该选项是必需的。用于 mariadb "pterodactyl" 用户的密码。

### 选项: `ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。

如果您需要自签名证书，请查看我的 openssl 插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**: _文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `reset_database`

启用重置 pterodactyl 的数据库文件。请注意此操作无法撤销！请谨慎使用。

### 选项: `password`

该选项是必需的。您用于 pterodactyl 用户的 MariaDB 密码。

**注意**: _文件必须存储在 `/share/` 文件夹中的某个地方_

## 默认登录凭据

电子邮件: <admin@example.com>
用户名: admin
密码: 在选项 `password` 中定义的密码

## Ingress

该插件将支持 Homeassistant Ingress。到目前为止，仍在开发中！

## 支持

有问题或有疑问？

您可以在这里 [提交问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。有关更多信息，请访问此页面： <https://pterodactyl.io/>
该 hassio 插件由 [FaserF] 带给您。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 FaserF & pterodactyl 项目

特此免费授权任何获得本软件及其相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件副本的权利，并允许向其提供该软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件“按原样”提供，不提供任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有者均不对因使用该软件或与该软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues