## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (已开启于2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2) 提出
## &#9888; 开放问题 : [🐛 [Birdnet-Pi] 备份/恢复/移动 (已开启于2025-03-28)](https://github.com/alexbelgium/hassio-addons/issues/1823) 由 [@Grey-Lancaster](https://github.com/Grey-Lancaster) 提出

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=版本&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=架构&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub超级代码检查器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20代码%20基础)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=构建器)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/请我喝杯咖啡%20(没有%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/请我喝杯咖啡%20(使用%20Paypal)-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库点赞的人！要点赞，点击下面的图片，然后它会在右上角。谢谢！_

[![点赞者列表 @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 有关在没有 HomeAssistant 的情况下使用的说明（经典 Docker 容器），请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的人工智能解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的稳定基本镜像
- 得益于 https://github.com/gdraheim/docker-systemctl-replacement 的有效 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config 以允许持久性和轻松访问
- 允许修改存储鸟类歌曲的位置（最好是外接硬盘）
- 支持 ingress，以允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
Web 界面可以通过两种方式找到：
- 从 HA 的 Ingress （没有密码但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，端口为 birdnet.conf 中定义的端口。请求密码时的用户名为 `birdnet`，密码是您可以在 birdnet.con 中定义的密码（默认为空）。这与访问 Web 终端时必须使用的插件选项密码不同。

Web 终端访问：用户名 `pi`，密码：在插件选项中定义的密码

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过以下三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟歌文件的文件夹 # 如果您想避免分析时阻塞，它应该是一个 SSD
MQTT_DISABLED : 如果为真，禁用自动 MQTT 发布。仅在本地代理已可用的情况下有效
LIVESTREAM_BOOT_ENABLED: 从启动时或从设置启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将在 tmpfs 中的临时文件夹 "/tmp/Processed" 中保存的最后 WAV 文件数量（以避免磁盘磨损），以便您想要检索它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用于访问 Web 终端的用户密码
localdisks: sda1 # 输入要分隔的硬件驱动器名称，或其标签以挂载。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，使用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，适用于所有 smb 分享
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 分享设置域
```

- Config.yaml
可以通过位于 /config/db21ed7f_birdnet-pi/config.yaml 的 config.yaml 文件使用附加变量进行配置，使用 Filebrowser 插件

- Config_env.yaml
可以在那里配置附加环境变量

## 安装

---

安装这个插件非常简单，与安装其他插件没有不同。

1. 将我的插件库添加到您的 Home Assistant 实例（在监督器插件商店右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库的对话框，特定库 URL 预填充。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装这个插件。
3. 点击 `保存` 按钮以保存您的配置。
4. 将插件选项设置为您所需的首选项
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 WebUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中进行操作
进一步信息：https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会自动在每次检测到物种时更新 birdnet 主题

## 使用 SSL

---

选项 1 : 安装 let's encrypt 插件，生成证书。它们默认存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需在插件选项中启用 SSL，便会生效。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成

## 改善检测

---

### 增益设置

通过在终端标签中使用 alsamixer，确保声音电平足够高但不要过高（不在红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠会导致更糟的噪音

### AUX 转 USB 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的适配器）才能正常工作。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 usb 连接器：最佳灵敏度与领夹式技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度与心形技术

结论，使用 Dahua 的麦克风就足够好，EM272 是最佳选择，但 Boya by-lm40 是一个非常好的折衷，因为鸟类检测模型分析 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

去噪在严肃的研究者中不受欢迎。然而，它似乎显著提高了检测质量！以下是在 HA 中执行此操作的方法：
- 通过 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 在终端插件中，输入 `ha audio restart`
- 在插件选项中选择取消回声的设备作为输入设备

### 高通滤波器

应避免使用，因为模型使用整个 0-15kHz 范围

## 常见问题

尚不可用

## 支持

在 GitHub 上创建问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)