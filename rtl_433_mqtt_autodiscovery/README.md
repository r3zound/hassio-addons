# rtl_433 MQTT 自动发现 Home Assistant 插件

## 关于

这个插件是一个简单的封装，围绕 [rtl_433_mqtt_hass.py](https://github.com/merbanan/rtl_433/blob/a20cd1a62caa52dad97e4a99f8373b2fba3986d9/examples/rtl_433_mqtt_hass.py) 脚本，该脚本是优秀的 [rtl_433](https://github.com/merbanan/rtl_433) 项目的一部分。它帮助 Home Assistant 发现和解释通过 rtl_433 发布到 MQTT 的传感器数据。

rtl_433 是一个软件包，通过 [支持的 SDR 杆](https://triq.org/rtl_433/HARDWARE.html) 接收无线传感器数据，解码并以多种格式输出，包括 JSON 和 MQTT。rtl_433 理解的无线传感器的数据主要在 433.92 MHz、868 MHz、315 MHz、345 MHz 和 915 MHz ISM 频段上进行传输。

## 这个脚本支持哪些传感器/设备？

该脚本在 rtl_433 的输出中查找特定的数据位，以确定数据来自什么类型的传感器，并帮助 Home Assistant 进行适当的处理。

更具体地，该脚本在 rtl_433 的事件数据中查找以下键：
```
alarm
battery_ok
depth_cm
gust_speed_km_h
gust_speed_m_s
humidity
lux
moisture
noise
power_W
pressure_hPa
rain_in
rain_mm
rain_mm_h
rain_rate_in_h
rssi
snr
storm_dist
strike_count
strike_distance
tamper
temperature_1_C
temperature_2_C
temperature_C
temperature_F
uv
wind_avg_km_h
wind_avg_m_s
wind_avg_mi_h
wind_dir_deg
wind_max_m_s
wind_speed_km_h
wind_speed_m_s
```

在上述键没有出现的情况下，脚本会忽略事件来自的设备，并不会通知 Home Assistant。

### 如何检查我的传感器是否受支持？

找出是否受支持的一种方法是在安装 Home Assistant 的操作系统以外的计算机上，使用连接的 SDR 杆运行 rtl_433，并使用 `-F json` 命令行参数，检查 rtl_433 输出的事件内容。如果未看到任何上述的键，则该脚本将无法为该特定传感器发送自动发现信息到 HA。

### 如果我的传感器不受支持，我该怎么办？

您可以使用其中一个 MQTT HA 集成手动配置 `binary_sensor` 或 `sensor` 或设备触发器等。有关详细信息，请参见 [文档](https://www.home-assistant.io/integrations/#search/mqtt) 并搜索 [HA 论坛](https://community.home-assistant.io/search?q=mqtt%20sensor)。

## 工作原理

此插件的全部功能就是在 Home Assistant OS 监视器或 Docker 中直接运行 rtl_433_mqtt_hass.py。引用脚本的描述：

> 为 rtl_433 设备发布 Home Assistant MQTT 自动发现主题。

> rtl_433_mqtt_hass.py 连接到 MQTT，并订阅 rtl_433 发布到 MQTT 的事件流。该脚本发布其他 MQTT 主题，Home Assistant 可以使用这些主题自动发现并最小化配置新设备。

> 该脚本发布的配置主题告诉 Home Assistant 订阅哪些 MQTT 主题，以接收通过 MQTT 作为设备主题发布的数据。

有关更多信息，请参阅 [原始脚本](https://github.com/merbanan/rtl_433/blob/a20cd1a62caa52dad97e4a99f8373b2fba3986d9/examples/rtl_433_mqtt_hass.py) 和 [Home Assistant MQTT 发现文档](https://www.home-assistant.io/docs/mqtt/discovery/)。

## 先决条件

此插件在您已经运行 rtl_433 并将“事件”和“设备”数据发布到 MQTT 的情况下才有用。如果您希望在运行 Home Assistant OS 的同一台机器上设置此功能，最简单的方法可能是使用 [rtl_433 Home Assistant 插件](https://github.com/pbkhrv/rtl_433-hass-addons/tree/main/rtl_433)。

## Home Assistant 插件

### 安装

要安装此 Home Assistant 插件，您需要首先添加 rtl_433 插件仓库：

 1. 在监视器面板中导航到“插件商店”选项卡

 2. 点击右上角的菜单按钮，选择“仓库”

 3. 在“添加仓库”字段中输入 https://github.com/pbkhrv/rtl_433-hass-addons

 4. 向下滚动，选择“rtl_433 MQTT 自动发现”插件并安装。

 5. 仅在尝试添加新设备时建议运行该插件。关闭“开机自启”，在插件配置中启用 `mqtt_retain`，启动插件以注册新设备，然后完成后关闭它。否则，`rtl_433` 可能会检测到许多边缘的设备，或瞬时设备，如轮胎压力监测传感器（TPMS），将许多不需要的设备添加到 Home Assistant。

### 配置

默认情况下，此插件假定已安装官方 Mosquitto 插件。在这种情况下，MQTT 连接信息会自动确定。否则，要使用外部代理，请提供以下配置选项：

* `mqtt_host`
* `mqtt_port`
* `mqtt_user`
* `mqtt_password`

以下选项适用于所有代理配置：

* `mqtt_retain`：如果设置为 true，MQTT 代理将在重启之间保留配置主题。默认是 `false`。
* `rtl_topic`：rtl_433 发布输出的 MQTT 主题。默认是 "rtl_433"。
* `device_topic_suffix`：设备主题后缀，这对于在更换电池时保持设备主题稳定非常有帮助。如果使用此选项，请在 rtl_433 配置中设置类似 `devices=rtl_433/localhost/devices[/type][/model][/subtype]/C[channel:0],events=rtl_433/localhost/events` 的行，然后设置此值以与设备部分匹配（例如 `devices[/type][/model][/subtype]/C[channel:0]`）。请记住，这只是一个后缀 - 部分 `rtl_433/localhost` 将从 MQTT 事件主题中获取。
* `discovery_prefix`：Home Assistant [查找发现信息](https://www.home-assistant.io/docs/mqtt/discovery/#discovery_prefix) 的 MQTT 主题前缀。默认是 "homeassistant"。
* `discovery_interval`：发布发现信息的频率，单位为秒。默认是 600。
* `force_update`：在发现配置中使用 `force_update` 标志。详细信息见 [这里](https://www.home-assistant.io/integrations/sensor.mqtt/#force_update)。

## 独立自动发现 Docker 部署

按照以下步骤在专用容器中仅运行自动发现脚本。对于此设置，我们建议使用 [hertzg/rtl_433_docker](https://github.com/hertzg/rtl_433_docker) 镜像来运行 `rtl_433` 本身。

```
docker run -e MQTT_HOST=mqtt.example.com -e MQTT_USERNAME=username -e MQTT_PASSWORD=password ghcr.io/pbkhrv/rtl_433-hass-addons-rtl_433_mqtt_autodiscovery-amd64
```

用您适当的架构替换 `amd64`。对于 Raspberry Pi，这取决于您 Pi 版本和操作系统，可以分别是 `armhf`、`armv7` 或 `aarch64`。如果不确定，在命令行运行 `arch` 可以帮助识别架构。

使用 docker-compose：

```
version: '3'
services:
  rtl_433_autodiscovery:
    container_name: rtl_433_autodiscovery
    image: ghcr.io/pbkhrv/rtl_433-hass-addons-rtl_433_mqtt_autodiscovery-amd64 # 在 Raspberry Pi 上将 `amd64` 替换为适当的架构。
    environment:
      - MQTT_HOST=mqtt.example.com
      - MQTT_USERNAME=username
      - MQTT_PASSWORD=password
      # - MQTT_PORT=1883
      # - RTL_TOPIC=rtl_433/+/events
      # - DISCOVERY_PREFIX=homeassistant
      # - DISCOVERY_INTERVAL=600
      # - LOG_LEVEL=debug
      # - OTHER_ARGS=--retain