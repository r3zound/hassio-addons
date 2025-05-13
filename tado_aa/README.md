# Home Assistant Community Add-on: Tado Auto-Assist 用于地理围栏和开窗检测
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Tado Auto-Assist 用于 Homeassistant OS 的地理围栏和开窗检测

## 关于

一个 python 脚本，根据您在 tado 应用中的设置，自动调整您家中的温度，在离开或到达时，并在 tado TRV 检测到开窗时自动关闭加热（激活开窗模式）。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_更改配置时，请记得重新启动插件。_

示例插件配置：

```yaml
username: my@email.com
password: mySecretPassword
minTemp: 5
maxTemp: 25
```

**注意**：_这只是一个示例，请不要直接复制粘贴！请创建您自己的！_

### 选项： `username`

定义您的 tado 用户名（通常是您的电子邮件地址）。

### 选项： `password`

定义您的 tado 密码。

### 选项： `minTemp`

定义 tado 应该设置的最低温度。（可选）

### 选项： `maxTemp`

定义 tado 应该设置的最高温度。（可选）

## 支持

有问题或疑问？

您可以在这里 [打开一个问题][issue] Github。
请注意，此软件仅在 Raspberry Pi 4 上运行的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 [adrianslabu]。有关更多信息，请访问此页面： <https://github.com/adrianslabu/tado_aa>
此 hassio 插件由 [FaserF] 提供。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[adrianslabu]: https://github.com/adrianslabu