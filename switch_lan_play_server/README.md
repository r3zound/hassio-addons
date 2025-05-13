# Home Assistant Community Add-on: Nintendo Switch LAN-Play Server
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 服务器

## 关于

要在线玩你的 CFW Nintendo Switch，你可以使用这个插件 + 一个公共或私人服务器。这个插件可以用来停止在桌面电脑/笔记本上运行 LAN Play 客户端。
这只是服务器软件而不是客户端软件。要在 Homeassistant OS 上使用 LAN-Play 客户端，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play>

这个 Docker 镜像将自主编译最新的 LAN-Play 软件并根据你的架构运行。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
第一次启动可能需要多达 10 分钟，因为这一点！这取决于你的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装过程非常简单，与安装其他自定义 Home Assistant 插件没有什么不同。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_请记得在更改配置时重启插件。_

示例插件配置：

```yaml
username: mysecretuser
password: mysecretpw
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建你自己的！_

### 选项：`username`

这个选项是可选的。如果你不设置用户名，则将不使用身份验证来连接到你的服务器。

### 选项：`password`

这个选项是可选的。如果你不设置密码，则将不使用身份验证来连接到你的服务器。

**注意**：如果你将其留空，会出现问题。

## Homeassistant 传感器
要获取一个 HA 传感器，显示在线人员的当前数量和服务器版本的属性，请在你的 configuration.yaml 中添加以下内容：

```yaml
sensor:
  - platform: rest
    name: Switch LAN-Play Online
    resource: http://{YOUR_SERVER_IP}:11451/info
    method: GET
    unit_of_measurement: people
    json_attributes:
      - version
    value_template: "{{value_json.online}}"
```

## 支持

有问题吗？

你可以在这里 [提出问题][issue] GitHub。
请记住，这个软件仅在运行 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原程序来自 spacemeowx2。有关更多信息，请访问这个 GitHub： <https://github.com/spacemeowx2/switch-lan-play>
这个 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & spacemeowx2

特此免费授权任何获取本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许提供软件的人这样做，前提是满足以下条件：

上述版权声明和本许可声明应包含在所有软件副本或实质性部分中。

软件按“原样”提供，没有任何形式的保证，明示或暗示，包括但不限于对适销性、特定用途的适用性和非侵权的保证。在任何情况下，作者或版权持有者对因使用或其他交易该软件或与软件相关的事项而产生的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg