# rtl_433 Home Assistant 插件

## 关于

这个插件是优秀的 [rtl_433](https://github.com/merbanan/rtl_433) 项目的一个简单封装，它通过 [一个支持的 SDR 接收器](https://triq.org/rtl_433/HARDWARE.html) 接收无线传感器数据，并以多种格式解码和输出，包括 JSON 和 MQTT。 rtl_433 理解的无线传感器主要在 433.92 MHz、868 MHz、315 MHz、345 MHz 和 915 MHz ISM 频段传输数据。

[查看 rtl_433 文档](https://triq.org/rtl_433)

## 工作原理

这个插件唯一的功能是在 Home Assistant OS 监督下运行 rtl_433。你只需要提供一个配置文件。

默认情况下，rtl_433 将接收到的数据输出到终端 - 你需要配置它以将数据发布到 MQTT，以便 Home Assistant 可以访问，这可以通过在配置文件中添加一行来完成。

一旦你将 rtl_433 传感器数据引入 MQTT，你需要帮助 Home Assistant 发现和理解这些数据。你可以通过多种方式做到这一点：

  * 手动配置 HA 中的 `sensors` 和 `binary_sensors`，并 [将它们链接到来自 rtl_433 的相应 MQTT 主题](https://www.home-assistant.io/integrations/sensor.mqtt/)，
  * 手动运行 [rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/tree/master/examples/rtl_433_mqtt_hass.py) 脚本或按计划运行，以自动执行大部分配置，或
  * 安装 [rtl_433 MQTT 自动发现 Home Assistant 插件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433_mqtt_autodiscovery)，它为你运行 rtl_433_mqtt_hass.py。

## 先决条件

 要使用这个插件，你需要以下内容：

 1. [一个受 rtl_433 支持的 SDR 接收器](https://triq.org/rtl_433/HARDWARE.html)。

 2. 在插入 SDR 接收器的机器上运行 Home Assistant OS。

 3. 一些受 rtl_433 支持的无线传感器。完整的支持协议和设备列表可以在 [rtl_433 的 README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。

## 安装

 1. 创建一个执行你所需操作的 rtl_433 配置文件。如果你在另一台计算机上完成此操作，可能效果会更好，便于你自由实验和迭代，直到找到一个有效的配置。请参见下面的详细信息。

 2. 使用适合你的任何方法（通过 Samba 插件、ssh/scp、文件编辑插件等）将配置文件上传到 Home Assistant 的 "/config" 目录。

 3. 安装插件。

 4. 将你的 SDR 接收器插入运行插件的机器。

 5. 启动插件。默认配置将创建在 `/config/rtl_433/` 中。要添加或编辑其他配置，可以在该目录中创建多个 `.conf.template` 文件。

 6. 启动插件并检查日志。

## 配置

对于“零配置”设置，安装 [Mosquitto broker](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) 插件。虽然其他代理可能有效，但未经过测试，且将需要手动设置。一旦插件安装完成，启动或重启 rtl_433 和 rtl_433_mqtt_autodiscovery 插件以开始捕获已知的 433 MHz 协议。

有关更多高级配置，请查看 rtl_433 源代码中包含的示例配置文件：[rtl_433.example.conf](https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf)

请注意，由于配置文件中包含 bash 变量，**美元符号和其他特殊 shell 字符需要转义**。例如，要在配置文件中使用字面字符串 `$GPRMC`，请使用 `\$GPRMC`。

`retain` 选项控制 MQTT 的 `retain` 标志默认是启用还是禁用。可以通过在 `output` 设置中将 `retain` 设置为 `true` 或 `false` 在每个无线电的基础上覆盖。

在手动配置时，假设你打算将 rtl_433 数据引入 Home Assistant，配置文件中绝对需要指定的最少信息是 [MQTT 连接和认证信息](https://triq.org/rtl_433/OPERATION.html#mqtt-output)：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY
```

rtl_433 默认收听 433.92MHz，但即使这是你需要的，明确指定频率通常也是个好主意，以避免混淆：

```
frequency   433.92M
```

你或许还想缩小 rtl_433 应尝试解码的协议列表。完整列表可以在 [README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。假设你想监听 Acurite 592TXR 温湿度传感器：

```
protocol    40
```

最后但并非最不重要的是，如果你决定使用 MQTT 自动发现脚本或插件，其文档建议将 rtl_433 输出的所有数据中的单位转换为 SI：

```
convert     si
```

如果你仅连接一个 USB 接收器，并且 rtl_433 能够自动找到它，我们将得到一个最小的 rtl_433 配置文件如下所示：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY

frequency   433.92M
protocol    40

convert     si
```

请查看 [官方 rtl_433 文档](https://triq.org/rtl_433) 和 [配置文件示例](https://github.com/merbanan/rtl_433/tree/master/conf) 获取更多信息。

## 感谢

这个插件基于 James Fry 的 [rtl4332mqtt Hass.IO 插件](https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt)，而该插件又基于 Chris Kacerguis 在这里的项目: [https://github.com/chriskacerguis/honeywell2mqtt](https://github.com/chriskacerguis/honeywell2mqtt)，它又基于 Marco Verleun 的 rtl2mqtt 镜像:[https://github.com/roflmao/rtl2mqtt](https://github.com/roflmao/rtl2mqtt)。