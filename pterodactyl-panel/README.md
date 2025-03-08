# Home Assistant 社区插件: Pterodactyl 面板
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

Pterodactyl 面板游戏服务器用于 Homeassistant 操作系统

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

**警告：目前仅有限工作。现在可以认为是测试版且不稳定。如果你的游戏服务器丢失等，请不要责怪我。**
**对我而言，我到现在都无法登录。似乎与 Redis 有关，但我不太明白具体是什么问题。**

Pterodactyl® 是一个基于 PHP、React 和 Go 构建的免费开源游戏服务器管理面板。 Pterodactyl 考虑到安全性，将所有游戏服务器运行在隔离的 Docker 容器中，同时向最终用户提供一个美观且直观的用户界面。<br />
停止将就。让游戏服务器成为你平台上的一等公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装此插件相当简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上述链接或将我的仓库添加到 Hass.io 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

在安装这个插件之前需要先安装 MariaDB 集成！

然后在 MariaDB 插件中创建一个名为 "pterodactyl" 的新用户，并为数据库 "panel" 赋予完全权限。

**注意**：_记得在更改配置时重启插件。_

示例插件配置：

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

**注意**：_这只是一个示例，切勿复制粘贴！请创建您自己的！_

### 选项: `password`

此选项是必需的。MariaDB "pterodactyl" 用户的密码。

### 选项: `ssl`

启用/禁用 web 界面的 SSL (HTTPS)。

如果您需要自签名证书，请查看我的 openssl 插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认路径。_

### 选项: `reset_database`

启用重置 Pterodactyl 的数据库文件。请注意，这一操作是不可逆的！小心使用。

### 选项: `password`

此选项是必需的。您用于 Pterodactyl 用户的 MariaDB 密码。

**注意**：_文件必须存储在 `/share/` 文件夹中的某个位置。_

## 默认登录凭据

电子邮件：<admin@example.com>
用户名：admin
密码：在选项 `password` 中定义的密码

## Ingress

此插件将支持 Homeassistant Ingress。到目前为止，仍在进行中！

## 支持

有问题或疑问？

您可以在这里 [提交问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者和贡献者

原始程序来自 Pterodactyl 项目。如需更多信息，请访问此页面： <https://pterodactyl.io/>
此 Hass.io 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2022 FaserF 和 Pterodactyl 项目

特此免费授予任何获取本软件及其相关文档文件（“软件”）的人员，允许在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售该软件的副本，并允许向其提供软件的人这样做，须遵守以下条件：

上述版权声明和此许可声明应包含在所有副本或软件的实质部分中。

软件是“按原样”提供的，不附带任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或与之相关的其他交易而产生的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues