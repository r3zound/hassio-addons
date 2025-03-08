# Home Assistant 附加组件：deCONZ

## 安装

按照以下步骤在您的系统上安装附加组件：

1. 在 Home Assistant 前端导航到 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "deCONZ" 附加组件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

### 使用 RaspBee

如果您使用 RaspBee，您可能需要编辑 SD 卡根目录中的 `config.txt` 文件，以便 RaspBee 被识别并分配设备名称。

在您的 `config.txt` 中添加以下内容：

```txt
enable_uart=1
dtoverlay=pi3-miniuart-bt
```

### 配置附加组件

附加组件需要知道您的 ConBee/RaspBee 可以在哪里找到，因此，您需要配置附加组件以指向正确的设备。

如果您使用 Home Assistant，您可以在 `设置 -> 系统 -> 硬件` 页面找到此正确值。建议如果存在 “by-id” 路径，则使用它，因为它在添加其他设备时不易更改。

1. 在附加组件配置中的 `device` 选项中替换 `null`，并在引号中指定设备名称：例如类似于 `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`、`"/dev/ttyUSB0"`、`"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 点击 "保存" 以保存附加组件配置。
3. 切换 "在侧边栏中显示" 将其添加到 Home Assistant 侧边栏。
4. 启动附加组件。

安装并启动此附加组件后，使用 "WEB UI" 按钮访问 deCONZ WebUI（“Phoscon”）。

## 配置 Home Assistant deCONZ 集成

默认情况下，Home Assistant 启用了 `discovery` 集成，自动发现此附加组件。

在启动此附加组件后，导航到 **设置** -> **设备与服务** -> **集成** 页面以配置 deCONZ 集成。

如果您在 Home Assistant 实例中没有启用 `discovery`，请按照以下说明配置 deCONZ 集成：

<https://www.home-assistant.io/integrations/deconz/>

## 迁移到此附加组件

要将 deCONZ 迁移到 Home Assistant 和此附加组件，请通过 Phoscon WebUI 备份您的 deCONZ 配置，然后在安装/重新安装后恢复该配置。

**_您必须执行这些步骤，否则您的灯光、组名称和其他数据将丢失！_**

然而，您的 Zigbee 设备仍将与您现有的 ConBee 或 RaspBee 硬件配对。

## 通过 VNC 访问 deCONZ 应用程序并查看网状网络

附加组件允许您通过 VNC 访问在远程桌面上运行的底层 deCONZ 应用程序。它使您能够查看 Zigbee 网状网络（在调试网络问题时非常有用），同时还为您提供访问许多高级功能的权限。

要启用它：

- 在附加组件的 "网络" 配置部分为 VNC 设置一个端口号，然后点击 "保存"。建议使用端口 5900，但其他 5900 以上的端口也可以。
- 重新启动附加组件。

要访问它，您需要一个 [VNC Viewer][vnc-viewer] 应用程序。如果您使用 macOS，您很幸运，因为 VNC 是内置的。打开聚焦搜索并输入 VNC 服务 URL。

VNC 服务 URL 看起来像 [vnc://homeassistant.local:5900](vnc-service-url)。如果您在 Home Assistant 主机系统设置中已更改了端口和可能的主机名，请调整它。

## 升级 RaspBee 和 ConBee 固件

此附加组件允许您直接通过 Phoscon 网站轻松升级固件。

转到 "设置 -> 网关" 并点击升级按钮。

但是，一些 USB 设备（如 Aeotec Z-Wave 设备）可能会干扰升级过程，导致固件升级无声地失败。如果您发现升级后仍然为旧的固件版本，请考虑拔掉其他设备并重试。

如果仍然不行，请尝试 [手动升级固件][manual-upgrade]。

## 使用 deCONZ/Phoscon API 与其他附加组件配合

某些附加组件能够直接消费 deCONZ API。Node-RED 是其中一个可作为附加组件使用的应用程序，可以使用 `node-red-contrib-deconz` 节点消费 deCONZ API。

**警告** 请不要使用以下设置从 Home Assistant 内部手动设置集成！

要允许这些附加组件连接到 deCONZ，请使用以下设置：

- **主机**：`core-deconz`
- **（API）端口**：`40850`
- **WebSocket 端口**：`8081`

_请注意：上述设置可能会在未来的附加组件更新中更改。_

## 高级调试输出控制

附加组件中添加了隐藏控件，以便控制 deCONZ 的调试输出。以下选项是隐藏的，但可以添加到附加组件配置中：

- `dbg_info`
- `dbg_aps`
- `dbg_otau`
- `dbg_zcl`
- `dbg_zdp`

这些选项需要一个表示日志级别的数字。

启用日志级别 1 的 `dbg_aps` 的示例附加组件配置：

```yaml
device: /dev/ttyUSB0
dbg_aps: 1

