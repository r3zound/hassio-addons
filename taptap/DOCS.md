# Li Tin O`ve Weedle Assistant 增强组件: TapTap - Tigo CCA 到 MQTT

此增强组件基于 [taptap](https://github.com/litinoveweedle/taptap) 项目，该项目对 Tigo TAP 和 CCA 组件之间的协议进行了逆向工程。我能够创建 [mqtt 桥接](https://github.com/litinoveweedle/taptap-mqtt) 并将其打包为 Home Assistant 增强组件 TapTap。该增强组件允许从 Tigo 光伏优化器模块获取详细信息，完全是本地的 - 无需 Tigo 云，刷新时间为 10s。该组件使用 Home Assistant MQTT 自动发现功能，因此它会自动设置 HA 中提供的所有传感器。:wink:

## 安装先决条件

  - MQTT 代理，例如 [Mosquitto 增强组件](https://www.home-assistant.io/integrations/mqtt/#setting-up-a-broker)
  - Home Assistant [MQTT 集成](https://www.home-assistant.io/integrations/mqtt/)
  - Modbus RS485 到以太网转换器，例如 [WaveShare 模型](https://www.waveshare.com/product/iot-communication/wired-comm-converter/ethernet-to-uart-rs232-rs485.htm)

## Modbus 到以太网连接到 Tigo CCA

Modbus 到以太网转换器必须与 [Tigo CCA 网关](https://cs.tigoenergy.com/product/cloud-connect-advanced) 互连：
  1. 将转换器连接到 Tigo CCA 网关上名为 Gateway 的接口
  2. 此接口中将已有从您屋顶连接的 Tigo Tap 的线缆
  3. 将转换器与 Tigo Tap 的现有线缆并联连接
  4. 使用 3 根线 - A、B 和地线：将 A 连接到 A，B 连接到 B，地线连接到地线
  5. 线缆应尽可能短 - 将您的转换器安装在 Tigo CCA 网关附近

设置 Modbus 到以太网转换器：
  1. 将转换器连接到您的局域网，使其能够从 Home Assistant 访问
  2. 为转换器分配 IP 地址（自动使用 DHCP 或手动静态地址）
  3. 设置 Modbus 通信为 38400b，数据位 8，停止位 1，流控 无
  4. 将转换器模式设置为 Modbus TCP 服务器    
  5. 记住转换器的 IP 地址和 TCP 端口，以便稍后在增强组件配置中设置

## 增强组件安装

在您的 Home Assistant 中安装 taptap 增强组件

1. 点击下面的 Home Assistant My 按钮以打开您 Home Assistant 实例中的增强组件。

   [![在您的 Home Assistant 实例中打开此增强组件。][addon-badge]][addon]

2. 点击“安装”按钮以安装该增强组件。
3. 启动“示例”增强组件。
4. 检查“示例”增强组件的日志以查看其运行状态。

## 配置

taptap 增强组件示例配置：

```yaml
mqtt_server: 192.168.1.2
mqtt_port: 1883
mqtt_qos: 1
mqtt_timeout: 5
mqtt_user: mqttuser
mqtt_pass: mqttpass
taptap_port: 502
taptap_module_ids: 2,3,4,5,6,7,8,9,11,12,13,14,15,16,17,18
taptap_module_names: A01,A02,A03,A04,A05,A06,A07,A08,A09,A10,A11,A12,A13,A14,A15,A16
taptap_topic_prefix: taptap
taptap_topic_name: tigo
taptap_update: 10
taptap_timeout: 60
ha_entity_availability: true
ha_discovery_prefix: homeassistant
ha_birth_topic: homeassistant/status
taptap_address: 192.168.1.50
```

### 选项: `mqtt_server`

MQTT 代理的 IP 地址或完全合格域名（FQDN）。如果您运行的是 Mosquitto 增强组件，则它将是您的 HomeAssistant 的 IP 地址。

### 选项: `mqtt_port`

MQTT 代理的 TCP 端口，默认值为 `1883`。

### 选项: `mqtt_qos`

MQTT QoS 配置 - 请参考 Home Assistant MQTT 文档，默认值为 `1`。

### 选项: `mqtt_timeout`

MQTT 代理连接超时 - 请参考 Home Assistant MQTT 文档，默认值为 `5`。

### 选项: `mqtt_user`

连接到服务器的 MQTT 代理用户名。

### 选项: `mqtt_pass`

连接到服务器的 MQTT 代理密码。

### 选项: `taptap_serial`

如果您使用 Modbus 到 USB/串行转换器连接到 Home Assistant 服务器，此项将是其设备文件（可能是 /dev/ttyUSB0 或 /dev/ttyACM0）。如果您使用 Modbus 到 Ethernet 转换器，则此项不需要填写！

### 选项: `taptap_address`

如果您使用 Modbus 到 Ethernet 转换器连接到 Home Assistant 服务器，此项将是其 IP 地址。如果您使用 Modbus 到串行/USB 转换器，则此项不需要填写！

### 选项: `taptap_port`

如果您使用 Modbus 到 Ethernet 转换器连接到 Home Assistant 服务器，此项将是其 TCP 端口，默认值为 `502`。

### 选项: `taptap_module_ids`

以逗号分隔的 Tigo 模块 ID 列表，因为这些是通过 Modbus 通信的。这些 ID 通常从 2 开始，每个下一个模块增加 1。如果您用另一个新模块替换一个 Tigo 模块，它将获得新 ID。如果从未知 ID（未列出在此）接收到任何消息，增强组件将记录该事件。

### 选项: `taptap_module_names`

以逗号分隔的 Tigo 模块名称列表，您希望在 Home Assistant 中相应实体名称中看到的名称。按与 ID 相同的顺序输入。

### 选项: `taptap_topic_prefix`

用于在 MQTT 中发布消息的主题前缀，以便 Home Assistant 可以读取这些消息，默认值为 `taptap`。通常没有必要更改此设置。

### 选项: `taptap_topic_name`

用于在 MQTT 中发布消息的主题名称，以便 Home Assistant 可以读取这些消息，默认值为 `tigo`。该名称还将在 Home Assistant taptap 设备和实体的名称中使用。

### 选项: `taptap_update`

Home Assistant 实体更新的频率（秒），默认值为 `10`。

### 选项: `taptap_timeout`

如果在节点的最后给定秒数内未接收到消息，并且“节点离线时实体不可用”设置为 true，则相应实体将被设置为不可用状态。

### 选项: `ha_entity_availability`

如果设置为 true，则如果在由“可用性超时”指定的时间内未收到任何给定模块的消息，相应实体将被设置为不可用状态。

### 选项: `ha_discovery_prefix`

MQTT 前缀，Home Assistant 订阅用于自动发现新设备和实体。请参考 Home Assistant MQTT 文档，默认值为：`homeassistant`。通常没有必要更改此设置。

### 选项: `ha_birth_topic`

MQTT 前缀，Home Assistant 在上线时宣布。请参考 Home Assistant MQTT 文档，默认值为：`homeassistant/status`。通常没有必要更改此设置。

## 版本更新 & 发布

发布基于 [语义版本控制][semver]，使用格式 `MAJOR.MINOR.PATCH`。简单来说，版本将根据以下情况递增：

- `MAJOR`: 不兼容或重大变更。
- `MINOR`: 向后兼容的新功能和增强。
- `PATCH`: 向后兼容的错误修复和软件包更新。

## 支持

有问题吗？

您有几种选择可以获得答案：

- Home Assistant [社区论坛][forum]。
- 您也可以在这里 [提出问题][issue] GitHub。

## 作者 & 贡献者

此存储库的最初设置由 [Li Tin O`ve Weedle][litin] 完成。

## 许可证

Apache 2.0

版权所有 (c) 2023 Dominik Strnad

[addon-badge]: https://my.home-assistant.io/badges/supervisor_addon.svg
[addon]: https://my.home-assistant.io/redirect/supervisor_addon/?addon=a0d7b954_example&repository_url=https%3A%2F%2Fgithub.com%2Flitinoveweedle%2Fhassio-addons
[contributors]: https://github.com/litinoveweedle/hassio-addons/graphs/contributors
[forum]: https://community.home-assistant.io/t/tigo-optimizer-local-monitoring-without-cloud-now-possible/869754
[litin]: https://github.com/litinoveweedle
[issue]: https://github.com/litinoveweedle/hassio-addons-dev/issues
[semver]: http://semver.org/spec/v2.0.0.html