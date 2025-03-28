## &#9888; 开放问题: [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (打开时间：2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)
# 家庭助理附加组件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请%20给我%20一杯咖啡%20(无%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请%20给我%20一杯%20咖啡%20用%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库加星的人！要加星请点击下面的图片，然后会显示在右上角。谢谢！_

[![星标者仓库名册 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个用于 Raspberry Pi 4/5 的实时声学蝙蝠和鸟类分类系统，基于 BattyBirdNET-Analyzer。

附加组件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳健基础镜像
- 多亏 https://github.com/gdraheim/docker-systemctl-replacement，工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在 RAM 中存储临时文件以避免磁盘磨损
- 将所有配置文件暴露到 /config 以允许持久性和轻松访问
- 允许修改存储鸟歌的位置（最好是外部 HDD）
- 支持 Ingress，以便允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动附加组件
Webui 可以通过两种方式找到：
- 通过 HA 的 Ingress（没有密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，端口为在 birdnet.conf 中定义的端口。当要求输入密码时，用户名为 `birdnet`，密码为您可以在 birdnet.con 中定义的密码（默认为空）。这与附加组件选项中的密码不同，附加组件选项中的密码是用于访问 web 终端的。

Web 终端访问：用户名 `pi`，密码：如附加组件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 摄像头的音频流。

可以通过三种方式配置选项：

- 附加组件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟歌文件的文件夹 # 如果您希望避免分析过程中的拥堵，应该是 SSD
MQTT_DISABLED : 如果为 true，将禁用自动 mqtt 发布。仅在已有本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动或从设置开始直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将保存在 tmpfs （无磁盘磨损）中的临时文件夹 "/tmp/Processed" 内的最后 wav 文件数量，以便在想要检索时使用。这个数量可以从附加组件选项中进行调整
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 web 终端的用户密码
localdisks: sda1 #通过逗号分隔输入要挂载的磁盘的硬件名称或其标签，如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，逗号分隔
cifsusername: "用户名" # 可选，所有 smb 共享通用的 smb 用户名
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许设置 smb 共享的域
```

- Config.yaml
使用位于 /config/db21ed7f_battybirdnet-pi/config.yaml 中的 config.yaml 文件配置其他变量，可以使用 Filebrowser 附加组件

- Config_env.yaml
可以在那里配置其他环境变量

## 安装

---

此附加组件的安装非常简单，与安装其他附加组件没有区别。

1. 将我的附加组件仓库添加到您的家庭助理实例（在超管附加组件商店，右上角，或如果您已经配置了我的 HA，请点击下面的按钮）
   [![打开您的家庭助理实例，并显示添加附加组件仓库对话框，预先填充特定的仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志，以查看一切是否顺利。
7. 打开 webUI 并调整软件选项

## 与 HA 集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中进行操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，附加组件会自动在每次检测到物种时更新 birdnet 主题

## 使用 SSL

---

选项 1：安装 let's encrypt 附加组件，生成证书。它们默认存储在 /ssl 的 certfile.pem 和 keyfile.pem 中。只需从附加组件选项中启用 ssl，即可正常工作。

选项 2：启用 80 端口，定义您的 battybirdnet-pi URL 为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 声卡增益

在终端选项卡中使用 alsamixer，确保音量足够高，但不能过高（不在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的案例中，添加铁氧体珠会导致更糟的噪音

### AUX 转 USB 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）适配器可以工作。我未能使基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + Ugreen AUX 转 USB 适配器：最好的灵敏度，采用领夹式技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，采用心形拾音技术

结论是，使用 Dahua 的麦克风足够好，EM272 是最佳选择，但 Boya By-LM40 是一个很好的妥协，因为 birndet 模型分析 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪受到严肃研究人员的批评。然而，它确实显著提高了检测质量！以下是在 HA 中执行的方法：
- 使用 Portainer 附加组件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa 以添加行 `load-module module-echo-cancel`
- 进入终端附加组件，输入 `ha audio restart`
- 在附加组件选项中选择回声消除设备作为输入设备

### 高通滤波

应避免，因为该模型使用整个 0-15kHz 范围

## 常见问题

尚不可用

## 支持

在 GitHub 上创建问题

---