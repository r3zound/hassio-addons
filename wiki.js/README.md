# Home Assistant Community Add-on: Wiki.js
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield]
![项目维护][maintenance-shield]

适用于 Homeassistant OS 的 Wiki.js

## 关于

最强大且可扩展的开源 Wiki 软件。
使用 Wiki.js 美丽直观的界面，让文档编写变得愉快！

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件仓库：<https://github.com/FaserF/hassio-addons>

请确保已安装 MariaDB 插件！

## 配置

**注意**：_更改配置后，请记得重启插件。_

示例插件配置：

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`ssl`

启用/禁用 Web 界面的 SSL（HTTPS）。设置为 `true` 以启用，`false` 则禁用。

如果您需要自签名证书，请查看我的 openssl 插件：<https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在 `/ssl/` 中，这是默认目录_

### 选项：`reset_database`

启用以重置 pterodactyl 的数据库文件。请注意，此操作无法撤销！请谨慎使用。

## 入口

此插件目前不完全支持入口！希望很快能实现。

## 支持

有问题或疑问？

您可以 [在此处提交问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上运行的 armv7 上经过测试。

## 作者与贡献者

原始程序来自 Requarks 团队 [NGPixel][NGPixel]。更多信息，请访问此页面：<https://github.com/Requarks/wiki>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2023 FaserF & Requarks

特此授予任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的条件下处理该软件的权利，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或销售该软件的副本的权利，并允许提供软件的人员在符合以下条件的情况下这样做：

以上版权声明和此许可声明应包含在软件的所有副本或重要部分中。

该软件按“原样”提供，不提供任何类型的担保，无论是明示还是暗示，包括但不限于对适销性、特定用途适用性和非侵权的担保。在任何情况下，作者或版权持有人均不对因使用、使用或其他交易软件而引起的任何索赔、损害或其他责任负责，无论是在合同诉讼、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[NGPixel]: https://github.com/NGPixel