# Home Assistant 插件：TellStick

> [!CAUTION]
> **弃用通知**
> 本插件依赖的库已经被放弃。其最后的活动是在 5 年前，并且无法在 3.15 以上的 Alpine 版本上构建。用户可以继续使用该插件，但将不接受任何问题或拉取请求。

TellStick 和 TellStick Duo 服务。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]

## 关于

此插件封装了 `telldus-core` 包，以提供您的 TellStick 和 TellStick Duo 的服务。

此集成允许用户添加与 433 MHz 通信的开关、灯光和传感器。有许多供应商（Capidi Elro、Intertechno、Nexa、Proove、Sartano 和 Viking）销售与 TellStick 兼容的产品。

欲了解更多详细信息，请查看 TellStick [协议列表][protocol-list]。


[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg