# Home Assistant Community Add-on: pterodactyl Wings (Daemon)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (Daemon) 游戏服务器适用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费的开源游戏服务器管理面板，使用 PHP、React 和 Go 构建。Pterodactyl 在设计时考虑了安全性，它将所有游戏服务器运行在隔离的 Docker 容器中，同时为最终用户提供了一个美观且直观的用户界面。<br />
不再将就。让游戏服务器成为您平台上的一等公民。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有什么区别。<br />
只需点击上面的链接或将我的库添加到 hassio 附加组件库： <https://github.com/FaserF/hassio-addons>

在安装此组件之前需要先安装 MariaDB 集成！

## 配置

**注意**: _在更改配置时，请记得重启附加组件。_

附加组件配置示例：

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**: _这只是一个示例，请不要直接复制粘贴！创建您自己的！_

### 选项：`config_file`

此选项是必需的。指向您的 config.yml 文件的路径。

**注意**: _该文件必须存放在 `/share/` 文件夹中的某处_

## Ingress

此附加组件将支持 Homeassistant Ingress。到目前为止，它仍在开发中！

## 支持

有问题或疑问？

您可以在这里 [提出问题][issue] GitHub。
请记住，此软件仅在运行在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 pterodactyl 项目。有关更多信息，请访问此页面： <https://pterodactyl.io/>
此 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2022 FaserF & pterodactyl 项目

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，
在不受限制的情况下使用、复制、修改、合并、出版、分发、再授权和/或销售
该软件的副本，并允许向其提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有
软件的副本或重要部分中。

该软件是“按原样”提供的，不附带任何形式的担保，无论明示或
暗示，包括但不限于适销性、特定用途的适用性和不侵权的担保。在任何情况下，
作者或版权持有人均不对因使用本软件或与本软件的
使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权诉讼还是其他。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues