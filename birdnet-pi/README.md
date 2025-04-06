## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置（打开于 2025-03-26）](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星，请点击下面的图片，然后会在右上角。谢谢！_

[![查看@alexbelgium/hassio-addons的星标列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 如需在没有 HomeAssistant 的情况下使用（经典的 docker 容器），请见 [此处](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一种用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发（https://github.com/mcguirepr89/BirdNET-Pi），其工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续进行 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 多亏 https://github.com/gdraheim/docker-systemctl-replacement，工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中，以避免磁盘磨损
- 将所有配置文件暴露到 /config 以便持久性和便捷访问
- 允许修改已存储鸟鸣的地点（最好是外部 HDD）
- 支持入口，以便在不暴露端口的情况下进行安全远程访问

## 配置

---

安装，然后首次启动插件
Webui 可以通过两种方式找到：
- 从 HA 进入（无密码，但某些功能无法使用）
- 使用 <http://homeassistant:port> 直接访问，端口为在 birdnet.conf 中定义的端口。请求密码时的用户名为 `birdnet`，密码为您可以在 birdnet.con 中定义的密码（默认为 blank）。这和插件选项中的密码不同，后者是访问Web终端时必须使用的密码。

Web 终端访问：用户名 `pi`，密码：如在插件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

可以通过三种方式进行选项配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您想避免分析阻塞，它应该是 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。 仅在已有本地代理的情况下有效
LIVESTREAM_BOOT_ENABLED: 从启动时开始直播，或从设置
PROCESSED_FOLDER_ENABLED : 如果启用，则需要在 birdnet.conf（或 birdnet 的设置）中设置将在临时文件夹 "/tmp/Processed" 中保存的最近 wav 文件数量（因此没有磁盘磨损），如果您想取回它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问 Web 终端
localdisks: sda1 # 将要挂载的驱动器的硬件名称用逗号分隔，或其标签。 例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，用逗号分隔
cifsusername: "用户名" # 可选，所有 smb 共享的 smb 用户名
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_birdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量，使用 Filebrowser 插件

- Config_env.yaml
可以在此配置其他环境变量

## 安装

---

此插件的安装非常简单，与安装其他任何插件没有不同。

1. 将我的插件仓库添加到您的 Home Assistant 实例中（在管理器插件商店右上角，或者如果您已经配置了我的 HA，请单击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填充特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以保存您的配置。
4. 设置插件选项以符合您的偏好
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 webUI 并调整软件选项

## 与 HA 集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中处理这些通知。
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1 : 安装 let’s encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需从插件选项启用 ssl 即可。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 增益设置

在终端选项卡中使用 alsamixer，确保音量足够高但不太高（不要在红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠子在我的情况中导致更糟的噪音。

### Aux 转 usb 适配器

根据我的测试，只有使用 KT0210（例如 Ugreen 的）适配器有效。我无法检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux to usb 连接器：最佳灵敏度，配有领夹技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，配有心形指向技术

结论，使用 Dahua 的麦克风足够好，EM272 是最佳选择，但 Boya by-lm40 是一个很好的折衷，因为 birdnet 模型分析的频率范围是 0-15000Hz。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严肃的研究者中不受欢迎。然而，它似乎确实显著提高了检测质量！在 HA 中进行操作的方法如下：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择去噪后的设备作为输入设备

### 高通滤波

应避免使用，因为模型使用的是 0-15khz 范围内的整个频谱。

## 常见问题

尚不可用

## 支持

在 GitHub 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)