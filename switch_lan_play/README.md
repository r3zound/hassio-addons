# Home Assistant Community Add-on: Nintendo Switch LAN-Play Client
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 客户端

![Lan-Play Home Home Assistant 插件](../_images/switch_lan_play/screenshot.png)

## 介绍

要在线与您的 CFW Nintendo Switch 游戏，您可以使用此插件 + 公共或私人服务器。此插件可用于停止在桌面 PC / 笔记本电脑上运行 LAN Play 客户端。
这只是客户端软件，而不是服务器软件。要将 LAN-Play 服务器与 Homeassistant OS 一起使用，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play_server>

此 docker 镜像将自动编译最新的 LAN-Play 软件，并根据您的架构运行。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
第一次安装可能需要长达 10 分钟，这取决于您的硬件。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有不同。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库：<https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_在更改配置时，请记得重启插件。_

示例插件配置：

```yaml
server: switch.lan-play.com:11452
```

**注意**：_这只是一个示例，不要复制粘贴！创建您自己的！_

### 选项：`server`

此选项是必需的。请在此处输入您要连接的服务器，并添加端口。

**注意**：如果您将此留空，将会出现问题。

## 支持

有问题吗？

您可以 [在这里报告问题][issue] GitHub。
请记住，此软件仅在运行于 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原程序来自 spacemeowx2。有关更多信息，请访问此 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
此 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & spacemeowx2

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，使用软件的权利，未经限制，包括不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许软件的提供者进行此类操作，须遵守以下条件：

上述版权声明和本许可声明应包括在所有软件的副本或实质性部分中。

软件是“按现状”提供的，不附有任何种类的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和非侵权的保证。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg