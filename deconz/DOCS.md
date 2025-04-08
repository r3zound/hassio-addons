# Home Assistant 插件: deCONZ

## 安装

按照以下步骤在系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "deCONZ" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

### 使用 RaspBee

如果您使用的是 RaspBee，您可能需要编辑 SD 卡根目录下的 `config.txt` 文件，以便识别您的 RaspBee 并分配设备名称。

在 `config.txt` 中添加以下内容：

```txt
enable_uart=1
dtoverlay=pi3-miniuart-bt
```

### 配置插件

该插件需要知道您的 ConBee/RaspBee 位于何处，因此，您需要配置插件以指向正确的设备。

如果您正在使用 Home Assistant，您可以在 `设置 -> 系统 -> 硬件` 页面上找到此设备的正确值。建议使用设备的 "by-id" 路径（如果存在），因为在添加其他设备到系统时它不会发生更改。

1. 在插件配置中将 `device` 选项中的 `null` 替换为设备名称，并用引号括起来：例如类似于 `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`，`"/dev/ttyUSB0"`，`"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 点击 "保存" 以保存插件配置。
3. 切换 "在侧栏中显示" 以将其添加到您的 Home Assistant 侧栏。
4. 启动插件。

安装并启动此插件后，使用 "WEB UI" 按钮访问 deCONZ WebUI（"Phoscon"）。

## 配置 Home Assistant 的 deCONZ 集成

默认情况下，Home Assistant 启用了 `discovery` 集成，它会自动发现这个插件。

在启动此插件后，导航到 **设置** -> **设备与服务** -> **集成** 页面以配置 deCONZ 集成。

如果您在 Home Assistant 实例中没有启用 `discovery`，请按照以下说明配置 deCONZ 集成：

<https://www.home-assistant.io/integrations/deconz/>

## 迁移到此插件

要将 deCONZ 迁移到 Home Assistant 和此插件，请通过 Phoscon WebUI 备份您的 deCONZ 配置，然后在安装/重新安装后恢复该配置。

**_您必须执行这些步骤，否则您的灯光、组名称和其他数据将丢失！_**

不过，您的 Zigbee 设备将仍然与您的 ConBee 或 RaspBee 硬件配对。

## 访问 deCONZ 应用程序并通过 VNC 查看网状网络

该插件允许您通过 VNC 访问运行在远程桌面上的基础 deCONZ 应用程序。它允许您查看 Zigbee 网状网络（在调试网络问题时非常有用），同时还可以访问大量高级功能。

要启用它：

- 在插件的 "网络" 配置部分为 VNC 设置一个端口号，然后点击 "保存"。建议使用端口 5900，但任何在5900以上的其他端口也可以使用。
- 重启插件。

要访问它，您需要一个 [VNC Viewer][vnc-viewer] 应用程序。如果您使用的是 macOS，那您很幸运，因为 VNC 是内置的。打开聚光灯搜索并输入 VNC 服务 URL。

VNC 服务 URL 看起来像 [vnc://homeassistant.local:5900](vnc-service-url)。如果您在 Home Assistant 主机系统设置中更改了端口和可能的主机名，请相应地进行调整。

## 升级 RaspBee 和 ConBee 固件

此插件允许您通过 Phoscon Web 界面轻松升级固件。

转到 "设置 -> 网关"，然后点击升级按钮。

不过，有些 USB 设备（如 Aeotec Z-Wave 设备）可能会干扰升级过程，导致固件升级静默失败。如果您发现升级后固件版本与之前相同，请考虑拔掉其他设备并重新尝试。

如果仍然不起作用，请尝试 [手动升级固件][manual-upgrade]。

## 使用 deCONZ/Phoscon API 和其他插件

某些插件能够直接使用 deCONZ API。Node-RED 就是其中一个可以作为插件使用，并可以通过 `node-red-contrib-deconz` 节点消费 deCONZ API 的应用程序。

**警告** 请勿使用以下设置手动在 Home Assistant 内部设置集成！

要允许这些插件连接到 deCONZ，请使用以下设置：

- **主机**: `core-deconz`
- **(API) 端口**: `40850`
- **WebSocket 端口**: `8081`

_请注意：上述设置可能会在将来的插件更新中更改。_

## 高级调试输出控制

在插件中添加了隐藏控制，以允许控制 deCONZ 的调试输出。以下选项是隐藏的，但可以添加到插件配置中：

- `dbg_info`
- `dbg_aps`
- `dbg_otau`
- `dbg_zcl`
- `dbg_zdp`

这些选项需要一个数字，用于表示日志级别。

示例插件配置，启用了 `dbg_aps` 且日志级别为 1：

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

您的 ConBee/RaspBee 的设备地址。

如果您正在使用 Home Assistant，您可能会在 `Supervisor -> System -> Host system -> Hardware` 页面上找到此设备的正确值。建议使用设备的 "by-id" 路径（如果存在），因为在添加其他设备到系统时它不会发生更改。

在大多数情况下，它看起来像以下之一：

- `"/dev/serial/by-id/usb-dresden_elektronik_ingenieurtechnik_GmbH_ConBee_II_XXXXXXXX-if00"`（原一个 ConBee 和 RaspBee 类似，替换 `XXXXXXXX` 为您在上述硬件页面中看到的值）
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

## 故障排除

### 我的网关在 Home Assistant 中显示 ID 0000000000000000

这是一个较旧的错误，已在插件中解决。该插件在过去发送网关 ID 时过于迅速，在 deCONZ 没有分配 ID 之前。

这可能会导致 Home Assistant 发生问题，例如没有设备。
它还可能在插件进行了内部更改后，无法将新的设置传达给 Home Assistant。

这可以通过以下步骤解决：

1. 通过 Web UI 备份您的 deCONZ 数据，从菜单中选择：
  **设置** -> **网关** -> **备份选项**按钮，然后创建一个新的备份并下载到您的计算机上。
2. 卸载插件。
3. 在 Home Assistant 中，删除您当前的 deCONZ 集成。
4. 重启 Home Assistant。
5. 再次安装 deCONZ 插件，并根据 [说明](#configure-the-add-on) 重新配置它。
6. 在 Web UI 中恢复您在第一步创建的备份，与之前的位置相同。
7. 重启插件，然后再次重启 Home Assistant。
8. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明进行操作。

### 升级到 4.x 后我的集成显示无设备

_请确保您没有遇到网关 ID 0000000000000000 的问题。_

可能发生您不小心使用了较旧的发现或手动设置的集成。因为这样，插件无法通知 Home Assistant 发生的内部设置更改，已在 4.x 版本中。

解决方案是执行以下步骤来解决此问题，以后不会再出现这个问题。

1. 在 Home Assistant 中，删除您当前的 deCONZ 集成。
2. 重启 Home Assistant。
3. 按照 [设置 deCONZ 集成](#configuring-the-home-assistant-deconz-integration) 的说明进行操作。

这将确保您将来拥有一个正常工作的集成和插件。

## 已知问题和限制

- 为您的 Raspberry Pi 使用至少 2.5A 的电源！
  这样可以避免在使用此插件时出现奇怪的行为。
- 该插件没有 UPnP 支持。
- 如果出于某种原因，deCONZ 前端没有为您的 ConBee 或 RaspBee 提供初始设置，并不断要求输入密码，则最有可能的默认密码是 `delight`，您可以用来登录。

## 支持

有问题？

您有几种方式获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子版块][reddit] 在 [/r/homeassistant][reddit]。
- [deCONZ Discord 服务器](https://discord.gg/QFhTxqN)。

如果您发现了错误，请 [在我们的 GitHub 上提交问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[manual-upgrade]: https://github.com/dresden-elektronik/deconz-rest-plugin/wiki/Update-deCONZ-manually
[reddit]: https://reddit.com/r/homeassistant
[vnc-viewer]: https://bintray.com/tigervnc/stable/tigervnc/
[vnc-service-url]: vnc://homeassistant.local:5900