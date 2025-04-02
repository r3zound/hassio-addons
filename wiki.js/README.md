# Home Assistant 社区插件: Wiki.js
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Wiki.js

## 关于

最强大和可扩展的开源 Wiki 软件。
使用 Wiki.js 美丽而直观的界面，让文档编写变得愉快！

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库： <https://github.com/FaserF/hassio-addons>

请确保已安装 MariaDB 插件！

## 配置

**注意**: _在配置更改时，请记得重启插件。_

插件配置示例：

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**: _这只是一个示例，请不要复制粘贴！请创建自己的！_

### 选项: `ssl`

启用/禁用网络界面的 SSL（HTTPS）。设置为 `true` 启用，设置为 `false` 否则。

如果您需要自签名证书，请查看我的 openssl 插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**: _文件必须存储在 `/ssl/` 中，这是默认设置_

### 选项: `reset_database`

启用以重置 pterodactyl 的数据库文件。请注意，此操作无法撤销！小心使用。

## 入口

该插件目前不完全支持入口！希望这个功能能尽快推出。

## 支持

有问题或疑问？

您可以在这里 [打开一个问题][issue] GitHub。
请记住，这款软件仅在 Raspberry Pi 4 上运行的 armv7 上经过测试。

## 作者与贡献者

原始程序来自 Requarks 团队 [NGPixel][NGPixel]。有关更多信息，请访问此页面： <https://github.com/Requarks/wiki>
此 hassio 插件由 [FaserF] 提供支持。

## 许可证

MIT 许可证

版权所有 (c) 2023 FaserF & Requarks

特此免费授予任何获得本软件及其相关文档文件（“软件”）副本的人使用本软件，不受限制，包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售本软件副本的权利，以及允许被提供本软件的人这样做，前提是遵守以下条件：

上述版权声明和本许可证声明应包含在本软件的所有副本或重要部分中。

本软件按“原样”提供，不设任何形式的担保，明示或暗示，包括但不限于对适销性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人对因使用本软件或其相关交易而产生的任何索赔、损害或其他责任不承担责任，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[NGPixel]: https://github.com/NGPixel