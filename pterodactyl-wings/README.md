# Home Assistant Community Add-on: pterodactyl Wings (Daemon)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (Daemon) 主机服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费、开源的游戏服务器管理面板，由 PHP、React 和 Go 构建。考虑到安全性，Pterodactyl 在隔离的 Docker 容器中运行所有游戏服务器，同时提供一个美观直观的用户界面给最终用户。<br />
不要再满足于次优选择。让游戏服务器成为您平台上的一流公民。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的 repo 添加到 hassio 插件仓库： <https://github.com/FaserF/hassio-addons>

在安装此插件之前需要先安装 MariaDB 集成！

## 配置

**注意**：_更改配置时记得重启插件。_

示例插件配置：

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**：_这只是一个示例，不要复制粘贴！请自己创建！_

### 选项： `config_file`

此选项是必需的。您 config.yml 文件的路径。

**注意**：_该文件必须存储在 `/share/` 文件夹中的某个位置_

## Ingress

此插件将支持 Homeassistant Ingress。到目前为止，它仍在开发中！

## 支持

有问题或疑问？

您可以在这里 [提交问题][issue] 到 GitHub。
请记住，这个软件仅在 Raspberry Pi 4 上的 armv7 上进行过测试。

## 作者和贡献者

该程序原始来自 pterodactyl 项目。如需更多信息，请访问此页面： <https://pterodactyl.io/>
此 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2022 FaserF & pterodactyl 项目

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，以不受限制地处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售软件副本的权利，并允许提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件按“原样”提供，不提供任何种类的明示或暗示的保证，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对由于使用或其他交易中的软件或与之相关的任何索赔、损害或其他责任负责，无论是合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues