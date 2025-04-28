## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (已开启 2025-03-26)](https://github.com/alexbelgium/hassio-addons/issues/1821) by [@Bongo2](https://github.com/Bongo2)

# Home Assistant 插件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建者](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每位给我的仓库点赞的用户！要给我点赞，请点击下面的图片，然后它将出现在右上角。谢谢！_

[![对 @alexbelgium/hassio-addons 的 Stargazers 仓库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 关于在没有 HomeAssistant (经典 docker 容器) 的使用，请见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 GitHub 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个活跃的分支上继续 (https://github.com/Nachtzuster/BirdNET-Pi)

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 多亏 https://github.com/gdraheim/docker-systemctl-replacement 的工作，拥有工作的 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中，以避免磁盘磨损
- 将所有配置文件暴露到 /config，以便于持久性和轻松访问
- 允许修改存储鸟类歌曲的位置（最好是外部硬盘）
- 支持入口，以便在不暴露端口的情况下实现安全远程访问

## 配置

---

首先安装插件，然后首次启动插件
Webui 可通过两种方式找到：
- 从 HA 的入口（没有密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，端口为 birdnet.conf 中定义的端口。当询问密码时，用户名为 `birdnet`，密码为您可以在 birdnet.conf 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是用于访问网页终端的密码。

网页终端访问：用户名 `pi`，密码：按插件选项中定义的密码。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像机的音频流。

可以通过以下三种方式配置选项：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟类歌曲文件的文件夹 # 如果您想避免分析堵塞，应该是一个 SSD
MQTT_DISABLED : 如果为真，则禁用自动 MQTT 发布。仅在有本地代理时有效
LIVESTREAM_BOOT_ENABLED: 从启动或设置中启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将在/tmp/Processed 内的 tmpfs 中保存的最后 wav 文件数量（以避免磁盘磨损），以便您可以检索它们。这个数量可以从插件选项中适配
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问网页终端
localdisks: sda1 #将您要挂载的驱动器的硬件名称用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_birdnet-pi/config.yaml 找到的 config.yaml 文件配置额外变量，使用文件浏览器插件

- Config_env.yaml
可以在此配置额外的环境变量

## 安装

---

安装此插件非常简单，与安装其他任何插件没有区别。

1. 将我的插件仓库添加到您的 Home Assistant 实例（在超级用户插件商店右上角，或如果您已配置我的 HA，点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件仓库对话框，预填特定仓库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志，确认一切正常。
7. 打开 webUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 MQTT 发送通知，然后在 HomeAssistant 中对其进行操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 MQTT

如果安装了 MQTT，插件会在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1 : 安装 Let's Encrypt 插件，生成证书。默认情况下，它们存储在 /ssl 中，文件为 certfile.pem 和 keyfile.pem。只需从插件选项中启用 SSL，即可生效。

选项 2 : 启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成

## 提高检测效果

---

### 卡片增益

在终端选项卡中使用 alsamixer，确保音量足够高，但又不能太高（不要进入红色区域）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠子导致更大的噪音

### AUX 到 USB 适配器

根据我的测试，只有使用 KT0210（例如 Ugreen 的）适配器才能正常工作。我无法识别基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 到 usb 连接器：最佳敏感度和领夹麦克风技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳敏感度与心形指向技术

总结，使用 Dahua 的麦克风就足够了，EM272 是最佳选择，但 Boya By-LM40 是非常好的折中，因为 BirdNET 模型分析的是 0-15000Hz 范围。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严谨的研究者中是不被看好的。然而，它似乎显著提高了检测质量！下面是在 HA 中执行的步骤：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择回音消除的设备作为输入设备

### 高通滤波

应该避免，因为模型使用整个 0-15khz 的范围

## 常见问题

尚未提供

## 支持

在 GitHub 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)