# Home assistant 插件: birdnet-pi

[![Donate][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![Donate][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![Ingress](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![Builder](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有给我的仓库点赞的人！要点赞，请点击下方的图片，然后它会在右上角显示。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意：如需在没有 HomeAssistant 的情况下使用（经典的 docker 容器），请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一种用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 github 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作由 @Nachtzuster 和其他开发者在一个 актив fork (https://github.com/Nachtzuster/BirdNET-Pi) 上继续进行。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的可靠基本镜像
- 由于 https://github.com/gdraheim/docker-systemctl-replacement 支持的工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便保留和便于访问
- 允许修改存储鸟类歌曲的位置（最好是外部硬盘）
- 支持 ingress，以便在不暴露端口的情况下安全远程访问

## 配置

---

首先安装，然后首次启动插件
Webui 可以通过两种方式找到：
- 从 HA 的 Ingress（无密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，port 为 birdnet.conf 中定义的端口。当询问密码时，用户名是 `birdnet`，密码是您可以在 birdnet.conf 中定义的（默认为空）。这与插件选项中的密码不同，后者是访问网页终端时必须使用的密码。

网页终端访问：用户名 `pi`，密码：如插件选项中所定义。

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟类歌曲文件的文件夹 # 如果希望避免分析堵塞，应该使用SSD
MQTT_DISABLED : 如果为真，则禁用自动 mqtt 发布。仅在已有本地代理时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始或从设置开始直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将在 tmpfs 内的临时文件夹 "/tmp/Processed" 中保存的最后 wav 文件数量（以避免磁盘磨损），以便您想要检索它们。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问网页终端的用户密码
localdisks: sda1 # 将要挂载的驱动器硬件名称用逗号分隔或其标签输入。例：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，所有 smb 共享相同
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许设置 smb 共享的域
```

- Config.yaml
可以使用位于 /config/db21ed7f_birdnet-pi/config.yaml 的 config.yaml 文件通过 Filebrowser 插件配置其他变量

- Config_env.yaml
可以在那里配置其他环境变量

## 安装

---

安装此插件相对简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的 home assistant 实例中（在 supervisor 插件商店右上角，或者如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 设置插件选项以满足您的偏好
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对其进行操作。
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果已安装 mqtt，插件将自动更新每个已检测物种的 birdnet 主题。

## 使用 ssl

---

选项 1：安装 let's encrypt 插件，生成证书。它们默认是 certfile.pem 和 keyfile.pem，存储在 /ssl 中。只需在插件选项中启用 ssl 即可正常工作。

选项 2：启用 80 端口，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 改进检测

---

### 增益提升

在终端选项卡中使用 alsamixer，确保音量足够高但又不要过高（不要进入红色区域）  
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠子导致噪音变大。

### AUX 到 USB 适配器

根据我的测试，只有使用 KT0210（例如 Ugreen）的适配器才有效。我没有检测到基于 ALC 的适配器。

### 麦克风比较

推荐的麦克风（[完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen AUX 到 USB 转接器：灵敏度最佳，采用领夹技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：使用心形指向技术，灵敏度最佳

结论是，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya BY-LM40 是非常好的折中方案，因为 birndet 模型分析的是 0-15000Hz 范围。

![图片](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在此](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严谨的研究者中受到诟病。然而，它似乎确实显著提高了检测质量！以下是在 HA 中实现的方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择降噪设备作为输入设备

### 高通滤波

应避免使用，因为该模型使用整个 0-15khz 范围。

## 常见问题

尚不可用

## 支持

在 github 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)