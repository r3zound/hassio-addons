# Home Assistant 插件：Silicon Labs 多协议

**注意**：此插件具有自动为 Home Assistant Yellow、SkyConnect 和 Connect ZBT-1 安装正确固件的选项。请按照[此指南](https://github.com/NabuCasa/silabs-firmware/wiki/Flash-Silicon-Labs-radio-firmware-manually)将固件更改为与其他 Zigbee 软件兼容的版本。

## 安装

按照以下步骤在系统上安装插件：

1. 在 Home Assistant 前端导航到 **设置** -> **插件、备份与主管** -> **插件商店**。
2. 找到 "Silicon Labs 多协议" 插件并点击它。
3. 点击 "安装" 按钮。

## 如何使用

该插件需要通过串行端口访问的 Silicon Labs 无线模块（如 Yellow 上的模块或大多数 USB 无线适配器）。

固件加载后，按照以下步骤操作：

1. 在插件配置选项卡中选择正确的 `device`，并按 `保存`。
   在 Home Assistant Yellow 上使用 `/dev/ttyAMA1`。
2. 启动插件。

**注意**：只有在启用 OpenThread 时，Web 前端才可以访问（见下文）。

### Zigbee

要与 ZHA 一起使用 Zigbee，请按以下方式配置集成：

1. 记下/复制插件的主机名（例如 `c8f00288-silabs-multiprotocol`）。
2. 将 Zigbee 家居自动化 (ZHA) 集成添加到 Home Assistant Core。
3. 当系统询问串行设备路径时，选择 `手动输入`。
4. 选择 `EZSP` 作为无线类型。
5. 作为串行路径，输入 `socket://<上面的主机名>:9999`。
6. 端口速度和流量控制无关紧要。
7. 按 `提交`。添加 ZHA 应该成功，你应该能够像使用任何其他支持的无线类型一样使用 ZHA。

### OpenThread

此时，OpenThread 支持还是实验性的。此插件使你的 Home Assistant 安装成为 OpenThread 边界路由器 (OTBR)。一个名为 `otbr` 的 Home Assistant Core 的基本集成正在开发中。

要使用 OTBR，请在配置选项卡中启用它并重新启动插件。Home Assistant 应该会自动发现 OpenThread 边界路由器并按需进行配置。

### Web 界面（高级）

OTBR 还提供了一个 Web 界面。但是，Web 界面有一些限制（例如，形成网络不会生成一个能路由的 IPv6 前缀，这会导致第一次插件重启时 IPv6 地址发生变化）。仍然可以启用 Web 界面用于调试目的。确保在主机接口上暴露 Web UI 端口和 REST API 端口（后者需要在 8081 端口）。为此，点击 "显示禁用的端口" 并在 OpenThread Web UI 中输入一个端口（例如 8080），在 OpenThread REST API 端口字段中输入 8081）。

### 自动固件升级

如果设置了 `autoflash_firmware` 配置，插件将在检测到 Home Assistant Connect ZBT-1/SkyConnect 或 Home Assistant Yellow 时自动安装或更新到 RCP Multi-PAN 固件。

**注意**：当前切换回仅 Zigbee（EmberZNet）固件需要手动步骤。你可以在 Nabu Casa Silicon Labs 固件库 Wiki 上找到关于手动刷新 [Silicon Labs 无线固件](https://github.com/NabuCasa/silabs-firmware/wiki/Flash-Silicon-Labs-radio-firmware-manually) 的指南。

## 配置

插件配置：

| 配置项            | 描述                                                |
|-------------------|-----------------------------------------------------|
| device (必填)     | Silicon Labs 无线设备连接的串行服务               |
| baudrate          | 串口波特率（取决于固件）                           |
| flow_control      | 是否启用硬件流控制（取决于固件）                 |
| autoflash_firmware| 自动安装/更新固件（Home Assistant Connect ZBT-1/SkyConnect/Yellow） |
| network_device    | CPC 守护进程可以找到 Silicon Labs 无线设备的主机和端口（优先于 device） |
| cpcd_trace        | 协处理器通信追踪（在日志中追踪）                  |
| otbr_enable       | 启用 OpenThread 边界路由器                        |
| otbr_log_level    | 设置 OpenThread 边界路由器代理的日志级别        |
| otbr_firewall     | 启用 OpenThread 边界路由器防火墙以阻止不必要的流量 |

## 架构

该插件在内部运行几个服务。此架构图显示了插件当前实现的内容。

![Silicon Labs 多协议插件架构](https://raw.githubusercontent.com/home-assistant/addons/master/silabs-multiprotocol/images/architecture.png)

## 支持

有问题吗？

你有几种选择来获取答案：

- [Home Assistant Discord 聊天服务器][discord]。
- Home Assistant [社区论坛][forum]。
- 加入 [/r/homeassistant][reddit] 的 [Reddit 子版块][reddit]。

如果你发现了一个错误，请 [在我们的 GitHub 上打开一个问题][issue]。

[discord]: https://discord.gg/c5DvZ4e
[forum]: https://community.home-assistant.io
[reddit]: https://reddit.com/r/homeassistant
[issue]: https://github.com/home-assistant/addons/issues