# Home Assistant Community Add-on: pterodactyl Wings (Daemon)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (Daemon) 游戏服务器适用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费的开源游戏服务器管理面板，使用 PHP、React 和 Go 构建。考虑到安全性，Pterodactyl 在隔离的 Docker 容器中运行所有游戏服务器，同时向最终用户提供美观直观的用户界面。<br />
不要再将就了。让游戏服务器成为您平台上的一等公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

在安装这个之前需要先安装 MariaDB 集成！

## 配置

**注意**：_记得在更改配置时重启插件。_

示例插件配置：

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**：_这只是一个示例，不要复制粘贴！创建您自己的！_

### 选项： `config_file`

该选项是必需的。指向您的 config.yml 文件的路径。

**注意**：_该文件必须存放在 `/share/` 文件夹内的某处_

## Ingress

该插件将支持 Homeassistant Ingress。到目前为止，它仍在进行中！

## 支持

有问题或疑问？

您可以在这里 [提交问题][issue] GitHub。
请记住，此软件仅在运行在 Raspberry Pi 4 上的 armv7 上进行测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。如需更多信息，请访问此页面：<https://pterodactyl.io/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2022 FaserF & pterodactyl 项目

在此特此免费授予任何获取该软件及其相关文档文件（“软件”）副本的人，处理该软件的权利，不受限制，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许其提供软件的人这样做，须遵循以下条件：

上述版权声明和本许可证声明应包含在软件的所有副本或重要部分中。

该软件是按“现状”提供的，不作任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有者均不对因使用该软件或与该软件或使用或其他交易相关的其他问题而导致的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues