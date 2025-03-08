# Home Assistant Community Add-on: xqrepack
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

xqrepack - 重新打包和重建 MiWifi 镜像以获取 SSH 访问权限和其他功能。

## 关于

这些脚本允许您修改小米 R3600 (AX3600) / rm1800 (AX1800) 固件镜像，以确保总是启用 SSH 和 UART 访问。

默认的 root 密码是 password。请记得在升级后登录路由器并更改此密码。您的路由器设置，如 IP 地址和 SSID，存储在 nvram 中，应该保持不变。

⚠ 脚本还尽力去移除或禁用电话回传的二进制文件，以及智能控制器 (AIoT) 组件，让您得到一个接近 OpenWRT 的路由器，可以通过 UCI 或 /etc/config 进行配置。在保留默认功能和隐私问题之间，我会倾向于谨慎处理，宁愿牺牲一些功能，以便获得一个我更放心连接互联网的路由器。

请注意，为了最初获取路由器的 SSH 访问权限，您需要先降级到 1.0.17 版本并进行利用。一旦获得 SSH，您可以使用此重新打包方法维护新版本的 SSH 访问权限。<br />

请访问 @geekman 本程序的原始仓库： <https://github.com/geekman/xqrepack>

## 安装

[![FaserF Homeassistant Addons](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
此插件的安装过程相当简单，与安装其他自定义 Home Assistant 插件没有区别。<br />
只需点击上面的链接或将我的仓库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

新的固件将位于您的 "firmware_path" 文件夹中，并将被称为 "r3600-raw-img.bin"

## 配置

**注意**：_更改配置时，请记得重新启动插件。_

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

**注意**：_这只是一个示例，不要复制和粘贴！创建您自己的！_

### 选项: `firmware_path`

此选项是必需的。根据您的固件文件夹的位置进行更改。<br />

注意：它必须在 /share 文件夹中！其他文件夹对该插件不可见。

### 选项: `firmware_name`

此选项是必需的。根据您的固件文件的名称进行更改。<br />
注意：如果您使用的是 AX1800 的镜像，请务必保留固件文件中的 rm1800 名称。这是必要的，因为 AX1800 的修改过程与 AX3600 不同！

## 支持

有问题或疑问？

您可以在这里 [提交问题][issue] GitHub。<br />
请记住，此软件仅在运行于 Raspberry Pi 4 的 armv7 上进行了测试。

## 作者和贡献者

原始程序来自 @geekman。有关更多信息，请访问此页面： <https://github.com/geekman/xqrepack>
该 hassio 插件由 [FaserF] 提供。

## 许可证

xqrepack 按照 3-clause ("modified") BSD 许可证发布。

版权所有 (C) 2020-2023 Darell Tan / FaserF for the HA Addon

允许在源代码和二进制形式中重新分发和使用，带或不带修改，前提是满足以下条件：

源代码的重新分发必须保留上述版权声明、此条件清单和以下免责声明。
以二进制形式重新分发必须在提供的文档和/或其他材料中重现上述版权声明、此条件清单和以下免责声明。
不得使用作者的姓名来支持或推广从此软件衍生的产品，未经具体的事先书面许可。
该软件由作者“按原样”提供，不对任何明示或暗示的担保，包括但不限于对商品适销性和特定用途适用性的暗示担保负责。在任何情况下，作者都不对任何直接、间接、附带、特殊、示范性或后果性损害（包括但不限于替代商品或服务的采购；使用、数据或利润的损失；或业务中断）承担责任，无论是因任何理论的责任，无论是在合同、严格责任或侵权（包括过失或其他方式）中产生，仅因使用该软件而导致，即使已被告知可能发生此类损害。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues