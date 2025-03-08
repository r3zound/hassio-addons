# Home Assistant 社区附加组件: pterodactyl Wings (守护进程)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (守护进程) 游戏服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费的、开源的游戏服务器管理面板，使用 PHP、React 和 Go 构建。Pterodactyl 以安全性为设计理念，在隔离的 Docker 容器中运行所有游戏服务器，同时向最终用户提供一个美观直观的用户界面。<br />
不要再妥协了。让游戏服务器在您的平台上成为一等公民。

## 安装

[![FaserF Homeassistant 附加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，与安装其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件库: <https://github.com/FaserF/hassio-addons>

在安装这个之前需要 MariaDB 集成！

## 配置

**注意**: _记得在配置更改后重启附加组件。_

示例附加组件配置：

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**: _这只是一个示例，不要复制粘贴！创建你自己的配置！_

### 选项: `config_file`

此选项是必需的。指向您的 config.yml 文件的路径。

**注意**: _该文件必须存储在 `/share/` 文件夹中的某个位置_

## Ingress

此附加组件将支持 Homeassistant Ingress。目前仍在开发中！

## 支持

有问题或疑问？

您可以在 [这里打开一个问题][issue] GitHub。
请记住，这个软件仅在 Raspberry Pi 4 的 armv7 上进行过测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。有关更多信息，请访问此页面: <https://pterodactyl.io/>
Hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2022 FaserF 和 pterodactyl 项目

特此免费授权任何获得本软件及相关文档文件（统称“软件”）副本的人在软件中不受限制地进行处理，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，并允许提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

软件按“原样”提供，不附有任何种类的保证，明示或暗示，包括但不限于对商业适用性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有者都不对因使用本软件或与本软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权诉讼还是其他诉讼。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues