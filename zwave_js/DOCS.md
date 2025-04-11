# Home Assistant 插件: Z-Wave JS

## 安装

按照以下步骤在您的系统上安装插件：

1. 在您的 Home Assistant 前端中导航到 **设置** -> **插件** -> **插件商店**。
2. 找到 "Z-Wave JS" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

插件需要知道您的 Z-Wave 适配器在哪里，因此，您需要配置插件以指向正确的设备。

如果您使用的是 Home Assistant，您可以通过导航到 `设置 -> 系统 -> 硬件` 并点击三个点菜单，选择 `所有硬件` 来找到此设备的正确值。如果存在，建议使用 "by-id" 路径来指向设备，因为如果添加其他设备不会变化。

1. 在插件配置中的 `device` 选项中替换 `null` 并在引号中指定设备名称：例如，类似于 `"/dev/serial/by-id/usb-0658_0200-if00"`、`"/dev/ttyUSB0"`、`"/dev/ttyAMA0"` 或 `"/dev/ttyACM0"`。
2. 按照 `2232666D1...` 的格式设置您的 16 字节（32 个字符十六进制）安全密钥，以便安全连接到兼容设备。建议配置所有四个网络密钥，因为某些启用安全的设备（如锁等）在未被安全添加的情况下可能无法正常工作。
   - 需要注意的是，除非设备支持 S2 安全，否则不建议安全连接 _所有_ 设备，因为 S0 安全会将发送到网状网络的消息数量增加三倍。
3. 点击 "保存" 保存插件配置。
4. 启动插件。
5. 将 Z-Wave JS 集成添加到 Home Assistant 中，参考文档： <https://www.home-assistant.io/integrations/zwave_js>

## 配置

插件配置：

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

如果您使用 Home Assistant，您可以通过导航到 `设置 -> 系统 -> 硬件` 并点击三个点菜单，选择 `所有硬件` 来找到此设备的正确值。如果存在，建议使用 "by-id" 路径来指向设备，因为如果添加其他设备不会变化。

在大多数情况下，这看起来像以下之一：

- `"/dev/serial/by-id/usb-0658_0200-if00"`
- `"/dev/ttyUSB0"`
- `"/dev/ttyAMA0"`
- `"/dev/ttyACM0"`

### 安全密钥

需要六个不同的安全密钥才能充分利用 Z-Wave JS 支持的不同包含方法：`s0_legacy_key`、`s2_access_control_key`、`s2_authenticated_key`、`s2_unauthenticated_key`、`lr_s2_access_control_key` 和 `lr_s2_authenticated_key`。

如果您来自 `zwave-js` 的早期版本，您很可能在 `network_key` 配置选项中存储了一个密钥。当插件第一次启动时，密钥将从 `network_key` 迁移到 `s0_legacy_key`，这将确保您的 S0 安全设备继续正常工作。

如果在启动时缺少任何这些密钥，插件将为您自动生成一个。要手动生成网络密钥，您可以在例如 SSH 插件中使用以下脚本：

```bash
hexdump -n 16 -e '4/4 "%08X" 1 "\n"' /dev/random
```

您也可以使用像这样的网站来生成所需的数据：

<https://www.random.org/cgi-bin/randbyte?nbytes=16&format=h>

确保您保留这些密钥的备份。如果需要重建系统而没有这些密钥的备份，您将无法与任何安全包含的设备通信。这可能意味着您需要对这些设备和您的控制器进行恢复出厂设置，才能重建您的 Z-Wave 网络。

> 注意：在多个安全类别之间共享密钥是一种安全风险，因此如果您选择自行配置这些密钥，请确保使它们唯一！

#### 选项 `s0_legacy_key`

S0 安全 Z-Wave 设备在加入网络之前需要一个网络密钥。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

#### 选项 `s2_access_control_key`

必须提供 `s2_access_control_key` 以便包含具有 S2 访问控制安全类别的设备。此安全类别在门锁和车库门开启器等设备中是必需的。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

#### 选项 `s2_authenticated_key`

必须提供 `s2_authenticated_key` 以便包含具有 S2 认证安全类别的设备。安全系统、传感器、照明等设备可以请求此安全类别。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

### 选项 `s2_unauthenticated_key`

必须提供 `s2_unauthenticated_key` 以便包含具有 S2 未认证安全类别的设备。这与 S2 认证相似，但没有验证包含了正确的设备。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

#### 选项 `lr_s2_access_control_key`

必须提供 `lr_s2_access_control_key` 以便包含使用 Z-Wave 长范围的设备。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

#### 选项 `lr_s2_authenticated_key`

必须提供 `lr_s2_authenticated_key` 以便包含使用 Z-Wave 长范围的设备。此配置选项是必需的，但如果未设置，插件将在启动时自动生成一个新密钥。

### 选项 `log_level`（可选）

此选项设置 Z-Wave JS 的日志级别。有效选项包括：

