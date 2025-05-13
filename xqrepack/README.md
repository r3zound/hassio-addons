# Home Assistant Community Add-on: xqrepack
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

xqrepack - 重新打包和重建 MiWifi 镜像以获得 SSH 访问权限和其他功能。

## 关于

这些脚本允许您修改小米 R3600 (AX3600) / rm1800 (AX1800) 固件镜像，以确保始终启用 SSH 和 UART 访问。

默认的 root 密码是 password。请记得在升级后登录路由器并更改该密码。您的路由器设置，如 IP 地址和 SSID 存储在 nvram 中，应该保持不变。

⚠ 该脚本也尽力移除或禁用电话回家二进制文件，以及智能控制器 (AIoT) 部分，给您留下一个 (接近) OpenWRT 的路由器，您可以通过 UCI 或 /etc/config 进行配置。在保留原有功能和隐私问题之间，我倾向于谨慎行事，宁愿牺牲某些功能，以获得我更有信心连接互联网的路由器。

请注意，要初始获得 SSH 访问权，您需要降级至版本 1.0.17 并首先利用它。一旦您获得了 SSH，您可以使用此重新打包方法来维护新版本的 SSH 访问。<br />

请访问 @geekman 的原始程序库： <https://github.com/geekman/xqrepack>

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该附加组件的安装非常简单，与安装任何其他自定义 Home Assistant 附加组件没有区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库： <https://github.com/FaserF/hassio-addons>

新的固件将位于您的 "firmware_path" 文件夹中，并将命名为 "r3600-raw-img.bin"

## 配置

**注意**：_记得在更改配置时重新启动附加组件。_

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

**注意**：_这只是一个示例，别复制和粘贴！创建你自己的！_

### 选项: `firmware_path`

此选项是必需的。根据您的固件文件夹位置进行更改。<br />

注意：它必须位于 /share 文件夹中的某个地方！其他文件夹对该附加组件不可见。

### 选项: `firmware_name`

此选项是必需的。根据您的固件文件名进行更改。<br />
注意：请在固件文件中保留名称 rm1800，如果您使用的是 AX1800 的镜像。这是必要的，因为 AX1800 的修改过程与 AX3600 不同！

## 支持

有问题或疑问吗？

您可以 [在这里提出问题][issue] GitHub。<br />
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 上经过测试。

## 作者和贡献者

原始程序来自 @geekman。有关更多信息，请访问此页面： <https://github.com/geekman/xqrepack>
该 hassio 插件由 [FaserF] 提供。

## 许可证

xqrepack 根据 3 条款 ("修改后的") BSD 许可证获得许可。

版权 (C) 2020-2023 Darell Tan / FaserF for the HA Addon

允许以源代码和二进制形式的再分发和使用，带或不带修改，前提是满足以下条件：

源代码的再分发必须保留上述版权声明、条件列表和以下免责声明。
以二进制形式的再分发必须在分发中提供的文档和/或其他材料中重现上述版权声明、条件列表和以下免责声明。
作者的姓名不得用于支持或推广从该软件衍生的产品，未经特定的书面许可。
本软件是“按原样”提供的，作者对任何明示或暗示的担保，不包括但不限于对适销性和特定用途的默示担保不承担责任。在任何情况下，作者均不对因使用本软件而导致的任何直接、间接、偶然、特殊、示范或后果性损害承担责任（包括但不限于替代商品或服务的采购；使用、数据或利润的丧失；或业务中断），无论因何种原因及任何责任理论，无论是在合同、严格责任或侵权（包括过失或其他）中，均不承担责任，即使已被告知可能发生此类损害的可能性。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues