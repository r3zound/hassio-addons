## &#9888; 打开问题 : [🐛 [BattybirdNET-Pi Docker独立版] 您无法编辑此安装的设置（打开于2025-03-26）](https://github.com/alexbelgium/hassio-addons/issues/1821) by [@Bongo2](https://github.com/Bongo2)
# Home Assistant 插件: battybirdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)
![架构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbattybirdnet-pi%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=白色
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=白色

_感谢所有关注我的仓库的人！要关注，请点击下面的图片，然后它会在右上角。谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/BirdNET-Pi/stats.png)

## 关于

---

[battybirdnet-pi](https://github.com/rdz-oss/BattyBirdNET-Pi) 是一个为 Raspberry Pi 4/5 构建的实时声学蝙蝠和鸟类分类系统，基于 BattyBirdNET-Analyzer。

插件的特点：
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 感谢 https://github.com/gdraheim/docker-systemctl-replacement 的有效 Docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 在内存中存储临时文件，避免磁盘磨损
- 所有配置文件暴露到 /config 以允许持久性和轻松访问
- 允许修改存储鸟类歌曲的位置（最好是外部硬盘）
- 支持入口，以便允许安全的远程访问而无需暴露端口

## 配置

---

安装后，首次启动插件
Webui 可以通过两种方式找到：
- 从 HA 的入口访问（无密码，但某些功能无法使用）
- 通过 <http://homeassistant:port> 直接访问，其中端口为在 birdnet.conf 中定义的端口。请求密码时的用户名是 `birdnet`，密码是您可以在 birdnet.con 中定义的密码（默认为空）。这与插件选项中的密码不同，插件选项中的密码是访问 Web 终端时必须使用的密码。

Web 终端访问：用户名 `pi`，密码：按插件选项中定义的密码

您需要一个麦克风：可以使用连接到 HA 的麦克风或 RSTP 摄像头的音频流。

选项可以通过三种方式进行配置：

- 插件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟歌文件的文件夹 # 如果要避免分析拥堵，应该是 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在本地代理可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动或从设置启动直播
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 设置）中设置将在 "/tmp/Processed" 临时文件夹中保存的最后 wav 文件数量（因此不会磨损磁盘），以备您想要检索。该数量可以从插件选项中调整
TZ: Etc/UTC 指定要使用的时区，参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问 Web 终端
localdisks: sda1 #输入您的驱动器的硬件名称，多个驱动器用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，列出要挂载的 smb 服务器，逗号分隔
cifsusername: "用户名" # 可选，smb 用户名，所有 smb 共享都相同
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用 /config/db21ed7f_battybirdnet-pi/config.yaml 中找到的 config.yaml 文件配置其他变量， 使用 Filebrowser 插件

- Config_env.yaml
可以在此配置其他环境变量

## 安装

---

安装此插件非常简单，与安装其他插件没有区别。

1. 将我的插件库添加到您的 Home Assistant 实例中（在主管插件商店右上角，或如果您已配置我的 HA，请点击下面的按钮）
   [![打开您的 Home Assistant 实例并显示添加插件库对话框，预先填入特定的库 URL。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此插件。
3. 点击 `保存` 按钮以存储您的配置。
4. 设置插件选项以满足您的偏好
5. 启动插件。
6. 检查插件的日志以查看一切是否正常。
7. 打开 WebUI 并调整软件选项

## 与 HA 集成

---
### Apprise

您可以使用 apprise 通过 mqtt 发送通知，然后使用 HomeAssistant 对其进行操作
更多信息 : https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果 mqtt 已安装，插件会在检测到每个物种时自动更新 birdnet 主题

## 使用 ssl

---

选项 1 : 安装 let's encrypt 插件，生成证书。默认情况下，它们是存储在 /ssl 的 certfile.pem 和 keyfile.pem。只需启用插件选项中的 ssl，它就会工作。

选项 2 : 启用 80 端口, 将您的 battybirdnet-pi URL 定义为 https。证书将由 caddy 自动生成

## 改进检测

---

### 卡的增益

使用终端选项卡中的 alsamixer，确保音量足够高但不要过高（不在红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠导致在我的情况下噪音更糟

### AUX 转 USB 适配器

根据我的测试，仅使用 KT0210（如 Ugreen 的）适配器有效。我未能检测到基于 ALC 的适配器。

### 麦克风比较

推荐麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）:
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux 转 usb 连接器 : 使用领夹技术具有最佳灵敏度
- Boya By-LM40 : 质量/价格比最佳
- Hyperx Quadcast : 使用心型技术最佳灵敏度

结论，使用 Dahua 的麦克风已经足够好，EM272 是最佳的，但 Boya by-lm40 是一个很好折衷，因为 birndet 模型分析了 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 去噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

去噪受到严肃研究者的批评。然而，它似乎显著提高了检测质量！这里是在 HA 中的操作方式：
- 使用 Portainer 插件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，增加行 `load-module module-echo-cancel`
- 进入终端插件，并输入 `ha audio restart`
- 在插件选项中选择回声消除设备作为输入设备

### 高通

应避免，因为模型使用整个 0-15khz 的范围

## 常见问题

尚不可用

## 支持

在 GitHub 上创建一个问题

---