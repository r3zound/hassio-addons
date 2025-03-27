## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (创建于 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub 超级 Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的朋友！如果您想加星，请点击下方图片，然后在右上方。谢谢！_

[![给 @alexbelgium/hassio-addons 的 Stargazers 仓库列表](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 如果没有 HomeAssistant 使用，请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个活跃的分支中继续 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 多亏了 https://github.com/gdraheim/docker-systemctl-replacement 的工作，Docker 系统运行正常
- 使用 HA 的 pulseaudio 服务器
- 使用 HA 的 tmpfs 将临时文件存储在 RAM 中以避免硬盘磨损
- 将所有配置文件暴露到 /config 以允许持久化和便于访问
- 允许修改存储鸟类歌曲的位置（最好是外部 HDD）
- 支持 ingress，以允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
Webui可以通过两种方式找到：
- 从 HA 入口（无需密码，但有些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，端口为在 birdnet.conf 中定义的端口。询问密码时的用户名为 `birdnet`，密码是您可以在 birdnet.conf 中定义的密码（默认为空）。这与插件选项中的密码不同，插件选项中的密码是用于访问 Web 终端的。

Web 终端访问：用户名 `pi`，密码：如插件选项中所定义的。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 相机的音频流。

选项可以通过三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟类歌曲文件的文件夹 # 如果您想避免分析堵塞，应该使用 SSD
MQTT_DISABLED : 如果为真，将禁用自动 mqtt 发布。仅在本地代理可用时有效。
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，还是从设置中开始
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将在 tmpfs 中的临时文件夹 "/tmp/Processed" 中保存的最后 WAV 文件的数量（以避免磁盘磨损），以便您可以检索它们。此数量可以通过插件选项进行调整。
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 #提供您的驱动器的硬件名称，以逗号分隔，或者其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，以逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享使用相同的用户名
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用位于 /config/db21ed7f_birdnet-pi/config.yaml 的 config.yaml 文件通过文件浏览器插件配置其他变量

- Config_env.yaml
可以在此配置其他环境变量

## 安装

---

此插件的安装非常简单，与安装其他插件没有什么不同。

1. 将我的插件仓库添加到您的 Home Assistant 实例中（在 supervisor 插件商店右上角，或如果您已经配置了我的 HA，请点击下方按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的喜好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切顺利。
7. 打开 WebUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后利用 HomeAssistant 处理这些通知
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会在每次检测到物种时自动更新 birdnet 主题

## 使用 SSL

---

选项 1 : 安装 letsencrypt 插件，生成证书。默认情况下它们是 certfile.pem 和 keyfile.pem，存储在 /ssl 中。只需在插件选项中启用 SSL，它就会工作。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成

## 改善检测

---

### 为卡增益

在终端选项卡中使用 alsamixer，确保音量足够高，但不要过高（不要在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠在我的情况下导致更糟的噪音

### AUX 转 USB 适配器

根据我的测试，只有使用 KT0210 的适配器（如 Ugreen 的）有效。我无法检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen AUX 转 USB 连接器 : 最佳灵敏度搭配领夹麦克风技术
- Boya By-LM40 : 性价比最佳
- Hyperx Quadcast : 最佳灵敏度搭配心形指向技术

结论，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya BY-LM40 是个非常好的折中选择，因为 birndet 模型分析的是 0-15000Hz 范围

![图片](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严谨的研究者中受到冷落。然而，它似乎确实显著提高了检测质量！在 HA 中的操作方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa 添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择被取消回声的设备作为输入设备

### 高通滤波

应避免，因为模型使用整个 0-15khz 范围

## 常见问题

尚未提供

## 支持

在 GitHub 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)