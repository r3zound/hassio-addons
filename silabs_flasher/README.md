# Home Assistant 附加组件：Silicon Labs Flasher 附加组件

Silicon Labs Flasher 附加组件用于闪存基于 Silicon Labs 的无线电。

默认情况下，该附加组件会闪存固件以使用 Zigbee（Silicon Labs EmberZNet Zigbee 堆栈）。

**注意：** 确保没有其他附加组件或集成正在使用无线电。特别是禁用 Zigbee 家庭自动化集成和 Silicon Labs 多协议附加组件。

![支持 aarch64 架构][aarch64-shield]
![支持 amd64 架构][amd64-shield]
![支持 armhf 架构][armhf-shield]
![支持 armv7 架构][armv7-shield]
![支持 i386 架构][i386-shield]

## 关于

此附加组件允许您使用 Gecko Bootloader 文件格式（gbl）闪存固件。默认情况下，它附带用于 Home Assistant SkyConnect/ZBT-1 和 Home Assistant Yellow 的固件以闪存 Zigbee。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg