# Home Assistant Community Add-on: Nintendo Switch LAN-Play Client
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 客户端

![The Lan-Play Home Home Assistant Add-on](../_images/switch_lan_play/screenshot.png)

## 关于

要在您的 CFW Nintendo Switch 上在线游戏，您可以使用这个插件 + 一个公共或私有服务器。此插件可用于停止在桌面 PC / 笔记本电脑上运行 lan play 客户端。
这仅是客户端软件，而不是服务器软件。要在 Homeassistant OS 上使用 lan-play 服务器，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play_server>

此 Docker 镜像将自动编译最新的 lan-play 软件，并根据您的架构运行它。更多信息请参见此处：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
第一次安装可能需要最多 10 分钟，因为这个原因！这取决于您的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的库添加到 Hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_当配置更改时，请记得重启插件。_

示例插件配置：

```yaml
server: switch.lan-play.com:11452
```

**注意**：_这仅是示例，请不要复制和粘贴！创建您自己的！_

### 选项: `server`

此选项是必需的。请在此处写入您要连接的服务器，并添加端口。

**注意**：如果您将其留空，则会出现问题。

## 支持

有问题吗？

您可以在这里 [提交问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 spacemeowx2。有关更多信息，请访问该 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
Hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & spacemeowx2

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，处理该软件的权利，无限制地，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售该软件的副本，并允许向其提供软件的人这样做，须遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，无任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途的适用性和不侵权的担保。在任何情况下，作者或版权持有者均不对任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面，由于使用该软件或与该软件有关的任何其他交易而引起。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg