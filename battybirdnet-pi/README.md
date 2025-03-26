# Home assistant 插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![进入](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有为我的代码库加星的人！要加星，请点击下面的图片，然后在右上角进行操作。谢谢！_

[![@alexbelgium/hassio-addons 的 Stargazers 代码库名单](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载量演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 介绍

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个实时声学蝙蝠和鸟类分类系统，适用于 Raspberry Pi 4/5，基于 BattyBirdNET-Analyzer。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 得益于 https://github.com/gdraheim/docker-systemctl-replacement 的工作 Docker 系统
- 使用 HA PulseAudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便于持久化和轻松访问
- 允许修改存储鸟鸣声的位置（最好是外部硬盘）
- 支持入口，允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
Webui 可以通过两种方式找到：
- 从 HA 的入口（无密码，但某些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，端口为在 birdnet.conf 中定义的端口。当要求输入密码时，用户名为 `birdnet`，密码是您可以在 birdnet.con 中定义的（默认空白）。这与插件选项中的密码不同，插件选项中定义的密码是用于访问 Web 终端的。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义的

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

选项可以通过三种方式配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣声文件的文件夹 # 如果希望避免分析堵塞，应为 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动时或从设置中启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将保存在 tmpfs 中的临时文件夹 "/tmp/Processed" 中的最后 wav 文件的数量（这样没有磁盘磨损），以便您需要检索它们。这个数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 # 将要挂载的硬盘的硬件名称用逗号分隔，或其标签。例如：sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，待挂载的 smb 服务器列表，用逗号分隔
cifsusername: "username" # 可选，smb 用户名，同样适用于所有 smb 共享
cifspassword: "password" # 可选，smb 密码
cifsdomain: "domain" # 可选，允许为 smb 共享设置域
```

- Config.yaml
在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的配置文件中，可以使用的附加变量。

- Config_env.yaml
可以在此处配置附加环境变量。

## 安装

---

安装这个插件非常简单，与安装其他插件没有什么不同。

1. 将我的插件库添加到您的 home assistant 实例（在监视器插件商店右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，特定仓库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
1. 安装此插件。
1. 点击 `保存` 按钮以存储您的配置。
1. 按照您的偏好设置插件选项
1. 启动插件。
1. 检查插件日志以查看一切是否正常。
1. 打开网页界面并调整软件选项。

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后在 HomeAssistant 中对其进行操作。
更多信息：https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件会自动在检测到每种物种时更新 birdnet 主题。

## 使用 ssl

---

选项 1：安装 let's encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 中的 certfile.pem 和 keyfile.pem。只需在插件选项中启用 ssl，它就会工作。

选项 2：启用 80 端口，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改善检测

---

### 增益调整

在终端选项卡中使用 alsamixer，确保音量足够高但不太高（不要进入红色区域）。
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

在我的情况下，添加铁氧体珠导致噪音更严重。

### AUX 转 USB 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的适配器）才能正常工作。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 usb 适配器：最佳灵敏度，采用 Lavalier 技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，采用心形极性技术

结论，使用 Dahua 的麦克风已经足够好，EM272 是最佳选择，但 Boya By-LM40 是一个非常好的折中，因为 BirdNET 模型分析的 0-15000Hz 范围。

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪被严肃的研究人员所不看好。然而，它似乎确实显著提高了检测的质量！以下是在 HA 中实施的方法：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端插件，输入 `ha audio restart`
- 在插件选项中选择被消除回声的设备作为输入设备。

### 高通滤波

应该避免使用，因为该模型使用整个 0-15kHz 范围。

## 常见问题

尚不可用

## 支持

在 GitHub 上创建一个问题。