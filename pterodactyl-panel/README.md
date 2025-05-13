# Home Assistant Community Add-on: pterodactyl Panel
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl 面板游戏服务器用于 Homeassistant 操作系统

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

**警告：目前仅限于有限的工作。现在可以认为是测试版且不稳定。如果您的游戏服务器丢失等，请不要责怪我。**
**对我来说，我到现在无法登录。似乎与 redis 有关，但我不确定到底是什么。**

Pterodactyl® 是一个免费的开源游戏服务器管理面板，使用 PHP、React 和 Go 构建。考虑到安全性，Pterodactyl 在隔离的 Docker 容器中运行所有游戏服务器，同时向最终用户提供一个美观且直观的用户界面。<br />
不要再满足于次优选择。让游戏服务器成为您平台上的一流公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装过程非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

在安装这个插件之前，需要先安装 MariaDB 集成！

然后在 MariaDB 插件中创建一个名为 "pterodactyl" 的新用户，并对数据库 "panel" 拥有完全权限。

**注意**：_记得在配置更改时重启插件。_

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

**注意**：_这仅仅是一个示例，不要直接复制粘贴！创建您自己的！_

### 选项： `password`

这个选项是必需的。用于 mariadb "pterodactyl" 用户的密码。

### 选项： `ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。

如果您需要自签名证书，可以查看我的 openssl 插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项： `reset_database`

允许重置 pterodactyl 的数据库文件。请注意，这个操作不能被撤销！请谨慎使用。

### 选项： `password`

这个选项是必需的。您用于 pterodactyl 用户的 MariaDB 密码。

**注意**：_文件必须存储在 `/share/` 文件夹中的某个地方_

## 默认登录凭证

电子邮件： <admin@example.com>
用户名： admin
密码： 在选项 `password` 中定义的密码

## Ingress

该插件将支持 Homeassistant Ingress。到目前为止，它仍在进行中！

## 支持

有问题或困惑？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，这个软件只在 Raspberry Pi 4 上的 armv7 进行测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。有关更多信息，请访问此页面： <https://pterodactyl.io/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权（c）2019-2022 FaserF 和 pterodactyl 项目

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，以无任何限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许提供该软件的人这样做，条件如下：

以上版权声明和本许可声明应包含在所有副本或软件的重要部分中。

软件按“原样”提供，不提供任何形式的保证，无论是明示或暗示的，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任，不论是在合同诉讼、侵权或其他方面，都不承担来自、出自或与软件或软件的使用或其他交易有关的责任。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues