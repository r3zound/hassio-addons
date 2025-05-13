# Home Assistant Community Add-on: Bluetooth-MQTT-Gateway
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

# 项目已由原作者弃用，因此此插件将不再收到新功能
请查看 [这里](https://github.com/zewelor/bt-mqtt-gateway)，建议使用 Bluetooth Proxy。

Bluetooth-MQTT-Gateway for Homeassistant OS

## 关于

一个简单的 Python 脚本，提供 Bluetooth 到 MQTT 网关，可以通过自定义工作者轻松扩展。
有关更多信息（支持的设备、功能等），请参见 [Wiki](https://github.com/zewelor/bt-mqtt-gateway/wiki)。

这可以用来提高蓝牙恒温器的可靠性。有关更多信息，请参见 <https://github.com/home-assistant/core/issues/28601>。

## 安装

此插件的安装相当简单，比较其他自定义 Home Assistant 插件没有区别。
只需将我的仓库添加到 hassio 插件库：<https://github.com/FaserF/hassio-addons>

将你的配置文件放入 /share/bt-mqtt-gateway.yaml
请确保已安装 MQTT 插件。

## 配置

**注意**：_更改配置时，请记得重启插件。_
截至目前，这些配置选项没有任何作用！它们尚未实现，但计划中！！！

插件配置示例：

```yaml
config_path: /share/bt-mqtt-gateway.yaml
debug: true
```

**注意**：_这只是一个示例，请勿复制粘贴！请自己创建！_

### 选项：`config_path`

此选项是必需的。根据你在 homeassistant 安装中的配置文件位置进行更改。

### 选项：`debug`

将此选项设置为“true”将以调试模式启动插件。默认值：false
-> 要启用调试模式，请在 /share/bt-mqtt-gateway-debug.txt 创建一个空文件。

## 支持

有问题吗？

你可以在 [这里][issue] 打开一个问题，GitHub。
请记住，这个软件仅在运行 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 @zewelor。有关更多信息，请访问此页面：<https://github.com/zewelor/bt-mqtt-gateway>
hassio 插件由 [FaserF] 提供。

## 许可

MIT 许可证

版权所有 (c) 2022 FaserF & zewelor

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，使用、复制、修改、合并、发布、分发、再授权和/或出售该软件副本的权利，并允许提供软件的人这样做，条件如下：

上述版权声明和此许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，不附任何种类的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用软件或其他交易而产生的任何索赔、损害或其他责任承担责任，无论是在合同、侵权还是其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/no/2024.svg