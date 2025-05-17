# Home Assistant Community Add-on: Nintendo Switch LAN-Play Server
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

用于 Homeassistant OS 的 Nintendo Switch LAN-Play 服务器

## 关于

要在线玩您的 CFW Nintendo Switch，您可以使用这个插件 + 一个公共或私人服务器。这个插件可以用来停止在桌面 PC/笔记本电脑上运行 LAN Play 客户端。
这只是服务器软件，而不是客户端软件。要在 Homeassistant OS 上使用 LAN-Play 客户端，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play>

这个 docker 镜像将自我编译最新的 LAN-Play 软件，并根据您的架构运行它。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
第一次启动可能需要多达 10 分钟，具体取决于您的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库中： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_更改配置后，请记得重启插件。_

示例插件配置：

```yaml
username: mysecretuser
password: mysecretpw
```

**注意**：_这只是一个示例，别复制粘贴！创建您自己的！_

### 选项：`username`

此选项是可选的。如果您不设置用户名，将不会使用身份验证连接到您的服务器。

### 选项：`password`

此选项是可选的。如果您不设置密码，将不会使用身份验证连接到您的服务器。

**注意**：如果您留空，将会出现问题。

## Homeassistant 传感器
要获取一个 HA 传感器，显示当前在线的人数和服务器版本的属性，请在您的 configuration.yaml 中添加以下内容

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

您可以 [在这里打开一个问题][issue] GitHub。
请记住，这个软件只在 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 spacemeowx2。有关更多信息，请访问此 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2025 FaserF & spacemeowx2

特此免费授权任何获得本软件及相关文档文件（“软件”）副本的人，不受限制地处理该软件，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或出售该软件的副本，并允许软件的供应者为此所做的事情，受以下条件的约束：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，未经任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适用性和不侵权的保证。在任何情况下，作者或版权持有人对任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面，均因使用或其他与本软件有关的交易而产生的。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg