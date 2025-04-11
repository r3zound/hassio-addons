## &#9888; 开放问题 : [🐛 [BattybirdNET-Pi Docker 独立版] 您无法编辑此安装的设置 (已于2025-03-26打开)](https://github.com/alexbelgium/hassio-addons/issues/1821) 由 [@Bongo2](https://github.com/Bongo2)
# 家庭助理插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy 徽章](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢所有星标我仓库的人！要星标它，请点击下面的图像，然后它将位于右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个用于 Raspberry Pi 4/5 的实时声学蝙蝠和鸟类分类系统，基于 BattyBirdNET-Analyzer。

插件的特点：
- 基于 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强健基础镜像
- 借助 https://github.com/gdraheim/docker-systemctl-replacement 的工作 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在 RAM 中存储临时文件，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便于持久性和便捷访问
- 允许修改存储鸟类歌曲的位置（最好是外部 HDD）
- 支持入口，以允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动插件
Web 界面可以通过两种方式找到：
- 从 HA 入口（没有密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，其中端口为 birdnet.conf 中定义的端口。询问密码时，用户名为 `birdnet`，密码为您在 birdnet.conf 中定义的密码（默认为空）。这与插件选项中的密码不同，后者是用于访问 Web 终端的密码。

Web 终端访问：用户名 `pi`，密码：如插件选项中定义

您需要一个麦克风：可以使用连接到 HA 的麦克风或 rstp 摄像头的音频流。

可以通过三种方式配置选项：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟歌曲文件的文件夹 # 如果您想避免分析堵塞，它应该是一个 SSD
MQTT_DISABLED : 如果为真，则禁用自动 mqtt 发布。仅在本地代理已可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动时或从设置中启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置）中设置将在临时文件夹 "/tmp/Processed" 内保存的最近 wav 文件的数量（因此没有磁盘磨损），以便于检索。此数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置访问 Web 终端的用户密码
localdisks: sda1 #将您的驱动器的硬件名称用逗号分隔进行挂载，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 分享相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 分享设置域
```

- Config.yaml
可以使用在 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件通过额外变量进行配置，使用 Filebrowser 插件

- Config_env.yaml
可以在这里配置更多环境变量

## 安装

---

这个插件的安装非常简单，并且与安装其他任何插件没有不同。

1. 将我的插件仓库添加到您的家庭助理实例中（在右上角的监督器插件商店中，或如果您已配置我的 HA，请单击下面的按钮）
   [![打开您的家庭助理实例并显示添加插件仓库对话框，特定仓库 URL 预填。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 单击 `保存` 按钮以保存您的配置。
4. 根据您的偏好设置插件选项
5. 启动插件。
6. 检查插件的日志以查看是否一切正常。
7. 打开 WebUI 并调整软件选项

## 与 HA 集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对这些通知进行操作
更多信息： https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果安装了 mqtt，插件将在每次检测到物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1：安装 Let's Encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 的 certfile.pem 和 keyfile.pem。只需从插件选项中启用 ssl，它将正常工作。

选项 2：启用端口 80，将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成。

## 改进检测

---

### 增益设置

使用 Terminal 标签中的 alsamixer，确保音量水平足够高但不太高（不要在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体磁珠在我的案例中导致噪声更严重。

### Aux 到 usb 适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的）适配器有效。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 到 usb 连接器：最佳灵敏度，采用领夹技术
- Boya By-LM40：最佳性价比
- Hyperx Quadcast：最佳灵敏度，采用心形指向技术

结论是，使用 Dahua 的麦克风足够好，EM272 最优，但 Boya by-lm40 是一个非常好的折中，因为 birndet 模型分析了 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪声 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

去噪声在严肃研究者中被视为不受欢迎。然而，它似乎确实显著提高了检测质量！以下是在 HA 中执行的步骤：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入 Terminal 插件，输入 `ha audio restart`
- 在插件选项中选择回声消除设备作为输入设备

### 高通滤波

应该避免，因为模型使用整个 0-15khz 范围

## 常见问题

尚不可用

## 支持

在 GitHub 上创建一个问题

---