```

## 配置

附加组件配置：

```yaml
device: /dev/ttyAMA0
```

### 选项：`device`（必需）

您的 ConBee/RaspBee 的设备地址。

如果您使用 Home Assistant，您可以在 `Supervisor -> 系统 -> 主机系统 -> 硬件` 页面找到此正确值。建议如果存在 “by-id” 路径，则使用它，因为它在添加其他设备时不易更改。

在大多数情况下，这看起来像以下之一：

- `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`（RaspBee 和原始 ConBee 也类似，将 `XXXXXXXX` 替换为您在上述硬件页面中看到的值）
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

## 故障排除

### 我的网关在 Home Assistant 中显示 ID 0000000000000000

这是一个较早的 bug，已经在附加组件中解决。之前附加组件发送网关 ID 的速度过快，而 deCONZ 尚未分配一个 ID。

这可能会导致 Home Assistant 中的问题，例如没有设备。它也可能导致附加组件在内部发生变更时，未能向 Home Assistant 通信新设置的问题。

可以通过以下步骤解决：

1. 通过进入 Web UI，选择菜单：
   **设置** -> **网关** -> **备份选项** 按钮，创建新的备份并下载到您的计算机上。
2. 卸载附加组件。
3. 在 Home Assistant 中，删除当前的 deCONZ 集成。
4. 重新启动 Home Assistant。
5. 再次安装 deCONZ 附加组件，并按照 [说明](#configure-the-add-on) 重新配置它。
6. 在 Web UI 中的相同位置恢复您在第一步创建的备份。
7. 重新启动附加组件，然后再次重启 Home Assistant。
8. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明进行操作。

### 我的集成在升级到 4.x 后没有显示设备

_请确保您没有遇到网关 ID 0000000000000000 的问题。_

您可能不小心在过去使用了较旧的发现或手动设置集成。因此，附加组件无法通知 Home Assistant 更新内部设置，这在 4.x 中发生。

解决此问题的步骤如下，以确保您将来不再遇到此问题。

1. 在 Home Assistant 中，删除当前的 deCONZ 集成。
2. 重新启动 Home Assistant。
3. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明进行操作。

这将确保您在未来拥有一个正常工作的集成和附加组件。

## 已知问题和限制

- 请为您的 Raspberry Pi 使用至少 2.5A 的电源！这样可以避免使用此附加组件时出现奇怪的行为。
- 附加组件没有 UPnP 支持。
- 如果由于某种原因 deCONZ 前端没有为您的 ConBee 或 RaspBee 提供初始设置，并且不断要求您输入密码，那么最可能的默认密码是 `delight`。

## 支持

有问题吗？

您有几种选择可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。
- [deCONZ discord 服务器](https://discord.gg/QFhTxqN)。

如果您发现了错误，请 [在我们的 GitHub 上提交问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[manual-upgrade]: https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Update-deCONZ-manually
[reddit]: https://reddit.com/r/homeassistant
[vnc-viewer]: https://bintray.com/tigervnc/stable/tigervnc/
[vnc-service-url]: vnc://homeassistant.local:5900