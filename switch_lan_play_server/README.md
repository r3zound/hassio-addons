# Home Assistant Community Add-on: Nintendo Switch LAN-Play Server
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 服务器

## 关于

要在线玩你的 CFW Nintendo Switch，你可以使用这个附加组件 + 一个公共或私有服务器。这个附加组件可以用来停止在台式电脑/笔记本电脑上运行 LAN Play 客户端。
这只是服务器软件，而不是客户端软件。要在 Homeassistant OS 上使用 LAN-Play 客户端，请查看我的其他附加组件：<https://github.com/FaserF/hassio-addons/switch_lan_play>

这个 docker 镜像将根据你的架构自我编译最新的 LAN-Play 软件。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
第一次启动可能会花费多达 10 分钟，这取决于你的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_记得在更改配置后重启附加组件。_

示例附加组件配置：

```yaml
username: mysecretuser
password: mysecretpw
```

**注意**：_这只是一个示例，不要复制和粘贴！创建你自己的！_

### 选项: `username`

此选项是可选的。如果你不设置用户名，则不会使用任何身份验证来连接到你的服务器。

### 选项: `password`

此选项是可选的。如果你不设置密码，则不会使用任何身份验证来连接到你的服务器。

**注意**：如果你将其留空，将会出现问题。

## Homeassistant 传感器
要获取一个 HA 传感器，显示在线人数和你服务器的版本属性，请在你的 configuration.yaml 中添加以下内容：

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

你可以在这里 [提交问题][issue] GitHub。
请记住，这个软件仅在运行于 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原程序来自 spacemeowx2。更多信息请访问这个 GitHub: <https://github.com/spacemeowx2/switch-lan-play>
这个 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2023 FaserF & spacemeowx2

特此授予任何获得该软件及相关文档文件（“软件”）副本的人，免费获得软件副本的使用权，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许提供软件的人这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，没有任何类型的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有者对因软件或使用或其他交易而引起的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg