# Home Assistant 社区插件：Wiki.js
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Wiki.js for Homeassistant OS

## 关于

最强大且可扩展的开源 Wiki 软件。
使用 Wiki.js 的优美和直观的界面，使文档编写变得愉快！

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他任何自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

请确保已安装 MariaDB 插件！

## 配置

**注意**：_记得在配置更改时重新启动插件。_

示例插件配置：

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这仅仅是一个示例，请不要复制粘贴！创建你自己的！_

### 选项：`ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。将其设置为 `true` 以启用，其他情况设置为 `false`。

如果您需要自签名证书，请查看我的 openssl 插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认位置_

### 选项：`reset_database`

启用重置 pterodactyl 的数据库文件。请注意，此操作无法撤销！请谨慎使用。

## Ingress

此插件当前不完全支持 ingress！希望很快就会支持。

## 支持

有问题或疑问？

您可以 [在这里打开一个问题][issue] GitHub。
请记住，此软件仅在运行于 Raspberry Pi 4 的 armv7 上进行测试。

## 作者与贡献者

原程序来自 Requarks 团队 [NGPixel][NGPixel]。有关更多信息，请访问此页面： <https://github.com/Requarks/wiki>
hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2023 FaserF & Requarks

特此免费授予任何获取本软件及相关文档文件（“软件”）副本的人，使用软件的权利，无限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许提供软件的人员这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有软件副本或重要部分中。

本软件以 “原样” 提供，不附任何类型的担保，明示或暗示，包括但不限于适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人对因使用软件或与软件的使用或其他交易有关的任何索赔、损害或其他责任不承担责任，无论是在合同诉讼、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[NGPixel]: https://github.com/NGPixel