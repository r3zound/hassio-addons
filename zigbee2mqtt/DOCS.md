# 配对

默认情况下，该附加组件的 `permit_join` 设置为 `false`。要允许设备加入，您需要在附加组件启动后激活此选项。现在您可以使用 [内置前端](https://www.zigbee2mqtt.io/information/frontend.html) 来实现这一点。有关如何启用内置前端的详细信息，请参见下一节。

# 启用内置前端

启用 `ingress` 以在您的用户界面中使用前端：**设置 → 附加组件 → Zigbee2MQTT → 在侧边栏中显示**。您可以在 [Zigbee2MQTT 文档](https://www.zigbee2mqtt.io/information/frontend.html) 中找到有关此功能的更多详细信息。

# 配置

## 入门

[入门](https://www.zigbee2mqtt.io/guide/getting-started/#onboarding) 让您可以设置 Zigbee2MQTT，而无需手动输入附加组件配置页面中的详细信息。在全新安装（没有配置）下启动附加组件时，前端将显示快速设置页面，允许您选择各种设置以启动 Zigbee2MQTT。

> [!注意]
> 成功检测到适配器可以选择的情况可能因您的设置/网络而异。您可能需要在页面上 [手动输入这些详细信息](https://www.zigbee2mqtt.io/guide/configuration/adapter-settings.html#basic-configuration)。

> [!提示]
> 您可以通过附加组件配置页面中的切换选项强制重新运行入门（例如，改变适配器）（在选中 `显示未使用的可选配置选项` 后可见）。这将强制入门重新运行，即使您已经成功配置过一次。完成后请确保禁用它。

## 手动

启动 Zigbee2MQTT 所需的配置可在附加组件配置中找到。其余选项可以通过 Zigbee2MQTT 前端进行配置。

> [!警告]
> 通过附加组件配置页面配置的设置将优先于 `configuration.yaml` 页面中的设置（例如，您在附加组件配置页面设置 `rtscts: false`，并在 `configuration.yaml` 中设置 `rtscts: true`，将使用 `rtscts: false`）。 _如果您想通过 YAML 控制整个配置，请从附加组件配置页面中删除它们。_

#### 每个配置部分的示例

- socat
  ```yaml
  enabled: false
  master: pty,raw,echo=0,link=/tmp/ttyZ2M,mode=777
  slave: tcp-listen:8485,keepalive,nodelay,reuseaddr,keepidle=1,keepintvl=1,keepcnt=5
  options: "-d -d"
  log: false
  ```
- mqtt
  ```yaml
  server: mqtt://localhost:1883
  user: my_user
  password: "my_password"
  ```
- serial
  ```yaml
  adapter: zstack
  port: /dev/serial/by-id/usb-Texas_Instruments_TI_CC2531_USB_CDC___0X00124B0018ED3DDF-if00
  ```

# 配置备份

附加组件将在您的数据路径中创建 `configuration.yml` 的备份：`$DATA_PATH/configuration.yaml.bk`。升级时，您应使用此备份将相关值填入新的配置，特别是网络密钥，以避免破坏您的网络并必须重新配对所有设备。
如果没有找到之前的备份，则在附加组件启动时创建配置的备份。

# 启用看门狗

为了在出现软故障（如“适配器断开连接”）的情况下自动重新启动 Zigbee2MQTT，可以使用看门狗。通过将以下内容添加到附加组件配置中来启用它：

```yaml
watchdog: default
```

这将使用默认的看门狗重试延迟，分别为 1 分钟、5 分钟、15 分钟、30 分钟和 60 分钟。自定义延迟也受支持，例如 `watchdog: 5,10,30` 将使用看门狗的重试延迟为 5 分钟、10 分钟和 30 分钟。有关看门狗的更多信息，请参见 [文档](https://www.zigbee2mqtt.io/guide/installation/15_watchdog.html)。

# 为新设备添加支持

如果您有兴趣为 Zigbee2MQTT 添加新设备支持，请参见 [如何支持新设备](https://www.zigbee2mqtt.io/how_tos/how_to_support_new_devices.html)。

# 注意事项

- 根据您的配置，MQTT 服务器配置可能需要包含端口，通常为 `1883` 或 `8883` （用于 SSL 通信）。例如，`mqtt://core-mosquitto:1883` 用于 Home Assistant 的 Mosquitto 附加组件。
- 要查找您公开了哪些串口，请访问 **Supervisor → System → Host system → ⋮ → Hardware**

# Socat

在某些情况下，无法将串行设备转发到 Zigbee2mqtt 运行的容器。这可能是因为设备根本未物理连接到计算机。

可以使用 Socat 通过 TCP 将串行设备转发到 Zigbee2mqtt。有关更多信息，请参阅 [socat 手册](https://linux.die.net/man/1/socat)。

您可以在 Socat 部分中使用以下选项配置 socat 模块：

- `enabled` true/false 启用 socat（默认：false）
- `master` socat 命令行中使用的主地址或第一个地址（强制性）
- `slave` socat 命令行中使用的从地址或第二个地址（强制性）
- `options` 添加到 socat 命令行的额外选项（可选）
- `log` true/false 是否将 socat 的 stdout/stderr 日志记录到 data_path/socat.log （默认：false）

**注意：** 您需要根据自己的需要更改 `master` 和 `slave` 选项。默认值将确保 socat 监听端口 `8485` 并将其输出重定向到 `/dev/ttyZ2M`。Zigbee2mqtt 的串口设置不会自动设置，必须相应更改。