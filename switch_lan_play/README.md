# Home Assistant Community Add-on: Nintendo Switch LAN-Play Client
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Nintendo Switch LAN-Play 客户端用于 Homeassistant OS

![Lan-Play Home Home Assistant 插件](../_images/switch_lan_play/screenshot.png)

## 关于

要在网上使用您的 CFW Nintendo Switch 玩游戏，您可以使用此插件 + 一个公共或私有服务器。此插件可以用来停止在桌面 PC/笔记本电脑上运行 LAN Play 客户端。
这只是客户端软件，而不是服务器软件。要将 LAN-Play 服务器与 Homeassistant OS 一起使用，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play_server>

此 Docker 镜像将自动编译最新的 LAN-Play 软件并根据您的架构运行。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
首次安装可能需要多达 10 分钟，具体取决于您的硬件。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_当更改配置时，记得重启插件。_

示例插件配置：

```yaml
server: switch.lan-play.com:11452
```

**注意**：_这只是一个示例，不要复制粘贴！创建您自己的！_

### 选项：`server`

此选项是必需的。请在这里写下您要连接的服务器及其端口。

**注意**：如果您将其留空，将会出现问题。

## 支持

有问题吗？

您可以在这里 [提出问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者及贡献者

原程序来自 spacemeowx2。有关更多信息，请访问此 GitHub： <https://github.com/spacemeowx2/switch-lan-play>
此 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & spacemeowx2

特此授予任何获得本软件及相关文档文件 (“软件”) 的人员，免费使用、拷贝、修改、合并、出版、分发、再许可和/或出售本软件的副本的权利，并允许向其提供软件的人员做出上述行为，条件如下：

上述版权声明和本许可声明应包括在所有副本或软件的实质性部分中。

本软件是“按原样”提供的，不附有任何明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用本软件或与本软件的使用或其他交易有关的任何索赔、损害或其他责任承担责任，无论是基于合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg