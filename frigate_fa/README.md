# Home Assistant 插件：Frigate（完全访问）

请参考 [发行说明](https://github.com/blakeblackshear/frigate/releases) 获取重大更改的信息。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armv7 架构][armv7-shield]

具有实时本地对象检测的 NVR，适用于 IP 摄像头。

您必须在 Home Assistant 配置目录的根目录中创建一个配置文件，命名为 `frigate.yml`。

此版本的插件请求完全设备访问，以便关闭保护模式，以支持那些在启用保护模式时无法工作的设备。

[文档](https://docs.frigate.video)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg