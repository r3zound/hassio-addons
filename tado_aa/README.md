# Home Assistant Community Add-on: Tado 自动助手用于地理围栏和开窗检测
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Tado 自动助手用于地理围栏和开窗检测，适用于 Homeassistant OS

## 关于

一个 Python 脚本，基于您在 tado 应用中的设置，自动调整您家的温度，在离开或到达时，并在 tado TRV 检测到开窗时，自动关闭加热（激活开窗模式）。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库: <https://github.com/FaserF/hassio-addons>

## 配置

**注意**: _记得在更改配置后重启插件。_

示例插件配置：

```yaml
username: my@email.com
password: mySecretPassword
minTemp: 5
maxTemp: 25
```

**注意**: _这只是一个示例，切勿复制粘贴！请创建您自己的！_

### 选项: `username`

定义您的 tado 用户名（通常是您的电子邮件地址）。

### 选项: `password`

定义您的 tado 密码。

### 选项: `minTemp`

定义 Tado 应设置的最低温度。（可选）

### 选项: `maxTemp`

定义 Tado 应设置的最高温度。（可选）

## 支持

有问题或疑问？

您可以在此处 [报告问题][issue] 到 GitHub。
请记住，这个软件仅在 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者 & 贡献者

原始程序来自 [adrianslabu]。有关更多信息，请访问此页面: <https://github.com/adrianslabu/tado_aa>
该 hassio 插件由 [FaserF] 带给您。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[adrianslabu]: https://github.com/adrianslabu