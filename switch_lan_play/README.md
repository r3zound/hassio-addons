# Home Assistant Community Add-on: Nintendo Switch LAN-Play Client
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

用于 Homeassistant OS 的 Nintendo Switch LAN-Play 客户端

![The Lan-Play Home Home Assistant Add-on](../_images/switch_lan_play/screenshot.png)

## 关于

要与您的 CFW Nintendo Switch 在线游戏，您可以使用此附加组件 + 一个公共或私人服务器。此附加组件可用于停止在桌面 PC / 笔记本电脑上运行 LAN Play 客户端。
这只是客户端软件，而不是服务器软件。要在 Homeassistant OS 中使用 LAN-Play 服务器，请查看我的其他附加组件：<https://github.com/FaserF/hassio-addons/switch_lan_play_server>

此 docker 镜像将自编译最新的 LAN-Play 软件，并根据您的架构运行。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
首次安装可能需要长达 10 分钟的时间，这取决于您的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装相当简单，与安装任何其他自定义 Home Assistant 附加组件没有不同。<br />
只需点击上面的链接或将我的代码库添加到 hassio 附加组件代码库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_记得在更改配置后重启附加组件。_

示例附加组件配置：

```yaml
server: switch.lan-play.com:11452
```

**注意**：_这只是一个示例，请不要复制和粘贴！创建您自己的！_

### 选项：`server`

此选项是必需的。请在此写下您希望连接的服务器，并添加端口。

**注意**：如果您将其留空，将会出现问题。

## 支持

有问题吗？

您可以 [在这里报告问题][issue] GitHub。
请记住，此软件仅在运行于 Raspberry Pi 4 的 armv7 上进行过测试。

## 作者与贡献者

原始程序来自 spacemeowx2。有关更多信息，请访问此 GitHub: <https://github.com/spacemeowx2/switch-lan-play>
此 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 FaserF 和 spacemeowx2

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，不受限制地处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售软件副本的权利，以及允许向其提供软件的人这样做，须遵循以下条件：

上述版权声明和此许可声明应包含在软件的所有副本或实质部分中。

软件是“按现状”提供的，不提供任何形式的明示或暗示的担保，包括但不限于对适销性、特定用途的适用性以及不侵权的担保。在任何情况下，作者或版权持有人对因使用或其他交易而引起的任何索赔、损害或其他责任，不论是在合同、侵权或其他方面，均不承担责任。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg