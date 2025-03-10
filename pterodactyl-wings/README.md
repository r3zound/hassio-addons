# Home Assistant Community Add-on: pterodactyl Wings (Daemon)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (Daemon) 游戏服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费、开源的游戏服务器管理面板，使用 PHP、React 和 Go 构建。Pterodactyl 考虑到安全性，在孤立的 Docker 容器中运行所有游戏服务器，同时向最终用户提供一个美观且直观的用户界面。<br />
不要再将就了。让游戏服务器成为您平台上的一等公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装非常简单，与安装其他自定义 Home Assistant 插件并无不同。<br />
只需点击上面的链接或将我的存储库添加到 hassio 插件仓库: <https://github.com/FaserF/hassio-addons>

在安装之前，需要先安装 MariaDB 集成！

## 配置

**注意**: _记得在更改配置后重启插件。_

示例插件配置:

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**: _这只是一个示例，不要直接复制粘贴！创建你自己的！_

### 选项: `config_file`

此选项是必需的。指向你的 config.yml 文件的路径。

**注意**: _该文件必须存储在 `/share/` 文件夹中的某个位置_

## Ingress

该插件将支持 Homeassistant Ingress。目前仍在进行中！

## 支持

有问题或疑问？

你可以在此处 [打开问题][issue] GitHub。
请记住，软件仅在 Raspberry Pi 4 上的 armv7 架构上进行了测试。

## 作者与贡献者

原程序来自 pterodactyl 项目。有关更多信息，请访问此页面: <https://pterodactyl.io/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2022 FaserF & pterodactyl 项目

特此免费授予任何获取本软件及相关文档文件 (以下简称“软件”) 副本的人，在软件中不受限制地处理本软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这样做，条件是满足以下条件:

上述版权声明和本许可声明应包含在所有副本或软件的实质部分中。

该软件按“原样”提供，不提供任何类型的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对因使用或其他交易中产生的、基于合同、侵权或其他原因的任何索赔、损害或其他责任负责。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues