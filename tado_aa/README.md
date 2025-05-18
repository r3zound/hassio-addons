# Home Assistant Community Add-on: Tado自动助手用于地理围栏和开窗检测
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Tado自动助手用于Home Assistant OS的地理围栏和开窗检测

## 关于

一个Python脚本，根据您在家中的存在（到达或离开），自动调整家中的温度，使用您在Tado应用中的设置。它还会在Tado TRV检测到开窗时，关闭加热（激活开窗模式）在任何房间内。

## 安装

[![FaserF Home Assistant Add-ons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)

这个插件的安装非常简单，类似于安装任何其他自定义Home Assistant插件。
只需点击上面的链接，或手动将此存储库添加到您的Home Assistant插件存储库中：
<https://github.com/FaserF/hassio-addons>

## 配置

插件配置示例：

```yaml
username: my@email.com
password: mySecretPassword
minTemp: 5       # 可选 – 设置的最小温度
maxTemp: 25      # 可选 – 设置的最大温度
```

> **注意**：_这只是一个示例。请使用您自己的凭据和所需的温度设置。_

### 选项: `username`

定义您的Tado用户名（通常是您的电子邮件地址）。

### 选项: `password`

定义您的Tado密码。

### 选项: `minTemp`

可选。定义您不在家时Tado应该设置的最小温度。

### 选项: `maxTemp`

可选。定义您回家时Tado应该设置的最大温度。

## 支持

有问题或疑问？
如果您遇到任何问题或有建议，可以在[Github上打开一个问题][issue]。

⚠️ **请注意**：此插件仅在 `armv7` （树莓派4）上测试过。

## 致谢

此插件基于[adrianslabu] 的工作，他创建了原始Python脚本：
➡️ <https://github.com/adrianslabu/tado_aa>

Home Assistant插件包装器由[FaserF]创建并维护。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2025.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[adrianslabu]: https://github.com/adrianslabu