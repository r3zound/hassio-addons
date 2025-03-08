# Home Assistant 插件：Frigate（完全访问）测试版

请参阅[发布说明](https://github.com/blakeblackshear/frigate/releases)以获取重大更改信息。

![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armv7 架构][armv7-shield]

具有实时本地对象检测功能的NVR，用于IP摄像头。

您必须在 Home Assistant 配置目录的根目录下创建一个名为 `frigate.yml` 的配置文件。

该版本的插件请求完全设备访问权限，以便关闭保护模式，对于那些在启用保护模式时无法正常工作的设备。

[文档](https://docs.frigate.video)

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg