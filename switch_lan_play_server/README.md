# Home Assistant Community Add-on: Nintendo Switch LAN-Play 服务器
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

用于 Homeassistant OS 的 Nintendo Switch LAN-Play 服务器

## 关于

要在您的 CFW Nintendo Switch 上进行在线游戏，您可以使用此附加组件 + 公开或私有服务器。此附加组件可以用于停止在桌面 PC/笔记本电脑上运行局域网游戏客户端。
这只是服务器软件，而不是客户端软件。要在 Homeassistant OS 中使用局域网游戏客户端，请查看我的其他附加组件：<https://github.com/FaserF/hassio-addons/switch_lan_play>

此 Docker 镜像将根据您的架构自我编译最新的局域网游戏软件。有关更多信息，请查看此处：<https://drive.google.com/file/d/1A_4o8HCAfDBFsePcGL3utG-LfzMUovcx/view>
首次启动可能需要长达 10 分钟，因为这一点！具体取决于您的硬件。

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 附加组件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_更改配置时，请记得重新启动附加组件。_

附加组件配置示例：

```yaml
username: mysecretuser
password: mysecretpw
```

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项：`username`

此选项是可选的。如果您不设置用户名，则连接到服务器时将不使用身份验证。

### 选项：`password`

此选项是可选的。如果您不设置密码，则连接到服务器时将不使用身份验证。

**注意**：如果您将此项留空，将会出现问题。

## Homeassistant 传感器
要获取一个 HA 传感器，该传感器显示在线人员的当前数量及服务器版本的属性，请在您的 configuration.yaml 中添加以下内容：

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
请记住，此软件仅在 Raspberry Pi 4 上运行 armv7 进行了测试。

## 作者和贡献者

原始程序来自 spacemeowx2。获取更多信息请访问此 GitHub：<https://github.com/spacemeowx2/switch-lan-play>
此 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2023 FaserF 和 spacemeowx2

特此授予任何获取本软件及相关文档文件（简称“软件”）副本的人免费的权利，无限制地处理软件，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售软件副本的权利，以及允许向其提供软件的人员这样做，需遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或实质部分中。

该软件按“原样”提供，不提供任何种类的明示或暗示的担保，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用该软件或与软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg