## &#9888; 打开的issue : [🐛 [Birdnet-go] 重启时音频设置被覆盖 (打开于2025-02-21)](https://github.com/alexbelgium/hassio-addons/issues/1781) 由 [@Lotwook](https://github.com/Lotwook)
## &#9888; 打开的issue : [🐛 [Birdnet-go] USB麦克风在UI中可选择，但无法正常工作 (打开于2025-03-12)](https://github.com/alexbelgium/hassio-addons/issues/1808) 由 [@melor](https://github.com/melor)
## &#9888; 打开的issue : [🐛 [BirdNET-Go] HA Ingress URL未重定向到带日期的URL (打开于2025-04-02)](https://github.com/alexbelgium/hassio-addons/issues/1830) 由 [@phobiac](https://github.com/phobiac)
# Home Assistant 插件：Birdnet-Go

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-go%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-go%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-go%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20基础)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20让我%20喝%20一杯%20咖啡%20(无%20PayPal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20让我%20喝%20一杯%20咖啡%20使用%20PayPal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一位给我的仓库点赞的人！想要点赞请点击下面的图片，然后会出现在右上角。谢谢！_

[![点赞者列表 @alexbelgium/hassio-addons](https://reporoster.com/stars/alexbelgium/hassio-addons)](https://github.com/alexbelgium/hassio-addons/stargazers)


![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-go/stats.png)

## 关于

[BirdNET-Go](https://github.com/tphakala/birdnet-go/tree/main) 是由 @tphakala 开发的用于连续鸟类监测和识别的AI解决方案

该插件基于他们的docker镜像构建。

## 配置

安装后，首次启动插件。Webui可以在 <http://homeassistant:8080> 找到。
你需要一个麦克风：可以使用连接到HA的麦克风或者rstp摄像头的音频流。

音频剪辑文件夹可以通过从插件选项挂载外部或SMB驱动器来存储，然后指定路径而不是 "clips/"。例如，"/mnt/NAS/Birdnet/"

选项可以通过三种方式进行配置：

- 插件选项

```yaml
ALSA_CARD : 板卡号（通常是0或1），请参见 https://github.com/tphakala/birdnet-go/blob/main/doc/installation.md#deciding-alsa_card-value
TZ: Etc/UTC 指定要使用的时区，详见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
COMMAND : realtime --rtsp url # 允许为birdnet-go提供参数
```

- Config.yaml
额外的变量可以使用在/config/db21ed7f_birdnet-go/config.yaml中找到的config.yaml文件进行配置，可以使用Filebrowser插件

- Config_env.yaml
可以在这里配置额外的环境变量

## 安装

安装此插件相当简单，与安装任何其他插件没有区别。

1. 将我的插件仓库添加到你的Home Assistant实例中（在Supervisor附加库的右上角，或如果你已经配置了我的HA，点击下面的按钮）

   [![打开你的Home Assistant实例并显示添加插件仓库对话框，预填充特定仓库URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储你的配置。
4. 根据你的喜好设置插件选项。
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开webUI并调整软件选项。

## 与HA的集成

Home Assistant集成说明在这里， [Birdnet-Go插件：Home Assistant集成](./HAINTEGRATION.md)

## 使用VLC设置RTSP源

VLC打开一个TCP端口，但流是udp。因此需要配置Birdnet-Go以使用udp。将config.yaml文件调整为udp或使用birdnet-go命令行选项：

`--rtsptransport udp --rtsp rtsp://192.168.1.21:8080/stream.sdp`

### Linux说明

使用以下命令之一在没有界面的情况下运行vlc：

```bash
# 这应该适用于大多数设备
/usr/bin/vlc -I dummy -vvv alsa://hw:0,0 --no-sout-all --sout-keep --sout '#transcode{acodec=mpga}:rtp{sdp=rtsp://:8080/stream.sdp}'

# 如果第一个命令不起作用，请尝试这个命令
/usr/bin/vlc -I dummy -vvv alsa://hw:4,0 --no-sout-all --sout-keep --sout '#rtp{sdp=rtsp://:8080/stream.sdp}'
```

运行 `arecord -l` 以获取麦克风硬件信息

```text
**** 捕获硬件设备列表 ****
card 0: PCH [HDA Intel PCH], device 0: ALC3220 Analog [ALC3220 Analog]
  子设备：1/1
  子设备 #0: 子设备 #0
card 2: S7 [SteelSeries Arctis 7], device 0: USB Audio [USB Audio]
  子设备：1/1
  子设备 #0: 子设备 #0
card 3: Nano [Yeti Nano], device 0: USB Audio [USB Audio]
  子设备：1/1
  子设备 #0: 子设备 #0
card 4: 设备 [USB PnP声音设备], device 0: USB Audio [USB Audio]
  子设备：0/1
  子设备 #0: 子设备 #0
```

hw:4,0 = **卡4**: 设备 [USB PnP声音设备], **设备0**: USB Audio [USB Audio]

Systemd服务文件示例。根据需要调整用户:组。如果你想以root身份运行，可能需要运行vlc-wrapper而不是vlc。

```text
[Unit]
Description=VLC Birdnet RTSP服务器
Wants=network-online.target
After=network-online.target

[Service]
Type=simple
StandardOutput=journal
ExecStart=/usr/bin/vlc -I dummy -vvv alsa://hw:0,0 --sout '#transcode{acodec=mpga}:rtp{sdp=rtsp://:8080/stream.sdp}'
User=somebody
Group=somegroup

[Install]
WantedBy=multi-user.target
```

## 常见问题

尚未提供

## 支持

在GitHub上创建一个issue

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-go/main/doc/BirdNET-Go-dashboard.webp)