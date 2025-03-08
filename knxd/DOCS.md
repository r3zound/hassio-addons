# Home Assistant 社区插件: KNXD

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端导航到 **Supervisor** -> **Add-on Store**。
2. 如果您还没有将此插件库添加到您的监督中，请点击右上角的菜单图标，选择 **Repositories**，将 `https://github.com/da-anda/hass-io-addons` 添加为新库，然后再次关闭对话框。
3. 找到 "KNXD" 插件并点击它。
4. 点击 "INSTALL" 按钮。

## 配置

插件配置：

```yaml
    "address": "0.0.1",
    "client_address": "0.0.2:8",
    "interface": "tpuart",
    "device": "/dev/ttyACM0",
    "usb_filters": "",
    "custom_config": ""
```

### 选项
这些选项的描述部分来自 `knxd` [文档](https://github.com/knxd/knxd/blob/master/doc/inifile.rst)。您可以在那找到更多示例和详细信息。

#### 选项 `address`

knxd 守护进程本身的 KNX 地址。用于例如源自组缓存的请求。

#### 选项 `client_address`

要分配给客户端连接的地址范围。请注意，长度参数表示要分配的地址数量。

示例: 1.2.3:5（这将把地址 1.2.3 到 1.2.7 分配给 knxd 的客户端。）

#### 选项 `interface`

驱动程序 `knxd` 应该使用的接口以与 KNX 总线通信。此插件的典型用例中最常见的接口有：

- `tpuart`（用于基于 UART 的 KNX 接口，如来自 Busware.de 的接口）
- `usb`（用于商业 USB KNX 接口）

有关所有可能选项的完整列表，请参阅 `knxd` 文档的 [drivers section](https://github.com/knxd/knxd/blob/master/doc/inifile.rst#drivers)。

#### 选项: `device`（某些接口可选）

您适配器在 Linux 中的物理设备地址。示例：

- **TPUART 接口**: `/dev/ttyACM0`
- **USB 接口**: 您可以尝试将此留空，以便 `knxd` 自动检测您的设备。如果留空时不工作，请尝试指定设备地址，例如 `/dev/ttyAMA0`。

请注意，这些地址是示例，可能与您的设备不同。要找出设备地址，您必须 SSH 进入您的主机操作系统（**不是**监督！）并检查那里连接的设备。

#### 选项: `usb_filters`（可选）

使用 USB 接口时，可以指定要使用的附加过滤器。请参阅官方 `knxd` 文档的 [filters section](https://github.com/knxd/knxd/blob/master/doc/inifile.rst#filters)。

#### 选项: `custom_config`（可选）

允许您编写自己的自定义 `knxd` ini 配置，而不是使用此插件提供的预定义模板，该模板使用上述所有其他配置选项。

您的自定义配置将替换此插件提供的默认配置，因此上述所有其他配置选项将被忽略。有关所有可能的配置选项，请参见 [knxd 文档](https://github.com/knxd/knxd/blob/master/doc/inifile.rst)。

## 支持

如果您有任何问题，请随时加入 HomeAssistant 社区并在 [插件主题](https://community.home-assistant.io/t/knxd-add-on-covert-your-knx-usb-interface-into-an-ip-interface-that-can-be-used-by-ha/38108/38) 中提问。

如果您发现了错误，请随时在 [Github](https://github.com/da-anda/hass-io-addons/issues) 上创建一个工单。