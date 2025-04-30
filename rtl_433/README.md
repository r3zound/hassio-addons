# rtl_433 Home Assistant 插件

## 关于

这个插件是一个简单的包装层，围绕出色的[rtl_433](https://github.com/merbanan/rtl_433)项目，该项目通过[支持的SDR接收器之一](https://triq.org/rtl_433/HARDWARE.html)接收无线传感器数据，解码并以多种格式输出，包括JSON和MQTT。rtl_433理解的无线传感器主要在433.92 MHz、868 MHz、315 MHz、345 MHz和915 MHz ISM频段上发射数据。

[查看rtl_433文档](https://triq.org/rtl_433)

## 工作原理

这个插件唯一的功能是在Home Assistant OS监督下运行rtl_433。你需要做的就是提供一个配置文件。

默认情况下，rtl_433会将接收到的数据打印到终端——你需要配置它以将数据发布到MQTT，以便Home Assistant可以访问，这可以通过在配置文件中添加一行来完成。

一旦你通过MQTT获取了rtl_433传感器数据，你需要帮助Home Assistant发现和理解这些数据。你可以通过多种方式做到这一点：

  * 手动在HA中配置`sensors`和`binary_sensors`，并[将它们链接到来自rtl_433的适当MQTT主题](https://www.home-assistant.io/integrations/sensor.mqtt/)，
  * 手动运行[rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/tree/master/examples/rtl_433_mqtt_hass.py)脚本，或按计划自动配置大部分设置，或者
  * 安装[rtl_433 MQTT自动发现Home Assistant插件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433_mqtt_autodiscovery)，它为你运行rtl_433_mqtt_hass.py。

## 先决条件

要使用这个插件，你需要以下内容：

 1. [一个受rtl_433支持的SDR接收器](https://triq.org/rtl_433/HARDWARE.html)。

 2. 在插入SDR接收器的机器上运行Home Assistant OS。

 3. 一些受rtl_433支持的无线传感器。受支持的协议和设备的完整列表可以在[rtl_433的README](https://github.com/merbanan/rtl_433/blob/master/README.md)的“受支持设备协议”部分找到。

## 安装

 1. 创建一个满足你需求的rtl_433配置文件。如果你在另一台机器上进行此操作，可能会更有效，以便你可以自由试验并迭代，直到找到合适的配置。下面有更多详细信息。

 2. 使用适合你的方法（通过Samba插件、ssh/scp、文件编辑器插件等）将配置文件上传到Home Assistant的“/config”目录。

 3. 安装插件。

 5. 将SDR接收器插入运行插件的机器。

 5. 启动插件。默认配置将在`/config/rtl_433/`中创建。要添加或编辑其他配置，请在该目录中创建多个`.conf.template`文件。

 6. 启动插件并检查日志。

## 配置

对于“零配置”设置，安装[Mosquitto代理](https://github.com/home-assistant/addons/blob/master/mosquitto/DOCS.md)插件。虽然其他代理可能有效，但它们未经测试，并且需要手动设置。一旦安装了插件，启动或重启rtl_433和rtl_433_mqtt_autodiscovery插件以开始捕获已知的433 MHz协议。

对于更高级的配置，可以查看rtl_433源代码中包含的示例配置文件：[rtl_433.example.conf](https://github.com/merbanan/rtl_433/blob/master/conf/rtl_433.example.conf)

请注意，由于配置文件中包含bash变量，**美元符号和其他特殊shell字符需要转义**。例如，要在配置文件中使用字面字符串`$GPRMC`，请使用`\$GPRMC`。

`retain`选项控制MQTT的`retain`标志是否默认启用或禁用。可以通过在`output`设置中将`retain`设置为`true`或`false`在每个接收器的基础上覆盖它。

在手动配置时，假设您打算将rtl_433数据引入Home Assistant，您在配置文件中需要指定的绝对最小值是[MQTT连接和身份验证信息](https://triq.org/rtl_433/OPERATION.html#mqtt-output)：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY
```

rtl_433默认监听433.92MHz，但即使那是你需要的，也最好明确指定频率以避免混淆：

```
frequency   433.92M
```

你可能还想缩小rtl_433应尝试解码的协议列表。完整列表可以在[README](https://github.com/merbanan/rtl_433/blob/master/README.md)的“受支持设备协议”部分找到。假设你想监听Acurite 592TXR温湿度传感器：

```
protocol    40
```

最后，如果你决定使用MQTT自动发现脚本或插件，其文档建议将所有来自rtl_433的数据中的单位转换为SI：

```
convert     si
```

假设你只有一个USB接收器连接并且rtl_433能够自动找到它，我们得到了一个看起来如下的最小rtl_433配置文件：

```
output      mqtt://HOST:PORT,user=XXXX,pass=YYYYYYY

frequency   433.92M
protocol    40

convert     si
```

有关更多信息，请查看[官方rtl_433文档](https://triq.org/rtl_433)和[配置文件示例](https://github.com/merbanan/rtl_433/tree/master/conf)。

## 信誉

这个插件基于James Fry的[rtl4332mqtt Hass.IO插件](https://github.com/james-fry/hassio-addons/tree/master/rtl4332mqtt)，后者又基于Chris Kacerguis的项目：[https://github.com/chriskacerguis/honeywell2mqtt](https://github.com/chriskacerguis/honeywell2mqtt)，而后者又基于Marco Verleun的rtl2mqtt镜像：[https://github.com/roflmao/rtl2mqtt](https://github.com/roflmao/rtl2mqtt)。