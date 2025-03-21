# Home assistant 插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 勋章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个为我的仓库加星的人！要加星，请点击下面的图像，然后它将出现在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个基于 BattyBirdNET-Analyzer 的 Raspberry Pi 4/5 实时声学蝙蝠和鸟类分类系统。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 通过 https://github.com/gdraheim/docker-systemctl-replacement 实现的工作 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在 RAM 中存储临时文件，以避免磁盘磨损
- 将所有配置文件暴露到 /config，以便持久存储和易于访问
- 允许修改存储鸟鸣的地点（最好是外部硬盘）
- 支持入口，允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
Webui 可以通过两种方式找到：
- 从 HA 的入口（无密码，但某些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，端口为 birdnet.conf 中定义的端口。当请求密码时，用户名为 `birdnet`，密码为您可以在 birdnet.con 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是用来访问Web终端的。

Web终端访问：用户名 `pi`，密码：如插件选项中定义。

您将需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您想避免分析堵塞，应该是一个 SSD
MQTT_DISABLED : 如果为真，则禁用自动 MQTT 发布。仅在本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从引导开始直播，或从设置中开始
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将在 tmpfs 中临时文件夹 "/tmp/Processed" 中保存的最后 wav 文件数量（因此没有磁盘磨损），以便您想要检索它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 web 终端的用户密码
localdisks: sda1 #将要挂载的硬件名称按逗号分隔，或其标签。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，按逗号分隔的 smb 服务器列表
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享都相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许设置 smb 共享的域
```

- Config.yaml
可以通过在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件使用附加变量进行配置，使用 Filebrowser 插件。

- Config_env.yaml
可以在此配置附加的环境变量。

## 安装

---

该插件的安装非常简单，与安装其他任何插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例（在主管理器插件商店右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定插件库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以保存您的配置。
1. 根据您的喜好设置插件选项。
1. 启动插件。
1. 检查插件的日志，以查看一切是否顺利。
1. 打开 webUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中执行这些操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题。

## 使用 SSL

---

选项 1：安装 let's encrypt 插件，生成证书。默认存储在 /ssl 中的证书为 certfile.pem 和 keyfile.pem。只需从插件选项中启用 SSL，它就可以正常工作。

选项 2：启用端口 80，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 声卡增益

在终端选项卡中使用 alsamixer，确保音量水平足够高但不太高（不要在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠在我的情况下会导致更糟的噪音。

### AUX 到 USB 适配器

根据我的测试，只有使用 KT0210 的适配器（如 Ugreen 的）有效。我无法检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 usb 连接器：最佳灵敏度与拉瓦利尔技术
- Boya By-LM40：最佳质量/价格比
- Hyperx Quadcast：最佳灵敏度与心形技术

结论是，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya By-LM40 是一个非常好的折衷，因为 birndet 模型分析的是 0-15000Hz 范围。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在一些严肃的研究者中受到抵制。然而，它似乎确实显著提高了检测质量！在 HA 中的操作方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择被回声消除的设备作为输入设备。

### 高通滤波器

应避免，因为该模型使用整个 0-15kHz 范围。

## 常见问题

尚未提供。

## 支持

在 GitHub 上创建一个问题。