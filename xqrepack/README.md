# Home Assistant Community Add-on: xqrepack
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

xqrepack - 重新打包和重建 MiWifi 镜像以获得 SSH 访问和其他功能。

## 关于

这些脚本允许您修改小米 R3600 (AX3600) / rm1800 (AX1800) 固件镜像，以确保 SSH 和 UART 访问始终启用。

默认的 root 密码是 password。请在升级后记得登录路由器并更改该密码。您的路由器设置，如 IP 地址和 SSID 存储在 nvram 中，应该保持不变。

⚠ 该脚本还尽最大努力删除或禁用电话归属二进制文件，以及智能控制器 (AIoT) 部分，让您拥有一个 (接近) OpenWRT 的路由器，您可以通过 UCI 或 /etc/config 进行配置。在保留原始功能和隐私问题之间，我倾向于谨慎行事，宁愿牺牲一些功能，以换取一个我更有信心连接互联网的路由器。

请注意，为了最初获得对路由器的 SSH 访问，您需要降级到版本 1.0.17 并先进行利用。一旦您获得 SSH，您可以使用此重新打包方法来维护较新版本的 SSH 访问。<br />

请访问 @geekman 原始的这个程序仓库： <https://github.com/geekman/xqrepack>

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装非常简单，与安装任何其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件仓库： <https://github.com/FaserF/hassio-addons>

新的固件将位于您的 "firmware_path" 文件夹中，并将命名为 "r3600-raw-img.bin"

## 配置

**注意**：_更改配置时，请记得重启插件。_

示例插件配置：

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

**注意**：_这只是一个示例，请不要复制粘贴！创建您自己的！_

### 选项： `firmware_path`

此选项是必需的。根据固件文件夹的位置进行更改。<br />

注意：它必须位于 /share 文件夹中的某个位置！其他文件夹对该插件不可见。

### 选项： `firmware_name`

此选项是必需的。根据固件文件的名称进行更改。<br />
注意：如果您使用的是 AX1800 的镜像，请确保固件文件中保留名称 rm1800。这是必需的，因为 AX1800 的修改过程与 AX3600 不同！

## 支持

有问题或疑问？

您可以 [在这里报告问题][issue] GitHub。<br />
请记住，该软件仅在 Raspberry Pi 4 上的 armv7 上进行测试。

## 作者与贡献者

原程序来自 @geekman。有关更多信息，请访问此页面： <https://github.com/geekman/xqrepack>
该 hassio 插件由 [FaserF] 提供。

## 许可证

xqrepack 根据 3-clause (“modified”) BSD 许可证发行。

版权所有 (C) 2020-2023 Darell Tan / FaserF for the HA Addon

在源代码和二进制形式中的再发布和使用，在未修改的情况下是允许的，前提是满足以下条件：

源代码的再发布必须保留上述版权声明、该条件列表和以下免责声明。
二进制形式的再发布必须在随分发的文档和/或其他材料中重现上述版权声明、该条件列表和以下免责声明。
作者的名称不得用于支持或推广基于该软件的产品，除非事先获得特定的书面许可。
该软件是由作者 "按原样" 提供的，任何明示或暗示的保证，包括但不限于对适销性和特定用途适用性的暗示保证均不予保证。在任何情况下，作者对任何直接、间接、偶然、特别、典型或后果性的损害（包括但不限于替代商品或服务的采购；使用、数据或利润的损失；或业务中断）不承担责任，无论因何种原因以及基于任何责任理论，无论是合同、严格责任还是侵权（包括过失或其他）引起的，使用该软件时，即使已被告知可能会有此类损害的可能性。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues