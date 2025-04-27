# Home Assistant 附加组件：Z-Wave JS

## 安装

按照这些步骤在您的系统上安装附加组件：

1. 在您的 Home Assistant 前端导航到 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "Z-Wave JS" 附加组件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

附加组件需要知道您的 Z-Wave 适配器的位置，因此，
您需要配置附加组件以指向正确的设备。

如果您使用 Home Assistant，您可以通过访问
`设置 -> 系统 -> 硬件`，然后点击三个点菜单并选择
`所有硬件` 来找到此值。建议使用 "by-id" 路径指向设备（如果存在），
因为如果添加了其他设备，它不会被更改。

1. 在附加组件配置中将 `device` 选项中的 `null` 替换为
   设备名称，使用引号包围：例如，像
   `"/dev/serial/by-id/usb-0658_0200-if00"`，
   `"/dev/ttyUSB0"`，`"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 设置您的 16 字节（32 字符十六进制）安全密钥，格式为 `2232666D1...`
   以便与兼容设备安全连接。建议配置所有四个网络密钥，因为某些安全启用的设备（锁等）
   如果没有安全添加，可能无法正常工作。
   - 作为说明，建议不要安全连接 _所有_ 设备，除非它们支持 S2 安全
     因为 S0 安全会使网状网络中发送的消息数量增加三倍。
3. 点击 "保存" 以保存附加组件配置。
4. 启动附加组件。
5. 将 Z-Wave JS 集成添加到 Home Assistant，查看文档：
   <https://www.home-assistant.io/integrations/zwave_js>

## 配置

附加组件配置：

```yaml
device: /dev/ttyUSB0
s0_legacy_key: 2232666D100F795E5BB17F0A1BB7A146
s2_access_control_key: A97D2A51A6D4022998BEFC7B5DAE8EA1
s2_authenticated_key: 309D4AAEF63EFD85967D76ECA014D1DF
s2_unauthenticated_key: CF338FE0CB99549F7C0EA96308E5A403
lr_s2_access_control_key: E2CEA6B5986C818EEC0D0065D81E2BD5
lr_s2_authenticated_key: 863027C59CFC522A9A3C41976AE54254
```

### 选项 `device`

Z-Wave 控制器设备。

如果您使用 Home Assistant，您可以通过访问
`设置 -> 系统 -> 硬件`，然后点击三个点菜单并
选择 `所有硬件` 来找到此值。建议使用 "by-id" 路径指向设备（如果存在），
因为如果添加了其他设备，它不会被更改。

在大多数情况下，这看起来像以下之一：

- `"/dev/serial/by-id/usb-0658_0200-if00"`
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

### 安全密钥

需要六个不同的安全密钥来充分利用
Z-Wave JS 支持的不同包含方法：`s0_legacy_key`、
`s2_access_control_key`、`s2_authenticated_key`、`s2_unauthenticated_key`、`lr_s2_access_control_key` 和 `lr_s2_authenticated_key`。

如果您是从之前的 `zwave-js` 版本过来的，您可能在
`network_key` 配置选项中存储了一个密钥。当附加组件首次
启动时，密钥将会从 `network_key` 迁移到 `s0_legacy_key`，这将确保您的 S0 安全设备继续功能正常。

如果在启动时缺少任何这些密钥，附加组件将为您自动生成一个。
要手动生成一个网络密钥，您可以使用以下脚本，例如在 SSH 附加组件中：

```bash
hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random
```

您也可以使用类似的网站生成所需的数据：

<https://www.random.org/cgi-bin/randbyte?nbytes=16&format=h>

确保保留这些密钥的备份。如果您必须重建系统而没有这些密钥的备份，您将无法与任何安全包含的设备通信。这可能意味着您必须对那些设备和您的控制器进行出厂重置，然后再重建您的 Z-Wave 网络。

> 注意：在多个安全类别之间共享密钥是一个安全风险，因此
> 如果您选择自己配置这些密钥，请确保使它们
> 唯一！

#### 选项 `s0_legacy_key`

S0 安全 Z-Wave 设备在添加到网络之前需要一个网络密钥。
此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

#### 选项 `s2_access_control_key`

为了包含具有 S2 访问控制安全类的设备，必须提供 `s2_access_control_key`。
此安全类是门锁和车库门开启器等设备所需的。此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

#### 选项 `s2_authenticated_key`

为了包含具有 S2 已认证安全类的设备，必须提供 `s2_authenticated_key`。
安全系统、传感器、照明等设备可以请求此安全类。此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

### 选项 `s2_unauthenticated_key`

为了包含具有 S2 未认证安全类的设备，必须提供 `s2_unauthenticated_key`。
这与 S2 已认证类似，但没有验证包含的设备是否正确。
此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

#### 选项 `lr_s2_access_control_key`

为了包含使用 Z-Wave 长距离的设备，必须提供 `lr_s2_access_control_key`。
此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

#### 选项 `lr_s2_authenticated_key`

为了包含使用 Z-Wave 长距离的设备，必须提供 `lr_s2_authenticated_key`。
此配置选项是必需的，但如果未设置，附加组件将在启动时会自动生成一个。

### 选项 `log_level`（可选）

该选项设置 Z-Wave JS 的日志级别。有效选项为：

- silly
- debug
- verbose
- http
- info
- warn
- error

如果未指定 `log_level`，日志级别将设置为 Supervisor 中设置的级别。

### 选项 `log_to_file`（可选）

当启用此选项时，日志将写入 `/addon_configs/core_zwave_js`
文件夹中，文件扩展名为 `.log`。

### 选项 `log_max_files`（可选）

当 `log_to_file` 为真时，Z-Wave JS 将为每一天创建一个日志文件。
此选项允许您控制 Z-Wave JS 将保留的最大文件数量。

### 选项 `soft_reset`（可选）

该设置告诉附加组件如何处理 500 系列控制器的软重置：
1. 自动 - 附加组件将决定是否应为 500 系列控制器启用或禁用软重置。这是默认选项，适合大多数人。
2. 启用 - 500 系列控制器将显式启用软重置。
3. 禁用 - 500 系列控制器将显式禁用软重置。

### 选项 `emulate_hardware`（可选）

如果您没有 USB 适配器，您可以使用虚拟适配器进行测试。
它将无法控制任何真实设备。

### 选项 `disable_controller_recovery`（可选）

该设置将禁用 Z-Wave JS 的自动恢复过程，当控制器似乎无响应时，
将允许控制器自行恢复（如果它能够恢复）。在控制器无响应时，
命令将开始失败，节点可能会随机标记为死亡。如果控制器无法自行恢复，
您需要重启附加组件以尝试恢复。在大多数情况下，用户将永远不需要使用此功能，
仅当您知道自己在做什么和/或被要求时才更改此设置。

### 选项 `disable_watchdog`（可选）

该设置将防止 Z-Wave JS 在支持的控制器上启用硬件看门狗。
在大多数情况下，用户将永远不需要使用此功能，
仅当您知道自己在做什么和/或被要求时才更改此设置。

### 选项 `safe_mode`（可选）

该设置将您的网络置于安全模式，这可能会显著降低
网络的性能，但也可能帮助启动网络，以便您进行故障排除、获取日志等。
在大多数情况下，用户将永远不需要使用此功能，
仅当您知道自己在做什么和/或被要求时才更改此设置。

### 选项 `network_key`（已弃用）

在附加组件的先前版本中，这是唯一需要的密钥。
随着 zwave-js 引入 S2 安全包含，此选项已被弃用，以支持 `s0_legacy_key`。
如果仍然设置，在首次启动时将把 `network_key` 的值迁移到 `s0_legacy_key`。

### 网络故障排除

附加组件中有几个功能可以帮助您在故障排除网络问题和/或提供数据以帮助 Home Assistant 或 Z-Wave JS 团队追踪问题时：

1. **更新日志级别：** 当您在 GitHub 上打开问题时，将 `log_level` 配置选项设置为 `debug` 并记录问题发生时的情况将极有帮助。
2. **日志到文件：** `log_to_file` 和 `log_max_files` 配置选项允许您启用和配置该功能。请注意，访问日志文件时，您需要能够访问 HA 实例的文件系统，可以通过文件编辑器、samba 或 ssh 附加组件等方式来访问。
3. **访问 Z-Wave JS 缓存：** Z-Wave JS 会在缓存文件中存储关于您的网络的信息，以便您的设备在每次启动时无需重新采访。在某些情况下，当您在 GitHub 上打开问题时，您可能会被要求提供缓存文件。您可以在 `/addon_configs/core_zwave_js/cache` 中访问它们。请注意，访问缓存时，您需要能够访问 HA 实例的文件系统，可以通过文件编辑器、samba 或 ssh 附加组件等方式来访问。
4. **更改软重置行为：** 默认情况下，附加组件将在启动时自动选择是否软重置控制器。通常情况下，这不应该更改，但如果在故障排除问题时被要求进行更改，您可以使用 `soft_reset` 配置选项进行更改。
5. **禁用控制器恢复：** 默认情况下，如果网络控制器似乎被阻塞，Z-Wave JS 将自动尝试将控制器恢复到健康状态。通常情况下，这不应该更改，但如果在故障排除问题时被要求进行更改，您可以使用 `disable_controller_recovery` 配置选项进行更改。
6. **启用安全模式：** 当 Z-Wave JS 启动困难时，有时会很难获取有用的日志来故障排除问题。通过将 `safe_mode` 设置为 true，Z-Wave JS 可以在原本设置为 false 时无法启动的情况下启动。请注意，启用 `safe_mode` 将对您的网络性能产生负面影响，应谨慎使用。

## 已知问题和限制

- 您的硬件需要与 Z-Wave JS 库兼容。

## 支持

有问题吗？

您有几种选项来获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 论坛][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant