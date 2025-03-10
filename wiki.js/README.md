# Home Assistant Community Add-on: Wiki.js
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Wiki.js

## 关于

最强大且可扩展的开源 Wiki 软件。
使用 Wiki.js 美丽直观的界面，让文档编写变得轻松愉快！

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 附加组件存储库： <https://github.com/FaserF/hassio-addons>

请确保 MariaDB 附加组件已安装！

## 配置

**注意**： _记得在更改配置后重新启动附加组件。_

示例附加组件配置：

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**： _这只是一个示例，切勿直接复制粘贴！请创建你自己的！_

### 选项: `ssl`

在Web界面上启用/禁用 SSL（HTTPS）。设置为 `true` 以启用，其他情况设置为 `false`。

如果需要自签名证书，请查看我的 openssl 附加组件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**： _文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `reset_database`

启用此选项以重置 pterodactyl 的数据库文件。请注意，此操作无法撤消！请谨慎使用。

## Ingress

该附加组件目前不完全支持 ingress！希望很快会有支持。

## 支持

有问题或疑问吗？

你可以在 [这里打开一个问题][issue] GitHub。
请记住，该软件仅在运行于 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者与贡献者

原始程序来自 Requarks 团队 [NGPixel][NGPixel]。有关更多信息，请访问此页面： <https://github.com/Requarks/wiki>
该 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2023 FaserF & Requarks

特此授权，免费地向任何获得该软件及其相关文档文件（以下简称“软件”）副本的人，处理软件时不受限制，包括但不限于以下权利：使用、复制、修改、合并、发布、分发、再授权和/或出售软件的副本，并允许提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

软件是按“原样”提供的，不作任何形式的担保，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他情况下。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[NGPixel]: https://github.com/NGPixel