# Home Assistant 社区插件：Nintendo Switch LAN-Play 客户端
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 客户端

![Lan-Play Home Home Assistant 插件](../_images/switch_lan_play/screenshot.png)

## 关于

要在您的 CFW Nintendo Switch 上进行在线游戏，您可以使用此插件 + 一个公共或私人服务器。此插件可以用于停止在桌面 PC/笔记本电脑上运行 LAN Play 客户端。
这只是客户端软件，而不是服务器软件。要在 Homeassistant OS 中使用 LAN-Play 服务器，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play_server>

此 Docker 镜像将自动编译最新的 LAN-Play 软件，并根据您的架构运行它。更多信息请查看这里：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
首次安装可能需要长达 10 分钟的时间，具体取决于您的硬件。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件仓库：<https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_修改配置后，请记得重启插件。_

插件配置示例：

```yaml
server: switch.lan-play.com:11452
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项：`server`

此选项是必填的。请在此处填写您想要连接的服务器及其端口。

**注意**：如果您留空，将会出现问题。

## 支持

有问题吗？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，这款软件仅在 Raspberry Pi 4 的 armv7 上进行测试。

## 作者及贡献者

原始程序来自 spacemeowx2。有关更多信息，请访问这个 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
该 hassio 插件由 [FaserF] 为您提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2023 FaserF & spacemeowx2

特此免费授予任何获得本软件及相关文档文件（以下简称“软件”）副本的人，使其在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权及/或出售该软件副本的权利，以及允许提供该软件的人员这样做，但须遵循以下条件：

上述版权声明和本许可声明应包含在该软件的所有副本或重要部分中。

该软件是“按原样”提供的，不提供任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件有关的其他交易而产生的任何索赔、损害或其他责任承担责任，无论是合同诉讼、侵权或其他方式。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg