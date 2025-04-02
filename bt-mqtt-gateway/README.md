# Home Assistant Community Add-on: Bluetooth-MQTT-Gateway
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

# 项目已被原作者弃用，因此此插件不会收到新功能
请查看 [这里](https://github.com/zewelor/bt-mqtt-gateway)，建议使用 Bluetooth Proxy。

Bluetooth-MQTT-Gateway for Homeassistant OS

## 关于

一个简单的 Python 脚本，提供蓝牙到 MQTT 的网关，可通过自定义工作者轻松扩展。
请查看 [Wiki](https://github.com/zewelor/bt-mqtt-gateway/wiki) 获取更多信息（支持的设备、功能等）。

这可以用来提高蓝牙温控器的可靠性。有关更多信息，请参见 <https://github.com/home-assistant/core/issues/28601>。

## 安装

此附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。
只需将我的库添加到 hassio 附加组件库中： <https://github.com/FaserF/hassio-addons>

将您的配置文件放到 /share/bt-mqtt-gateway.yaml
请确保已经安装了 MQTT 附加组件。

## 配置

**注意**：_配置更改时请记得重启附加组件。_
到目前为止，这些配置选项并没有任何作用！它们尚未实现，但已计划中！！！

附加组件配置示例：

```yaml
config_path: /share/bt-mqtt-gateway.yaml
debug: true
```

**注意**：_这只是一个示例，请勿复制粘贴！创建您自己的！_

### 选项: `config_path`

这个选项是必需的。根据您的配置文件在 homeassistant 安装的位置进行更改。

### 选项: `debug`

将此选项设置为 "true" 将以调试模式启动附加组件。默认值：false
-> 要启用调试模式，请在 /share/bt-mqtt-gateway-debug.txt 创建一个空文件。

## 支持

有问题吗？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，此软件仅在 armv7 上的 Raspberry Pi 4 上进行了测试。

## 作者与贡献者

原始程序来自 @zewelor。有关更多信息，请访问此页面： <https://github.com/zewelor/bt-mqtt-gateway>
hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有（c）2022 FaserF & zewelor

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，有权在没有限制的情况下处理软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，前提是遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

该软件是按“原样”提供的，没有任何种类的保证，无论是明示或暗示，包括但不限于对适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有人对于因使用本软件或与软件或其他交易相关的任何索赔、损害或其他责任（无论是在合同、侵权或其他行为中）不承担责任。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/no/2024.svg