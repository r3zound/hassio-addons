# Home Assistant 插件：deCONZ

## 安装

按照以下步骤在您的系统上安装该插件：

1. 在 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "deCONZ" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

### 使用 RaspBee

如果您使用的是 RaspBee，您可能需要编辑 SD 卡根目录中的 `config.txt` 文件，以便系统能够识别 RaspBee 并为其分配设备名称。

在 `config.txt` 中添加以下内容：

```txt
enable_uart=1
dtoverlay=pi3-miniuart-bt
```

### 配置插件

该插件需要知道您的 ConBee/RaspBee 可以在哪找到，因此，您需要配置插件以指向正确的设备。

如果您使用的是 Home Assistant，您可以在 `设置 -> 系统 -> 硬件` 页面找到此信息的正确值。建议使用“by-id”路径指向设备（如果存在），因为如果系统中添加其他设备，它不会发生变化。

1. 在插件配置中，将 `device` 选项中的 `null` 替换为引号中的设备名称：例如，像 `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`、`"/dev/ttyUSB0"`、`"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 点击 "保存" 以保存插件配置。
3. 切换 "在侧边栏显示" 以将其添加到您的 Home Assistant 侧边栏。
4. 启动插件。

安装并启动此插件后，可以通过 "WEB UI" 按钮访问 deCONZ WebUI ("Phoscon")。

## 配置 Home Assistant deCONZ 集成

默认情况下，Home Assistant 启用 `discovery` 集成，该集成会自动发现此插件。

在启动该插件后，导航到 **设置** -> **设备与服务** -> **集成** 页面以配置 deCONZ 集成。

如果您的 Home Assistant 实例未启用 `discovery`，请按照以下说明配置 deCONZ 集成：

<https://www.home-assistant.io/integrations/deconz/>

## 迁移到该插件

要将 deCONZ 迁移到 Home Assistant 和此插件，通过 Phoscon WebUI 备份您的 deCONZ 配置，然后在安装/重新安装后恢复该配置。

**_您必须执行这些步骤，否则您将丢失灯光、组名称和其他数据！_**

然而，您的 Zigbee 设备仍会与您的 ConBee 或 RaspBee 硬件配对。

## 通过 VNC 访问 deCONZ 应用程序并查看网络拓扑

该插件允许您通过 VNC 访问远程桌面上运行的基础 deCONZ 应用程序。它允许您查看 Zigbee 网络（这在调试网络问题时非常有帮助），还可以访问大量高级功能。

要启用它：

- 在插件的 "网络" 配置部分为 VNC 设置端口号并点击 "保存"。建议使用端口 5900，但任何其他高于 5900 的端口也可以。
- 重新启动插件。

要访问它，您需要一个 [VNC Viewer][vnc-viewer] 应用程序。如果您使用的是 macOS，您很幸运，因为 VNC 是内置的。打开聚光灯搜索并输入 VNC 服务 URL。

VNC 服务 URL 形如 [vnc://homeassistant.local:5900](vnc-service-url)。
如果您在 Home Assistant 主机系统设置中做了更改，请调整端口和可能的主机名。

## 升级 RaspBee 和 ConBee 固件

此插件允许您直接从 Phoscon Web 界面轻松升级固件。

前往 "设置 -> 网关" 并点击升级按钮。

然而，某些 USB 设备（如 Aeotec Z-Wave 设备）可能会干扰升级过程，导致固件升级悄然失败。如果在升级后固件版本与升级前相同，请考虑拔掉其他设备，再试一次。

如果仍然无法升级，请尝试 [手动升级固件][manual-upgrade]。

## 使用 deCONZ/Phoscon API 与其他插件

某些插件能够直接使用 deCONZ API。Node-RED 就是这样的一款应用程序，它作为插件提供，可以使用 `node-red-contrib-deconz` 节点来消费 deCONZ API。

**警告** 请勿使用以下设置从 Home Assistant 内部手动设置集成！

要允许这些插件连接到 deCONZ，请使用以下设置：

- **主机**: `core-deconz`
- **（API）端口**: `40850`
- **WebSocket 端口**: `8081`

_请注意：上述设置可能会在未来的插件更新中更改。_

## 高级调试输出控制

插件中添加了隐藏控制，以便控制 deCONZ 的调试输出。以下选项是隐藏的，但可以添加到插件配置中：

- `dbg_info`
- `dbg_aps`
- `dbg_otau`
- `dbg_zcl`
- `dbg_zdp`

这些选项需要一个表示日志级别的数字。

启用日志级别 1 的示例插件配置：

```yaml
device: /dev/ttyUSB0
dbg_aps: 1
```

## 配置

插件配置：

```yaml
device: /dev/ttyAMA0
```

### 选项: `device`（必需）

您 ConBee/RaspBee 的设备地址。

如果您在使用 Home Assistant，您可以在 `监视器 -> 系统 -> 主机系统 -> 硬件` 页面找到此信息的正确值。建议使用如果存在的设备 "by-id" 路径，因为如果系统中添加其他设备，它不会发生变化。

在大多数情况下，这看起来如下之一：

- `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`（以及 RaspBee 和原始 ConBee 的类似路径，将 `XXXXXXXX` 替换为您在上述硬件页面中看到的值）
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

## 故障排除

### 我的网关在 Home Assistant 中显示 ID 0000000000000000

这是一个旧的错误，已经在插件中解决。插件在过去发送网关 ID 的速度太快，在 deCONZ 分配 ID 之前发送了。

这可能导致 Home Assistant 中出现问题，例如没有设备。
这也可能在插件发生内部变化且下次无法将新设置通信到 Home Assistant 时造成问题。

可以通过以下步骤解决此问题：

1. 通过进入 Web UI 备份您的 deCONZ 数据，从菜单选择：
  **设置** -> **网关** -> **备份选项** 按钮，然后创建一个新的备份并下载到您的计算机上。
2. 卸载插件。
3. 在 Home Assistant 中，删除您当前的 deCONZ 集成。
4. 重启 Home Assistant。
5. 再次安装 deCONZ 插件，并根据 [说明](#configure-the-add-on) 重新配置它。
6. 在 Web UI 中同样位置恢复第一步创建的备份。
7. 重新启动插件，然后再次重启 Home Assistant。
8. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明。

### 升级到 4.x 后我的集成显示没有设备

_请确保您没有网关 ID 0000000000000000 的问题。_

有可能您在过去意外使用了旧版发现或手动设置集成。因此，该插件无法告知 Home Assistant 已更改的内部设置，而这些设置在 4.x 中发生了变化。

解决此问题的方法是执行以下步骤，以一次性解决该问题，以后您就不会再遇到这个问题。

1. 在 Home Assistant 中，删除您当前的 deCONZ 集成。
2. 重启 Home Assistant。
3. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明进行操作。

这将确保您将来具有有效的集成和插件。

## 已知问题和限制

- 为您的 Raspberry Pi 使用至少 2.5A 的电源！
  这可以避免在使用此插件时出现奇怪的行为。
- 该插件没有 UPnP 支持。
- 如果由于某种原因 deCONZ 前端没有给您初始设置您的 ConBee 或 RaspBee 的选项，并且不断要求您输入密码，那么很可能 `delight` 是您可以用来进入的默认密码。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 于 [/r/homeassistant][reddit]
- [deCONZ Discord 服务器](https://discord.gg/QFhTxqN)。

如果您发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[manual-upgrade]: https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Update-deCONZ-manually
[reddit]: https://reddit.com/r/homeassistant
[vnc-viewer]: https://bintray.com/tigervnc/stable/tigervnc/
[vnc-service-url]: vnc://homeassistant.local:5900