# Home Assistant Community Add-on: Nintendo Switch LAN-Play Server
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Nintendo Switch LAN-Play 服务器

## 关于

要在您的 CFW Nintendo Switch 上在线游戏，您可以使用这个插件 + 一个公共或私人服务器。这个插件可以用来停止在桌面 PC/笔记本上运行 LAN Play 客户端。
这只是服务器软件，而不是客户端软件。要在 Homeassistant OS 上使用 LAN-Play 客户端，请查看我的其他插件：<https://github.com/FaserF/hassio-addons/switch_lan_play>

此 Docker 镜像将根据您的架构自我编译最新的 LAN-Play 软件。更多信息可以在这里找到：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
首个启动可能需要长达 10 分钟，具体取决于您的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装相当简单，与安装其他自定义 Home Assistant 插件没有什么不同。<br />
只需单击上面的链接或将我的仓库添加到 Hassio 插件库：<https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_请记得在更改配置时重启插件。_

插件配置示例：

```yaml
username: mysecretuser
password: mysecretpw
```

**注意**：_这只是一个示例，请勿直接复制和粘贴！创建您自己的！_

### 选项：`username`

此选项是可选的。如果您不设置用户名，将不会使用身份验证连接到您的服务器。

### 选项：`password`

此选项是可选的。如果您不设置密码，将不会使用身份验证连接到您的服务器。

**注意**：如果您将此留空，将会出现问题。

## Homeassistant 传感器
要在您的服务器上获取一个带有在线人员当前数量和服务器版本属性的 HA 传感器，请在您的 configuration.yaml 中添加以下内容：

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

您可以在这里 [打开一个问题][issue] GitHub。
请记住，这个软件仅在 Raspberry Pi 4 上的 armv7 上经过测试。

## 作者与贡献者

原始程序来自 spacemeowx2。有关更多信息，请访问这个 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
这个 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2023 FaserF & spacemeowx2

特此授予任何获得本软件及相关文档文件（"软件"）副本的人，免费使用该软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件副本的权利，并允许提供该软件的人这样做，附带以下条件：

上述版权声明和本许可声明应包含在所有软件的副本或实质性部分中。

软件按 "原样" 提供，未给予任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途的适合性和不侵权的担保。在任何情况下，作者或版权持有人均不对因软件或软件的使用或其他交易而引起或与之相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他情况下。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg