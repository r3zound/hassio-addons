# rtl_433 Home Assistant 插件

## 关于

这个插件是一个简单的封装，围绕出色的 [rtl_433](https://github.com/merbanan/rtl_433) 项目，它通过 [支持的SDR接收器](https://triq.org/rtl_433/HARDWARE.html) 接收无线传感器数据，解码并以多种格式（包括JSON和MQTT）输出。rtl_433 理解的无线传感器主要在 433.92 MHz、868 MHz、315 MHz、345 MHz 和 915 MHz ISM 频段上传输数据。

[查看 rtl_433 文档](https://triq.org/rtl_433)

## 工作原理

这个插件唯一的功能是在 Home Assistant OS 管理器下运行 rtl_433。您只需提供一个配置文件。

默认情况下，rtl_433 会将接收的数据打印到终端 - 您需要配置它将数据发布到 MQTT，以便 Home Assistant 可以访问，这可以通过配置文件中的一行完成。

一旦您将rtl_433传感器数据放入MQTT，您需要帮助Home Assistant发现并理解这些数据。您可以通过多种方式做到这一点：

  * 在HA中手动配置 `sensors` 和 `binary_sensors` 并 [将它们链接到从rtl_433发出的相应MQTT主题](https://www.home-assistant.io/integrations/sensor.mqtt/)，
  * 手动或定期运行 [rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/tree/master/examples/rtl_433_mqtt_hass.py) 脚本，以自动处理大部分配置，或
  * 安装 [rtl_433 MQTT自动发现Home Assistant插件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433_mqtt_autodiscovery)，它会为您运行 rtl_433_mqtt_hass.py。

## 先决条件

要使用这个插件，您需要以下内容：

 1. [一个被rtl_433支持的SDR接收器](https://triq.org/rtl_433/HARDWARE.html)。

 2. 在插入SDR接收器的机器上运行的Home Assistant OS。

 3. 一些被rtl_433支持的无线传感器。支持的协议和设备的完整列表可以在 [rtl_433的README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。

## 安装

 1. 创建一个符合您需求的rtl_433配置文件。在运行Home Assistant OS的计算机以外的其他计算机上进行此操作可能效果更好，这样您可以自由实验，并迭代直到找到一个良好的配置。请参见下面的更多详细信息。

 2. 使用适合您的方法（通过Samba插件、ssh/scp、文件编辑器插件等）将配置文件上传到Home Assistant的“/config”目录中。

 3. 安装该插件。

 5. 将您的SDR接收器插入运行插件的机器。

 5. 启动插件。默认配置将会创建在 `/config/rtl_433/` 中。要添加或编辑其他配置，请在该目录中创建多个 `.conf.template` 文件。

 6. 启动插件并检查日志。

## 配置

对于“零配置”的设置，安装 [Mosquitto broker](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md) 插件。虽然其他代理也可能工作，但它们未经过测试，并且需要手动设置。安装插件后，启动或重启 rtl_433 和 rtl_433_mqtt_autodiscovery 插件以开始捕获已知的433 MHz协议。

对于更高级的配置，可以查看rtl_433源代码中包含的示例配置文件：[rtl_433.example.conf](https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf)

请注意，由于配置文件中包含bash变量，**美元符号和其他特殊的shell字符需要转义**。例如，要在配置文件中使用字面字符串 `$GPRMC`，请使用 `\$GPRMC`。

`retain` 选项控制 MQTT 的 `retain` 标志默认是启用还是禁用。可以通过在 `output` 设置中将 `retain` 设置为 `true` 或 `false` 来逐个无线电覆盖。

在手动配置时，假设您希望将 rtl_433 数据导入 Home Assistant，您在配置文件中需要指定的绝对最小内容是 [MQTT连接和身份验证信息](https://triq.org/rtl_433/OPERATION.html#mqtt-output):

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY
```

rtl_433 默认监听在 433.92MHz，但即使这正是您需要的，显式指定频率可能也是个好主意，以避免混淆：

```
frequency   433.92M
```

您可能还希望缩小 rtl_433 应该尝试解码的协议列表。完整列表可以在 [README](https://github.com/merbanan/rtl_433/blob/master/README.md) 的“支持的设备协议”部分找到。假设您想监听 Acurite 592TXR 温度/湿度传感器：

```
protocol    40
```

最后但并非最不重要的是，如果您决定使用 MQTT 自动发现脚本或插件，其文档建议将所有来自 rtl_433 的数据单位转换为SI：

```
convert     si
```

假设您只有一个USB接收器，并且 rtl_433 能够自动找到它，我们得到了一个最小的 rtl_433 配置文件，看起来像这样：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY

frequency   433.92M
protocol    40

convert     si
```

请查看 [官方 rtl_433 文档](https://triq.org/rtl_433) 和 [配置文件示例](https://github.com/merbanan/rtl_433/tree/master/conf) 以获取更多信息。

## 贡献

这个插件基于James Fry的 [rtl4332mqtt Hass.IO插件](https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt)，后者又基于Chris Kacerguis的项目：[https://github.com/chriskacerguis/honeywell2mqtt](https://github.com/chriskacerguis/honeywell2mqtt)，而这个项目又是基于Marco Verleun的rtl2mqtt形象：[https://github.com/roflmao/rtl2mqtt](https://github.com/roflmao/rtl2mqtt)。