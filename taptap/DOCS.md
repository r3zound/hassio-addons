# Home Assistant 附加组件：TapTap - Tigo CCA 到 MQTT

## 如何使用

- 需要 MQTT 服务器（您可以使用 Home Assistant 的 Mosquitto 代理附加组件）
- 需要配置好的 Home Assistant MQTT 集成
- 需要 Modbus 转以太网转换器（可选 Modbus 转 USB/串口适配器）
    - 设置 Modbus 通信为 38400b，数据位 8，停止位 1，流控制 无
    - 设置转换器模式为 Modbus TCP 服务器
    - 记住转换器的 IP 地址和 TCP 端口，以便稍后在附加组件配置中设置
- Modbus 转换器必须连接到 Tigo CCA 网关
  - 将转换器连接到 Tigo CCA 网关上标记为 Gateway 的连接器
  - 此连接器上已经有从连接的 Tigo Tap 引出的电缆
  - 将转换器与来自 Tigo Tap 的现有电缆连接
  - 使用 3 根电缆 - A、B 和接地，将 A 连接到 A，B 连接到 B，接地连接到接地
  - 电缆应尽可能短 - 将转换器安装在靠近 Tigo CCA 网关的位置