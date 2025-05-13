# Home Assistant Community Add-on: Wiki.js
![支持aarch64架构][aarch64-shield] ![支持amd64架构][amd64-shield] ![支持armhf架构][armhf-shield] ![支持armv7架构][armv7-shield]
![项目维护][maintenance-shield]

Homeassistant操作系统上的Wiki.js

## 关于

最强大且可扩展的开源Wiki软件。
使用Wiki.js美丽而直观的界面，让文档写作变得轻松愉快！

## 安装

[![FaserF Homeassistant插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装非常简单，与安装其他自定义Home Assistant插件没有区别。<br />
只需单击上述链接或将我的库添加到hassio插件库： <https://github.com/FaserF/hassio-addons>

请确保已安装MariaDB插件！

## 配置

**注意**：_更改配置时记得重启插件。_

示例插件配置：

```yaml
ssl: true
certfile: fullchain.pem
keyfile: privkey.pem
```

**注意**：_这只是一个示例，请不要复制粘贴！请创建您自己的！_

### 选项: `ssl`

启用/禁用Web界面的SSL（HTTPS）。设置为`true`以启用，设置为`false`以禁用。

如果您需要自签名证书，请查看我的openssl插件： <https://github.com/FaserF/hassio-addons/tree/master/openssl>

**注意**：_文件必须存储在`/ssl/`中，这是默认路径_

### 选项: `reset_database`

启用此选项以重置pterodactyl的数据库文件。请注意，此操作无法撤消！请谨慎使用。

## Ingress

此插件当前不完全支持Ingress！希望很快会有这个功能。

## 支持

有问题或疑问？

您可以在[这里打开一个问题][issue] GitHub。
请记住，该软件仅在运行于Raspberry Pi 4的armv7上进行了测试。

## 作者和贡献者

原始程序来自Requarks团队 [NGPixel][NGPixel]。有关更多信息，请访问此页面： <https://github.com/Requarks/wiki>
该hassio插件由[FaserF]为您提供。

## 许可证

MIT许可证

版权所有 (c) 2023 FaserF & Requarks

特此授予任何获得该软件及其相关文档文件（“软件”）副本的人，免费使用软件的权利，进行包括但不限于使用、复制、修改、合并、出版、分发、再授权和/或销售软件副本的权利，并允许向其提供软件的人这样做，条件如下：

上述版权声明和本许可声明应包含在软件的所有副本或实质性部分中。

该软件按“原样”提供，未作任何种类的明示或暗示的保证，包括但不限于对适销性、特定目的适用性和不侵权的保证。在任何情况下，作者或版权持有人均不对因使用该软件或与该软件的使用或其他交易相关的任何索赔、损害或其他责任承担责任，无论是在合同、侵权或其他方面。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2024.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues
[NGPixel]: https://github.com/NGPixel