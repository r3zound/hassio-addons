# rtl_433 Home Assistant 插件

## 介绍

这个插件是优秀的 [rtl_433](https://github.com/merbanan/rtl_433) 项目的一个简单包装，能够通过 [支持的 SDR 接收器之一](https://triq.org/rtl_433/HARDWARE.html) 接收无线传感器数据，解码并以多种格式输出，包括 JSON 和 MQTT。rtl_433 理解的无线传感器主要在 433.92 MHz、868 MHz、315 MHz、345 MHz 和 915 MHz ISM 频段上发送数据。

[查看 rtl_433 文档](https://triq.org/rtl_433)

## 工作原理

这个插件唯一的功能是在 Home Assistant OS 监督下运行 rtl_433。你需要做的就是提供一个配置文件。

默认情况下，rtl_433 会将接收到的数据打印到终端——你可以配置它将数据发布到 MQTT，以便 Home Assistant 可以访问，这可以通过在配置文件中添加一行来完成。

一旦将 rtl_433 传感器数据传入 MQTT，你需要帮助 Home Assistant 发现并理解这些数据。你可以通过多种方式来实现：

  * 手动在 HA 中配置 `sensors` 和 `binary_sensors`，并 [将它们链接到 rtl_433 输出的适当 MQTT 主题](https://www.home-assistant.io/integrations/sensor.mqtt/)，
  * 手动或按计划运行 [rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/tree/master/examples/rtl_433_mqtt_hass.py) 脚本，以自动完成大部分配置，或者
  * 安装 [rtl_433 MQTT 自动发现 Home Assistant 插件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433_mqtt_autodiscovery)，该插件为你运行 rtl_433_mqtt_hass.py。

## 前提条件

 使用此插件，你需要以下条件：

 1. [一个受 rtl_433 支持的 SDR 接收器](https://triq.org/rtl_433/HARDWARE.html)。

 2. 在插入 SDR 接收器的机器上运行 Home Assistant OS。

 3. 一些受 rtl_433 支持的无线传感器。完整支持的协议和设备列表可以在 [rtl_433 的 README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“受支持的设备协议”部分找到。

## 安装

 1. 创建一个符合你需求的 rtl_433 配置文件。如果在运行 Home Assistant OS 的计算机以外的计算机上执行此操作，可能会效果更好，这样你可以自由实验并迭代，直到得到一个有效的配置。有关更多详细信息，请参阅下面内容。

 2. 使用你选择的方法（通过 Samba 插件、ssh/scp、文件编辑器插件等）将配置文件上传到 Home Assistant 的“/config”目录中。

 3. 安装插件。

 5. 将 SDR 接收器连接到运行该插件的机器上。

 5. 启动插件。默认配置将创建在 `/config/rtl_433/` 中。要添加或编辑其他配置，请在该目录中创建多个 `.conf.template` 文件。

 6. 启动插件并检查日志。

## 配置

要实现“零配置”设置，请安装 [Mosquitto broker](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) 插件。虽然其他代理可能会工作，但未进行测试并需手动设置。插件安装后，启动或重启 rtl_433 和 rtl_433_mqtt_autodiscovery 插件以开始捕获已知的 433 MHz 协议。

如果需要更高级的配置，可以查看 rtl_433 源代码中包含的示例配置文件：[rtl_433.example.conf](https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf)

请注意，由于配置文件中包含 bash 变量，**美元符号和其他特殊 shell 字符需要转义**。例如，要在配置文件中使用字面字符串 `$GPRMC`，应使用 `\$GPRMC`。

`retain` 选项控制 MQTT 的 `retain` 标志是否默认启用或禁用。通过在 `output` 设置中将 `retain` 设置为 `true` 或 `false` 可以逐个电台覆盖此设置。

手动配置时，假设你打算将 rtl_433 数据导入 Home Assistant，配置文件中需要指定的绝对最小内容是 [MQTT 连接和认证信息](https://triq.org/rtl_433/OPERATION.html#mqtt-output):

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY
```

rtl_433 默认收听 433.92MHz，但即使这就是你所需的，显式指定频率也可能是个好主意，以避免混淆：

```
frequency   433.92M
```

你可能还想缩小 rtl_433 应尝试解码的协议列表。完整列表可以在 [README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“受支持的设备协议”部分找到。假设你想监听 Acurite 592TXR 温度/湿度传感器：

```
protocol    40
```

最后，如果你决定使用 MQTT 自动发现脚本或插件，其文档建议将 rtl_433 输出的所有数据中的单位转换为 SI：

```
convert     si
```

假设你只连接了一个 USB 接收器，并且 rtl_433 能够自动找到它，我们得出的最小 rtl_433 配置文件如下所示：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY

frequency   433.92M
protocol    40

convert     si
```

请查看 [官方 rtl_433 文档](https://triq.org/rtl_433) 和 [配置文件示例](https://github.com/merbanan/rtl_433/tree/master/conf) 以获取更多信息。

## 感谢

这个插件基于 James Fry 的 [rtl4332mqtt Hass.IO 插件](https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt)，而后者又基于 Chris Kacerguis 的项目：[https://github.com/chriskacerguis/honeywell2mqtt](https://github.com/chriskacerguis/honeywell2mqtt)，后者又基于 Marco Verleun 的 rtl2mqtt 镜像：[https://github.com/roflmao/rtl2mqtt](https://github.com/roflmao/rtl2mqtt)。