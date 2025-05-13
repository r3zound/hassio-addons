# Home Assistant Community Add-on: Tuya-Convert
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Tuya-Convert for Homeassistant OS

## 关于

工作已被停止支持！
请立即不要使用！！！这只是一个测试，似乎工作正常，但我不保证任何事情！

一家名为 Tuya 的中国公司向任何人提供免费的品牌智能家居解决方案。使用他们的服务非常简单，因为可以通过点击 Tuya 网页完成所有操作，从选择您预设计的产品或预编程的 wifi 模块（主要是 ESP8266）到构建自己的应用程序。最终，这使得他们声称超过 11,000 个设备是由超过 10,000 家供应商使用 Tuya 的固件和云服务 “制造”的。

除此之外，他们声称他们的云解决方案具有“军用级安全性”。德国 IT 安全初创公司 VTRUST 的创始人 Michael Steigerwald 能够驳斥这一说法，并在 35C3 莱比锡的“智能家居 - 智能黑客”演讲中展示了他的结果：<https://media.ccc.de/v/35c3-9723-smart_home_-_smart_hack>

在接下来的几天里，VTRUST 和德国科技杂志 c't 决定合作。由于使用 ESP8266/85 重新闪存设备在 DIY 智能家居爱好者中十分普遍，我们希望为每个人提供一种简单的方法，使他们无需焊接铁即可将设备从云中解放出来。

请务必访问 VTRUST（<https://www.vtrust.de/>），因为这项黑客工作是他们的成果。

请优先使用 tuya-convert 的正常安装，而不是这个 homeassistant-os 附加组件，因为砖化的风险可能更高。<https://github.com/ct-Open-Source/tuya-convert>

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该附加组件的安装非常简单，与安装其他自定义 Home Assistant 附加组件没有什么不同。<br />
只需点击链接或将我的 repo 添加到 hassio 附加组件库：<https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_请记得在更改配置时重新启动附加组件。_

附加组件配置示例：

```yaml
backup_path: /share/tuya-convert
firmware: tasmota.bin
accept_eula: true
```

**注意**：_这只是个例子，不要复制粘贴！请创建您自己的！_

### 选项: `backup_path`

这个选项是必需的。根据固件备份位置进行更改。

### 选项: `firmware`

这个选项是必需的。根据您要安装的自定义固件进行更改。您可以选择“tasmota.bin”或“espurna.bin”。

### 选项: `accept_eula`

这个选项是必需的。软件仅在您将其设置为 true 时才能启动。您可以在此处阅读 tuya-convert 的 EULA 协议：<https://github.com/ct-Open-Source/tuya-convert/blob/master/scripts/setup_checks.sh#L18>

## 支持

有问题吗？

您可以在这里[提交问题][issue] GitHub。
请记住，这个软件仅测试在 Raspberry Pi 4 上运行的 armv7。

## 作者和贡献者

原始程序来自 @ct-Open-Source。欲了解更多信息，请访问此页面：<https://github.com/ct-Open-Source/tuya-convert>
该 hassio 附加组件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权 (c) 2020 FaserF 和 ct-Open-Source

特此免费授予任何获得此软件及相关文档文件（“软件”）副本的人，在不受限制的情况下使用软件，包括但不限于使用、复制、修改、合并、出版、分发、再许可和/或出售软件副本的权利，并允许向其提供软件的人这样做，遵循以下条件：

上述版权声明和本许可声明应包含在软件的所有副本或重要部分中。

软件是按“原样”提供的，未提供任何形式的担保，无论是明示或暗示，包括但不限于对适销性、特定目的适用性和非侵权的担保。在任何情况下，作者或版权持有人不对因使用本软件或与本软件或其他交易有关的责任，承担任何索赔、损害或其他责任，无论是在合同、侵权或其他方面。

[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[FaserF]: https://github.com/FaserF/
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[issue]: https://github.com/FaserF/hassio-addons/issues
[maintenance-shield]: https://img.shields.io/maintenance/yes/2020.svg