- silly
- debug
- verbose
- http
- info
- warn
- error

如果未指定 `log_level`，日志级别将设置为 Supervisor 中设置的级别。

### 选项 `log_to_file`（可选）

当启用此选项时，日志将写入 `/addon_configs/core_zwave_js` 文件夹，文件扩展名为 `.log`。

### 选项 `log_max_files`（可选）

当 `log_to_file` 为真时，Z-Wave JS 将为每一天创建一个日志文件。此选项允许您控制 Z-Wave JS 将保留的最大文件数量。

### 选项 `soft_reset`（可选）

此设置告诉插件如何处理 500 系列控制器的软重置：
1. 自动 - 插件将决定是否启用或禁用 500 系列控制器的软重置。这是默认选项，应该适用于大多数人。
2. 启用 - 将显式启用 500 系列控制器的软重置。
3. 禁用 - 将显式禁用 500 系列控制器的软重置。

### 选项 `emulate_hardware`（可选）

如果您没有 USB 适配器，您可以使用一个虚拟适配器进行测试。它将无法控制任何真实设备。

### 选项 `disable_controller_recovery`（可选）

此设置将禁用 Z-Wave JS 的自动恢复过程，当控制器似乎无响应时，将让控制器自行恢复（如果能够）。当控制器无响应时，命令将开始失败，节点可能会随机标记为死节点。如果控制器无法自行恢复，您需要重新启动插件以尝试恢复。在大多数情况下，用户不需要使用此功能，因此只有在您知道自己在做什么时，或被要求时才更改此设置。

### 选项 `disable_watchdog`（可选）

此设置将防止 Z-Wave JS 在支持的控制器上启用硬件看门狗。在大多数情况下，用户不需要使用此功能，因此只有在您知道自己在做什么时，或被要求时才更改此设置。

### 选项 `safe_mode`（可选）

此设置将网络置于安全模式，这可能会显著降低网络性能，但也可能有助于启动网络，以便您可以排查问题、获取日志等。在大多数情况下，用户不需要使用此功能，因此只有在您知道自己在做什么时，或被要求时才更改此设置。

### 选项 `network_key`（已弃用）

在插件的早期版本中，这是唯一需要的密钥。随着 zwave-js 中 S2 安全包含的引入，此选项已被弃用，取而代之的是 `s0_legacy_key`。如果仍然设置，`network_key` 值将在首次启动时迁移到 `s0_legacy_key`。

### 故障排除网络问题

插件中提供了几个可以帮助您排除网络问题和/或向 Home Assistant 或 Z-Wave JS 团队提供数据以帮助追踪问题的功能：

1. **更新日志级别：** 在打开 GitHub 问题时，将 `log_level` 配置选项设置为 `debug` 并捕获问题发生时的信息是极为有帮助的。
2. **记录到文件：** `log_to_file` 和 `log_max_files` 配置选项允许您启用并配置该功能。请注意，为了访问日志文件，您需要能够访问 HA 实例的文件系统，您可以使用文件编辑器、samba 或 ssh 插件等。
3. **访问 Z-Wave JS 缓存：** Z-Wave JS 将其发现的关于网络的信息存储在缓存文件中，以便您的设备在每次启动时不需要重新访谈。在某些情况下，打开 GitHub 问题时，您可能会被要求提供缓存文件。您可以在 `/addon_configs/core_zwave_js/cache` 中访问这些文件。请注意，为了访问缓存，您需要能够访问 HA 实例的文件系统，您可以使用文件编辑器、samba 或 ssh 插件等。
4. **更改软重置行为：** 默认情况下，插件将自动选择是否在启动时软重置控制器。在大多数情况下这不应该更改，但如果在故障排除问题时被要求进行更改，您可以使用 `soft_reset` 配置选项做到这一点。
5. **禁用控制器恢复：** 默认情况下，如果网络控制器似乎被阻塞，Z-Wave JS 将自动尝试将控制器恢复到健康状态。在大多数情况下这不应该更改，但如果在故障排除问题时被要求进行更改，您可以使用 `disable_controller_recovery` 配置选项做到这一点。
6. **启用安全模式：** 当 Z-Wave JS 启动出现问题时，有时很难获得有用的日志来排查问题。通过将 `safe_mode` 设置为 true，Z-Wave JS 可能能够在其无法启动的情况下成功启动。请注意，启用 `safe_mode` 会对网络性能产生负面影响，应谨慎使用。

## 已知问题和限制

- 您的硬件需要与 Z-Wave JS 库兼容

## 支持

有问题吗？

您有几个选项可以获得答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [Reddit 子论坛][reddit] 在 [/r/homeassistant][reddit]

如果您发现了 bug，请 [在我们的 GitHub 上报告问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[issue]: https://github.com/home-assistant/addons/issues
[reddit]: https://reddit.com/r/homeassistant