# Home Assistant Community Add-on: Freenom-DNS-Updater
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Homeassistant OS 的 Freenom DNS 更新器

## 关于

Freenom 是一个（免费）域名注册商提供商。这是基于 @maxisoft 的 [Freenom DNS Updater](https://github.com/maxisoft/Freenom-dns-updater) 的工作而创建的 Docker 镜像。<br />
完整的功能列表可以在那里找到。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
安装此插件非常简单，与安装任何其他自定义 Home Assistant 插件没有不同。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库： <https://github.com/FaserF/hassio-addons>

将您的配置文件放在 /share 的某个地方<br />

## 配置

**注意**: _更改配置后，请记得重启插件。_

示例插件配置：

```yaml
config_file: /share/freenom.yaml
update_time_in_seconds: 86400
```

**注意**: _这只是一个示例，不要直接复制和粘贴！请创建您自己的！_

### 选项: `config_file`

此选项是必需的。根据您 Homeassistant 安装中配置文件的位置进行更改。

**注意**: _它必须位于 `/share/` 文件夹中的某个地方！其他文件夹对该插件不可见。_

### 选项: `update_time_in_seconds`

输入更新应该进行的时间（续订域名、续订 IP 地址等）的秒数。

## 支持

有问题或疑问？

您可以在 [这里提交问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 版本中经过测试。

## 作者 & 贡献者

原始程序来自 maxisoft。如需更多信息，请访问此页面： <https://github.com/maxisoft/Freenom-dns-updater>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2019-2023 FaserF & maxisoft

特此授予任何获得此软件及相关文档文件（“软件”）副本的人免费使用该软件的权限，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件副本的权利，并允许向其提供该软件的人员也这样做，受以下条件的限制：

上述版权声明和本许可声明应包含在所有副本或软件的重要部分中。

该软件是“按原样”提供的，没有任何形式的保证，无论是明示的还是暗示的，包括但不限于对适销性、特定用途适用性和不侵权的保证。在任何情况下，作者或版权持有人对此软件或使用或其他交易中产生的任何索赔、损害或其他责任不承担责任，无论是基于合同、侵权或其他。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues