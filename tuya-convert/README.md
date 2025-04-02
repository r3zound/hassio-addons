# Home Assistant Community Add-on: Tuya-Convert
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Tuya-Convert for Homeassistant OS

## 关于

该工作已被弃用！
现在请不要使用！！！ 这是一个测试，似乎有效，但我无法保证任何事情！

一家名为 Tuya 的中国公司向任何人提供免费的品牌交钥匙智能家居解决方案。使用他们的服务非常简单，因为所有操作都可以通过点击 Tuya 网页完成，从选择预设计的产品或预编程的 wifi 模块（主要是 ESP8266）到构建自己的应用程序。最终，这导致他们声称有超过 11,000 个设备由超过 10,000 个供应商使用 Tuya 的固件和云服务“制造”。

除此之外，他们声称他们的云解决方案具有“军用级安全性”。德国 IT 安全创业公司 VTRUST 的创始人 Michael Steigerwald 能够驳斥这一说法，并在 35C3 莱比锡的“智能家居 - 智能黑客”演讲中展示了他的结果： <https://media.ccc.de/v/35c3-9723-smart_home_-_smart_hack>

在接下来的几天里，VTRUST 和德国科技杂志 c't 决定合作。由于使用 ESP8266/85 刷新设备在 DIY 智能家居爱好者中非常普遍，我们希望为每个人提供一种简单的方法，让他们无需电烙铁即可将设备从云中解放出来。

请务必访问 VTRUST（<https://www.vtrust.de/>），因为这种黑客攻击是他们的工作。

请优先使用 tuya-convert 的正常安装，而不是此 homeassistant-os 插件，因为砖化的风险可能更高。 <https://github.com/ct-Open-Source/tuya-convert>

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装相当简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_在更改配置时请记得重新启动插件。_

示例插件配置：

```yaml
backup_path: /share/tuya-convert
firmware: tasmota.bin
accept_eula: true
```

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项：`backup_path`

此选项是必需的。根据您的固件备份位置进行更改。

### 选项：`firmware`

此选项是必需的。根据您想要安装的自定义固件进行更改。您可以选择“tasmota.bin”和“espurna.bin”之间进行选择。

### 选项：`accept_eula`

此选项是必需的。软件只有在您将其设置为 true 时才会启动。您可以在此处阅读 tuya-convert 的 EULA 协议： <https://github.com/ct-Open-Source/tuya-convert/blob/master/scripts/setup_checks.sh#L18>

## 支持

有问题？

您可以在这里[打开一个问题][issue] GitHub。
请记住，该软件仅在 Raspberry Pi 4 上运行的 armv7 上进行测试。

## 作者和贡献者

原程序来自 @ct-Open-Source。如需更多信息，请访问此页面： <https://github.com/ct-Open-Source/tuya-convert>
hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2020 FaserF & ct-Open-Source

特此授予任何获得此软件及相关文档文件（“软件”）副本的人员免费使用的权限，无限制地处理该软件，包括但不限于使用、复制、修改、合并、发布、分发、再许可和/或出售该软件的副本，以及允许出让该软件的人这样做，需遵守以下条件：

上述版权声明和本许可声明应包含在该软件的所有副本或实质部分中。

该软件按“原样”提供，不提供任何形式的担保，无论明示或暗示，包括但不限于对商业性、特定用途适用性和不侵权的担保。在任何情况下，作者或版权持有人均不对因使用或其他交易而引起的任何索赔、损害或其他责任负责，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg