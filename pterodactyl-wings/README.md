# Home Assistant Community Add-on: pterodactyl Wings (Daemon)
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield]
![项目维护][maintenance-shield]

pterodactyl Wings (Daemon) 游戏服务器用于 Homeassistant OS

![Ingress 支持](../_images/pterodactyl/ingress.png)

## 关于

Pterodactyl® 是一个免费、开源的游戏服务器管理面板，使用 PHP、React 和 Go 构建。Pterodactyl 出于安全考虑，所有游戏服务器都运行在隔离的 Docker 容器中，同时向最终用户提供一个美观且直观的用户界面。<br />
不要再将就了。让游戏服务器成为你平台上的一等公民。

## 安装

[![FaserF Homeassistant 添加项](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装过程相当简单，与安装其他自定义 Home Assistant 插件没有不同。<br />
只需点击上面的链接或将我的仓库添加到 hassio 添加项库：<https://github.com/FaserF/hassio-addons>

在安装此插件之前，需要 MariaDB 集成！

## 配置

**注意**：_记得在配置更改时重新启动插件。_

示例插件配置：

```yaml
config_file: /share/path/to/config.yml
```
<br />

**注意**：_这只是一个示例，请不要复制和粘贴！ 创建你自己的！_

### 选项：`config_file`

此选项是必需的。你配置文件 config.yml 的路径。

**注意**：_该文件必须存储在 `/share/` 文件夹内的某个地方_

## Ingress

此插件将支持 Homeassistant Ingress。目前还在开发中！

## 支持

有任何问题或疑虑？

你可以在 [GitHub 上开一个问题][issue]。
请记住，这个软件仅在 Raspberry Pi 4 上的 armv7 体系结构上进行过测试。

## 作者和贡献者

该程序最初来自 pterodactyl 项目。有关更多信息，请访问此页面：<https://pterodactyl.io/>
该 hassio 插件由 [FaserF] 提供。

## 许可

MIT 许可

版权所有 (c) 2019-2025 FaserF & pterodactyl 项目

特此免费授予任何获取本软件及相关文档文件（“软件”）副本的人，处理软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售软件副本的权利，并允许被提供软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包括在所有软件的副本或实质性部分中。

软件按“原样”提供，没有任何担保，无论明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的担保。在任何情况下，作者或版权持有者均不对因使用软件或与软件有关的其他交易而产生的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues