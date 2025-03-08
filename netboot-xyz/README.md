# Home Assistant 社区插件：Netboot.xyz
![支持 aarch64 架构][aarch64-shield] ![支持 amd64 架构][amd64-shield] ![支持 armhf 架构][armhf-shield] ![支持 armv7 架构][armv7-shield] ![支持 i386 架构][i386-shield]
![项目维护][maintenance-shield]

Netboot.xyz PXE 服务器适用于 Homeassistant OS

## 关于

netboot.xyz 是一种通过 PXE 从 BIOS 中一个地方引导各种操作系统安装程序或工具的方式，无需去检索介质以运行工具。iPXE 被用来提供一个用户友好的菜单，让您可以轻松选择所需的操作系统以及任何特定类型的版本或可启动标志。

您可以远程将 ISO 附加到服务器，设置为 Grub 中的救援选项，或者甚至配置您的家庭网络以默认引导到它，以便始终可用。

## 安装

[![FaserF Homeassistant 插件](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2FFaserF%2Fhassio-addons)
<br />
该插件的安装非常简单，与安装其他自定义 Home Assistant 插件并无太大区别。<br />
只需点击上面的链接或将我的库添加到 hassio 插件库中：<https://github.com/FaserF/hassio-addons>

## 配置

**注意**：_更改配置后，请记得重启插件。_

示例插件配置：

```yaml
path: /media/netboot/image
path_config: /media/netboot/config
dhcp_range: 192.168.178.200
```
<br />

**注意**：_这只是一个示例，请勿复制粘贴！请创建您自己的！_

### 选项：`path`

此选项是必须的。根据您的 ISO 文件和其他文件的实际位置进行更改。

注意：它必须在 /media 文件夹中的某个地方！其他文件夹对该插件不可见。

### 选项：`path_config`

此选项是必须的。根据您的 netboot.xyz 配置文件和其他文件的实际位置进行更改。

注意：它必须在 /media 文件夹中的某个地方！其他文件夹对该插件不可见。

### 选项：`dhcp_range`

此选项是必须的。根据您的网络进行更改。尝试在最后的范围中使用更高的 IP（例如 100 或 200）。

## Ingress

该插件支持 Homeassistant Ingress。但似乎存在一些错误。

## 安装后
首次引导前，建议查看 netboot 配置。<br />
访问 <http://YOUR-HOMEASSISTANT-IP:3000> -> 菜单 -> boot.cfg<br />

### Windows
1. 根据您的 WinPE 位置更改以下行：<br />
   set win_base_url <http://YOUR-SERVER-IP:PortForTheNGINXserver/WinPE> <br />

   例如，如果您将提取的文件直接托管在 netboot.xyz 服务器上，并且您的 IP 地址为 192.168.178.2：<br />
   set win_base_url <http://192.168.178.2:85/WinPE> <br />

2. 将 Windows PE 文件复制到您的 $path 文件夹 -> WinPE -> x64<br />
   示例：/media/netboot/image/WinPE/x64<br />

3. 提取 Windows ISO 并将文件复制到您的 $path 文件夹中的任何位置，例如：<br />
   /media/netboot/image/windows<br />

4. 安装 Samba Share Homeassistant 插件并启动它<br />
   该插件用于提供 win10 ISO 给 winPE<br />

5. 启动 WinPE 后输入以下行<br />
net use Z: \ \YOUR-SERVER-IP\$path /user:YOUR-SERVER-IP\mySambaUser myPassword<br />
net use Z: \ \192.168.178.2\media\netboot\image\windows /user:192.168.178.2\mySambaUser myPassword<br />
Z:\setup.exe <br />

更多信息：<br />
<https://netboot.xyz/faq/windows/>

### 自动化此 Windows 安装过程

修改您的 WinPE：<br />
1. 在您的 WinPE 位置创建一个 Main.cmd 文件，放在新文件夹 "Scripts" 中 <br />
   例如：/media/netboot/image/WinPE/x64/Scripts/Start.cmd<br />
   然后将上面的两行添加到该脚本中<br />
   然后修改 wpeinit 以使用该脚本。
2. 创建一个 autounattend.xml 文件。您可以在这里找到一些我的示例：<https://github.com/FaserF/WindowsPostInstaller/tree/master/autounattend><br />

请查看 <https://github.com/netbootxyz/netboot.xyz/discussions/757><br />

## 支持

有问题或疑问？

您可以 [在这里报告问题][issue] GitHub。
请记住，此软件仅在 Raspberry Pi 4 上的 armv7 进行了测试。

### 已知问题
1. PXE 引导后，如果您不在路由器的设置中配置 PXE DHCP 选项，启动将运行多次超时。<br />
2. boot.cfg 的更改似乎被 netboot.xyz 忽略。它将始终使用默认配置。<https://github.com/netbootxyz/netboot.xyz/discussions/861> <br />

## 作者与贡献者

该程序最初来自 Netboot.xyz 项目。有关更多信息，请访问此页面：<https://netboot.xyz/>
该 hassio 插件由 [FaserF] 提供。

## 许可证

MIT 许可证

版权所有 (c) 2019-2023 FaserF 和 Netboot.xyz 项目

特此免费授予任何获得本软件及相关文档文件（“软件”）副本的人，在不受限制的情况下处理该软件的权利，包括但不限于使用、复制、修改、合并、发布、分发、再授权和/或出售该软件的副本，并允许向其提供该软件的人这样做，须遵守以下条件：

上述版权声明和本许可声明应包含在所有副本或软件的实质性部分中。

该软件按“原样”提供，不附任何种类的保证，无论明示或暗示，包括但不限于对适销性、特定目的适用性和无侵权的保证。在任何情况下，作者或版权持有者均不对因使用该软件或与该软件有关的使用或其他交易而引起的任何索赔、损害或其他责任承担责任。

[maintenance-shield]: https://img.shields.io/maintenance/yes/2023.svg
[aarch64-shield]: https://img.shields.io/badge/aarch64-yes-green.svg
[amd64-shield]: https://img.shields.io/badge/amd64-yes-green.svg
[armhf-shield]: https://img.shields.io/badge/armhf-yes-green.svg
[armv7-shield]: https://img.shields.io/badge/armv7-yes-green.svg
[i386-shield]: https://img.shields.io/badge/i386-yes-green.svg
[FaserF]: https://github.com/FaserF/
[issue]: https://github.com/FaserF/hassio-addons/issues