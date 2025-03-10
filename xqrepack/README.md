# Home Assistant Community Add-on: xqrepack
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

xqrepack - 重新打包和重建 MiWifi 镜像以获得 SSH 访问和其他功能。

## 关于

这些脚本允许您修改小米 R3600 (AX3600) / rm1800 (AX1800) 固件镜像，以确保 SSH 和 UART 访问始终启用。

默认的 root 密码是 password。请记得在升级后登录路由器并更改密码。您的路由器设置，例如 IP 地址和 SSID，存储在 nvram 中，并应保持不变。

⚠ 此脚本还尽最大努力删除或禁用打电话的二进制文件，以及智能控制器 (AIoT) 部分，给您带来一个 (接近) OpenWRT 路由器，您可以通过 UCI 或 /etc/config 进行配置。在保留出厂功能和隐私问题之间，我宁愿谨慎行事，牺牲某些功能以获得一个我更有信心连接到互联网的路由器。

请注意，为了首次获得路由器的 SSH 访问，您需要先降级到版本 1.0.17 并进行利用。一旦您获得 SSH，您可以使用此重新打包方法维护新版本的 SSH 访问。<br />

请访问 @geekman 的这个程序的原始仓库: <https://github.com/geekman/xqrepack>

## 安装

[![FaserF Homeassistant 附加组件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
这个附加组件的安装非常简单，与安装其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 附加组件仓库: <https://github.com/FaserF/hassio-addons>

新的固件将在您的 "firmware_path" 文件夹中，名为 "r3600-raw-img.bin"

## 配置

**注意**: _在更改配置时请记得重启附加组件。_

附加组件配置示例：

### AX3600

```yaml
firmware_path: /share/miwifi_firmware/
firmware_name: miwifi_r3600_firmware_02d97_1.1.15.bin
```
<br />

### AX1800

```yaml
firmware_path: /share/miwifi_firmware/
firmware_name: miwifi_rm1800_firmware_df7e3_1.0.385.bin
```
<br />

**注意**: _这只是一个示例，不要复制粘贴！请创建您自己的！_

### 选项: `firmware_path`

此选项是必需的。根据您的固件文件夹的位置进行更改。<br />

注意: 必须在 /share 文件夹内！其他文件夹对该附加组件不可见。

### 选项: `firmware_name`

此选项是必需的。根据您的固件文件的名称进行更改。<br />
注意: 如果您使用 AX1800 的镜像，请在固件文件中保留名称 rm1800。这是必需的，因为 AX1800 的修改过程与 AX3600 不同！

## 支持

有问题或疑问吗？

您可以在这里 [提交问题][issue] 到 GitHub。<br />
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上进行了测试。

## 作者及贡献者

原始程序来自 @geekman。有关更多信息，请访问此页面: <https://github.com/geekman/xqrepack>
此 hassio 附加组件由 [FaserF] 提供。

## 许可证

xqrepack 根据 3-clause ("modified") BSD 许可证进行许可。

版权所有 (C) 2020-2023 Darell Tan / FaserF，针对 HA 附加组件

以源代码和二进制形式的再分发和使用，需满足以下条件：

源代码的再分发必须保留上述版权声明、此条件列表和以下免责声明。
二进制形式的再分发必须在分发时提供的文档和/或其他材料中重现上述版权声明、此条件列表和以下免责声明。
作者的名字不得用于支持或推广从该软件衍生的产品，除非获得具体的事先书面许可。
该软件由作者以 "原样" 提供，任何明示或暗示的担保，包括但不限于对适销性和特定用途的适用性均被否认。在任何情况下，作者均不对任何直接、间接、附带、特殊、示范或后果性损害（包括但不限于替代商品或服务的采购；使用、数据或利润的损失；或业务中断）承担责任，无论是由于合同、严格责任还是侵权（包括过失或其他原因）引起的，均不对因使用该软件而引起的任何责任进行承担，即使已被告知可能发生此类损害。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues