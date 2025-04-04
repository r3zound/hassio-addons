# rtl_433 Home Assistant 组件

## 关于

这个组件是优秀的 [rtl_433](https://github.com/merbanan/rtl_433) 项目的简单封装，它通过 [支持的 SDR 接收器](https://triq.org/rtl_433/HARDWARE.html) 接收无线传感器数据，解码并以多种格式输出，包括 JSON 和 MQTT。rtl_433 理解的无线传感器主要在 433.92 MHz、868 MHz、315 MHz、345 MHz 和 915 MHz ISM 频段上发送数据。

[查看 rtl_433 文档](https://triq.org/rtl_433)

## 它是如何工作的

这个组件唯一的功能是在 Home Assistant OS 监督者下运行 rtl_433。您所需要做的就是提供一个配置文件。

默认情况下，rtl_433 将接收到的数据打印到终端 - 由您来配置它以将数据发布到 MQTT，以便 Home Assistant 可以访问，这可以通过配置文件中的一行完成。

一旦您可以将 rtl_433 传感器数据输入到 MQTT，您需要帮助 Home Assistant 发现并理解这些数据。您可以通过多种方式做到这一点：

  * 在 HA 中手动配置 `sensors` 和 `binary_sensors` 并[将它们链接到 rtl_433 输出的适当 MQTT 主题](https://www.home-assistant.io/integrations/sensor.mqtt/)，
  * 手动或按计划运行 [rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/tree/master/examples/rtl_433_mqtt_hass.py) 脚本，以自动完成大部分配置，或
  * 安装 [rtl_433 MQTT 自动发现 Home Assistant 组件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433_mqtt_autodiscovery)，它为您运行 rtl_433_mqtt_hass.py。

## 前提条件

要使用此组件，您需要以下条件：

 1. [rtl_433 支持的 SDR 接收器](https://triq.org/rtl_433/HARDWARE.html)。

 2. 在插入 SDR 接收器的机器上运行的 Home Assistant OS。

 3. 一些 rtl_433 支持的无线传感器。支持的协议和设备的完整列表可以在 [rtl_433 的 README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。

## 安装

 1. 创建一个可以满足您需求的 rtl_433 配置文件。如果您在另一台计算机上进行此操作，可能会更好，这样您可以自由实验并迭代，直到得到一个好的配置。具体细节见下文。

 2. 使用适合您的任何方法（通过 Samba 组件、ssh/scp、文件编辑器组件等）将配置文件上传到 Home Assistant 的“/config”目录。

 3. 安装组件。

 5. 将您的 SDR 接收器插入运行该组件的机器。

 5. 启动组件。将在 `/config/rtl_433/` 中创建一个默认配置。要添加或编辑其他配置，请在该目录中创建多个 `.conf.template` 文件。

 6. 启动该组件并检查日志。

## 配置

对于“零配置”设置，安装 [Mosquitto 代理](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) 组件。虽然其他代理可能有效，但未经测试并需要手动设置。一旦安装了该组件，启动或重启 rtl_433 和 rtl_433_mqtt_autodiscovery 组件以开始捕获已知的 433 MHz 协议。

有关更高级的配置，请查看 rtl_433 源代码中包含的示例配置文件：[rtl_433.example.conf](https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf)

请注意，由于配置文件中包含 bash 变量，**美元符号和其他特殊的 shell 字符需要转义**。例如，要在配置文件中使用字面字符串 `$GPRMC`，请使用 `\$GPRMC`。

`retain` 选项控制 MQTT 的 `retain` 标志是否默认启用或禁用。可以通过在 `output` 设置中将 `retain` 设置为 `true` 或 `false` 来逐个无线电覆盖。

在手动配置时，假设您打算将 rtl_433 数据传入 Home Assistant，您需要在配置文件中指定的绝对最小内容是 [MQTT 连接和身份验证信息](https://triq.org/rtl_433/OPERATION.html#mqtt-output):

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY
```

rtl_433 默认监听 433.92MHz，但即使这正是您需要的，明确指定频率也是一个好主意，以避免混淆：

```
frequency   433.92M
```

您可能还想缩小 rtl_433 应该尝试解码的协议列表。完整列表可以在 [README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。假设您想监听 Acurite 592TXR 温湿度传感器：

```
protocol    40
```

最后，如果您决定使用 MQTT 自动发现脚本或组件，其文档建议将 rtl_433 输出的所有数据中的单位转换为 SI：

```
convert     si
```

假设您只有一个 USB 接收器连接且 rtl_433 能够自动找到它，我们得到了一个最小的 rtl_433 配置文件，如下所示：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY

frequency   433.92M
protocol    40

convert     si
```

请查看 [官方 rtl_433 文档](https://triq.org/rtl_433) 和 [配置文件示例](https://github.com/merbanan/rtl_433/tree/master/conf) 以获取更多信息。

## 感谢

这个组件基于 James Fry 的 [rtl4332mqtt Hass.IO 组件](https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt)，而该组件又基于 Chris Kacerguis 的项目：[https://github.com/chriskacerguis/honeywell2mqtt](https://github.com/chriskacerguis/honeywell2mqtt)，而该项目又基于 Marco Verleun 的 rtl2mqtt 镜像：[https://github.com/roflmao/rtl2mqtt](https://github.com/roflmao/rtl2mqtt)。