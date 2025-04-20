## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 你无法编辑此安装的设置 (创建于 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) by [@Bongo2](https://github.com/Bongo2)
# 家庭助手插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=代码审查)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20我%20喝%20咖啡%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20我%20喝%20咖啡%20通过%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的库点星的人！要点星，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![@alexbelgium/hassio-addons的星标列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个基于 Raspberry Pi 4/5 的实时声学蝙蝠和鸟类分类系统，建立在 BattyBirdNET-Analyzer 之上。

附加程序的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 由于 https://github.com/gdraheim/docker-systemctl-replacement，工作良好的 docker 系统
- 使用 HA 的 pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config，便于持久化和访问
- 允许修改存储鸟鸣的路径（最好是外部硬盘）
- 支持 ingress，允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动附加程序
Webui 可以通过两种方式找到：
- 从 HA 访问 Ingress（没有密码，但某些功能可能不工作）
- 直接访问 <http://homeassistant:port>，端口为在 birdnet.conf 中定义的端口。当被要求输入密码时，用户名为 `birdnet`，密码为您可以在 birdnet.con 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是访问 web 终端时必须使用的密码

Web 终端访问：用户名 `pi`，密码：如在插件选项中定义

您将需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

可以通过三种方式配置选项：

- 附加程序选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果您想避免分析堵塞，应该是 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在已有本地代理时有效
LIVESTREAM_BOOT_ENABLED: 从启动或设置开始直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将保存到临时文件夹 "/tmp/Processed" 中的最后 wav 文件数量（因此没有磁盘磨损），以便您想要检索它们。此数量可以从附加程序选项中调整
TZ: Etc/UTC 指定要使用的时区，请参阅 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 web 终端的用户密码
localdisks: sda1 #输入驱动器的硬件名称，以逗号隔开，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出 smb 服务器，以逗号隔开
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享使用相同用户名
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许设置 smb 共享的域
```

- Config.yaml
使用 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量，使用 Filebrowser 附加程序

- Config_env.yaml
可以在此处配置附加环境变量

## 安装

---

安装此附加程序非常简单，与安装其他附加程序没有什么不同。

1. 将我的附加程序库添加到您的家庭助手实例中（在监督员附加程序商店右上角，或如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的家庭助手实例并显示添加附加程序库对话框，特定仓库 URL 已预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加程序。
3. 点击 `保存` 按钮以保存您的配置。
4. 根据您的喜好设置附加程序选项。
5. 启动附加程序。
6. 检查附加程序的日志，以查看是否一切正常。
7. 打开 webUI 并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中对此进行操作
进一步信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果已经安装 mqtt，附加程序会在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1：安装 let's encrypt 附加程序，生成证书。默认存储在 /ssl 的 certfile.pem 和 keyfile.pem。只需从附加程序选项中启用 ssl，它就会工作。

选项 2：启用 80 端口，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 调增音量

在终端选项卡中使用 alsamixer，确保音量足够高，但不要过高（不在红色区域内）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 脉冲

在我这儿增加脉冲环会导致噪音变得更糟。

### Aux 转 usb 转接头

根据我的测试，只有使用 KT0210 的转接头（例如 Ugreen 的）能正常工作。我无法让基于 ALC 的转接头被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 usb 转接头：最佳灵敏度，使用领夹技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，使用心形技术

结论，使用 Dahua 的麦克风就足够了，EM272 是最佳选择，但 Boya by-lm40 是一个非常好的折中选择，因为 birndet 模型分析 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪声 ([完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

严肃的研究人员对去噪声并不赞成。然而，它似乎明显提高了检测质量！以下是如何在 HA 中进行：
- 使用 Portainer 附加程序，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端附加程序，输入 `ha audio restart`
- 在附加程序选项中选择回声消除设备作为输入设备

### 高通滤波

应避免使用，因为模型使用整个 0-15khz 范围。

## 常见问题

尚不可用。

## 支持

在 GitHub 上创建一个问题。

---