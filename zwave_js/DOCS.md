# 家庭助理附加组件：Z-Wave JS

## 安装

按照以下步骤在您的系统上安装附加组件：

1. 在您的家庭助理前端中导航到 **设置** -> **附加组件** -> **附加组件商店**。
2. 找到 "Z-Wave JS" 附加组件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

附加组件需要知道您的 Z-Wave 适配器的位置，因此，
您需要配置附加组件以指向正确的设备。

如果您使用的是家庭助理，您可以通过访问
`设置 -> 系统 -> 硬件` 并点击三个点菜单，然后选择
`所有硬件` 来找到该值。建议使用 "by-id" 路径来指向设备（如果存在），
因为如果添加其他设备到系统，该路径不会改变。

1. 在附加组件配置中的 `device` 选项中替换 `null`，并在引号中指定
   设备名称：例如，类似于
   `"/dev/serial/by-id/usb-0658_0200-if00"`，
   `"/dev/ttyUSB0"`， `"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 设置您的 16 字节（32 个字符十六进制）安全密钥格式为 `2232666D1...`，
   以便安全连接到兼容的设备。建议
   配置所有四个网络密钥，因为某些启用安全的设备（锁等）
   可能在未安全添加的情况下无法正常工作。
   - 作为说明，建议不要安全连接 _所有_ 设备，除非它们支持 S2 安全
     因为 S0 安全会使在网络上的消息数量增加三倍。
3. 点击 "保存" 保存附加组件配置。
4. 启动附加组件。
5. 将 Z-Wave JS 集成添加到家庭助理，请参见文档：
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

如果您使用家庭助理，可以通过访问
`设置 -> 系统 -> 硬件` 并点击三个点菜单来找到该值，然后选择
`所有硬件`。如果存在，建议使用 "by-id" 路径指向设备，
因为如果添加其他设备到系统，该路径不会改变。

在大多数情况下，这看起来像以下之一：

- `"/dev/serial/by-id/usb-0658_0200-if00"`
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

### 安全密钥

有六个不同的安全密钥需要充分利用 Z-Wave JS 支持的不同纳入方法：
`s0_legacy_key`、`s2_access_control_key`、`s2_authenticated_key`、
`s2_unauthenticated_key`、`lr_s2_access_control_key` 和 `lr_s2_authenticated_key`。

如果您是从以前的 `zwave-js` 版本过来的，您可能在 `network_key` 配置选项中
存储了一个密钥。当附加组件首次启动时，该密钥将从 `network_key`
迁移到 `s0_legacy_key`，这将确保您的 S0 安全设备能够继续工作。

如果在启动时缺少任何这些密钥，附加组件将为您自动生成一个。
要手动生成网络密钥，您可以使用以下脚本，例如在 SSH 附加组件中：

```bash
hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random
```

您还可以使用类似这样的网站生成所需的数据：

<https://www.random.org/cgi-bin/randbyte?nbytes=16&format=h>

确保您保存这些密钥的备份。如果您必须重建系统而没有这些密钥的备份，
您将无法与任何安全纳入设备通信。这可能意味着您必须对这些设备和控制器
进行恢复出厂设置，然后再重建 Z-Wave 网络。

> 注意：在多个安全类之间共享密钥是一种安全风险，因此
> 如果您选择自行配置这些密钥，请确保它们是唯一的！

#### 选项 `s0_legacy_key`

S0 安全 Z-Wave 设备在添加到网络之前需要一个网络密钥。
此配置选项是必需的，但如果未设置，附加组件将在启动时自动生成一个。

#### 选项 `s2_access_control_key`

必须提供 `s2_access_control_key` 以纳入具有 S2 访问控制安全类的设备。
此安全类是门锁和车库门开启器等设备所需的。此配置选项是必需的，
但如果未设置，附加组件将在启动时自动生成一个。

#### 选项 `s2_authenticated_key`

必须提供 `s2_authenticated_key` 以纳入具有 S2 经过身份验证安全类的设备。
安全系统、传感器、灯光等设备可以请求此安全类。此配置选项是必需的，
但如果未设置，附加组件将在启动时自动生成一个。

### 选项 `s2_unauthenticated_key`

必须提供 `s2_unauthenticated_key` 以纳入具有 S2 未经过身份验证安全类的设备。
这与 S2 经过身份验证类似，但没有验证是否包含了正确的设备。
此配置选项是必需的，但如果未设置，附加组件将在启动时自动生成一个。

#### 选项 `lr_s2_access_control_key`

必须提供 `lr_s2_access_control_key` 以纳入使用 Z-Wave 长范围的设备。
此配置选项是必需的，但如果未设置，附加组件将在启动时自动生成一个。

#### 选项 `lr_s2_authenticated_key`

必须提供 `lr_s2_authenticated_key` 以纳入使用 Z-Wave 长范围的设备。
此配置选项是必需的，但如果未设置，附加组件将在启动时自动生成一个。

### 选项 `log_level`（可选）

此选项设置 Z-Wave JS 的日志级别。有效选项为：

- silly
- debug
- verbose
- http
- info
- warn
- error

如果未指定 `log_level`，日志级别将设置为 Supervisor 中设置的级别。

### 选项 `log_to_file`（可选）

当启用此选项时，日志将写入 `/addon_configs/core_zwave_js` 文件夹，并带有 `.log` 文件扩展名。

### 选项 `log_max_files`（可选）

当 `log_to_file` 为 true 时，Z-Wave JS 将为每一天创建一个日志文件。
此选项允许您控制 Z-Wave JS 将保留的最大文件数量。

### 选项 `soft_reset`（可选）

此设置告知附加组件如何处理 500 系列控制器的软重置：
1. 自动 - 附加组件将决定是否应为 500 系列控制器启用或禁用软重置。这是默认选项，适合大多数人使用。
2. 启用 - 将显式为 500 系列控制器启用软重置。
3. 禁用 - 将显式为 500 系列控制器禁用软重置。

### 选项 `emulate_hardware`（可选）

如果您没有 USB 适配器，您可以使用假适配器进行测试。
它将无法控制任何真实设备。

### 选项 `disable_controller_recovery`（可选）：

此设置将禁用 Z-Wave JS 在控制器似乎无响应时的自动恢复过程，
如果控制器能够自行恢复，系统将允许其自行恢复。 
在控制器无响应时，命令将开始失败，节点可能会随机标记为死节点。
如果控制器无法自行恢复，您需要重启附加组件以尝试恢复。
在大多数情况下，用户不需要使用此功能，因此，只有在您知道自己在做什么以及/或被要求时才更改此设置。

### 选项 `disable_watchdog`（可选）：

此设置将阻止 Z-Wave JS 在支持的控制器上启用硬件看门狗。在大多数情况下，用户不需要使用此功能，因此，只有在您知道自己在做什么以及/或被要求时才更改此设置。

### 选项 `safe_mode`（可选）

此设置将您的网络置于安全模式，这可能会显著降低网络的性能，但也可能有助于使网络启动并运行，以便您可以排除故障、获取日志等。在大多数情况下，用户不需要使用此功能，因此只有在您知道自己在做什么以及/或被要求时才更改此设置。

### 选项 `network_key`（已弃用）

在以前版本的附加组件中，这是唯一需要的密钥。随着在 zwave-js 中引入 S2 安全纳入，此选项已被弃用，取而代之的是 `s0_legacy_key`。如果仍然设置，`network_key` 的值将在首次启动时迁移到 `s0_legacy_key`。

### 故障排除网络问题

附加组件中提供了一些功能，可以帮助您排除网络问题和/或提供数据给家庭助理或 Z-Wave JS 团队，以帮助追踪问题：

1. **更新日志级别：** 开始新的 GitHub 问题时，将 `log_level` 配置选项设置为 `debug` 并捕获问题发生时的日志非常有帮助。
2. **记录到文件：** `log_to_file` 和 `log_max_files` 配置选项允许您启用和配置此功能。请注意，要访问日志文件，您需要能够访问 HA 实例的文件系统，您可以使用文件编辑器、samba 或 ssh 附加组件来实现。
3. **访问 Z-Wave JS 缓存：** Z-Wave JS 将其发现的网络信息存储在缓存文件中，以便设备不会在每次启动时重新进行询问。在某些情况下，您在打开 GitHub 问题时可能会被要求提供缓存文件。您可以在 `/addon_configs/core_zwave_js/cache` 中访问它们。请注意，要访问缓存，您需要能够访问 HA 实例的文件系统，您可以使用文件编辑器、samba 或 ssh 附加组件来实现。
4. **更改软重置行为：** 默认情况下，附加组件将在启动时自动选择是否软重置控制器。在大多数情况下，这不应更改，但如果在排除故障时被要求进行更改，您可以使用 `soft_reset` 配置选项进行更改。
5. **禁用控制器恢复：** 默认情况下，如果网络控制器似乎被阻塞，Z-Wave JS 将自动尝试将控制器恢复到健康状态。在大多数情况下，这不应更改，但如果在排除故障时被要求进行更改，您可以使用 `disable_controller_recovery` 配置选项进行更改。
6. **启用安全模式：** 当 Z-Wave JS 启动时遇到问题时，有时很难获取有用的日志来排除问题。通过将 `safe_mode` 设置为 true，Z-Wave JS 可能能够在之前因为 `safe_mode` 设置为 false 而无法启动的情况下启动。请注意，启用 `safe_mode` 将对网络的性能产生负面影响，应谨慎使用。

## 已知问题和限制

- 您的硬件需要与 Z-Wave JS 库兼容。

## 支持

有问题吗？

您有几种选择可以解决这些问题：

- [家庭助理 Discord 聊天服务器][discord]。
- 家庭助理 [社区论坛][forum]。
- 加入 [Reddit subreddit][reddit] 在 [/r/homeassistant][reddit]。

如果您发现了一个错误，请 [在我们的 GitHub 上打开问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant