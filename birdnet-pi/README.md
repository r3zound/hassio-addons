## &#9888; 打开的问题 : [🐛 [BirdNET-Pi] 时区 (开放日期 2024-12-10)](https://github.com/alexbelgium/hassio-addons/issues/1664) 由 [@alexbelgium](https://github.com/alexbelgium)

# 家庭助理附加组件: birdnet-pi

[![捐赠][donation-badge]](https://www.buymeacoffee.com/alexbelgium)
[![捐赠][paypal-badge]](https://www.paypal.com/donate/?hosted_button_id=DZFULJZTP3UQA)

![版本](https://img.shields.io/badge/dynamic/json?label=Version&query=%24.version&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![入口](https://img.shields.io/badge/dynamic/json?label=Ingress&query=%24.ingress&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)
![体系结构](https://img.shields.io/badge/dynamic/json?color=success&label=Arch&query=%24.arch&url=https%3A%2F%2Fraw.githubusercontent.com%2Falexbelgium%2Fhassio-addons%2Fmaster%2Fbirdnet-pi%2Fconfig.json)

[![Codacy Badge](https://app.codacy.com/project/badge/Grade/9c6cf10bdbba45ecb202d7f579b5be0e)](https://www.codacy.com/gh/alexbelgium/hassio-addons/dashboard?utm_source=github.com&utm_medium=referral&utm_content=alexbelgium/hassio-addons&utm_campaign=Badge_Grade)
[![GitHub Super-Linter](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/weekly-supelinter.yaml?label=Lint%20code%20base)](https://github.com/alexbelgium/hassio-addons/actions/workflows/weekly-supelinter.yaml)
[![构建器](https://img.shields.io/github/actions/workflow/status/alexbelgium/hassio-addons/onpush_builder.yaml?label=Builder)](https://github.com/alexbelgium/hassio-addons/actions/workflows/onpush_builder.yaml)

[donation-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20(no%20paypal)-%23d32f2f?logo=buy-me-a-coffee&style=flat&logoColor=white
[paypal-badge]: https://img.shields.io/badge/Buy%20me%20a%20coffee%20with%20Paypal-0070BA?logo=paypal&style=flat&logoColor=white

_感谢每一个给我的仓库加星的人！要加星，请点击下面的图片，然它将在右上角，谢谢！_

[![Stargazers repo roster for @alexbelgium/hassio-addons](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/.github/stars2.svg)](https://github.com/alexbelgium/hassio-addons/stargazers)

![下载演变](https://raw.githubusercontent.com/alexbelgium/hassio-addons/master/birdnet-pi/stats.png)

## 关于

_注意 : 对于不使用 HomeAssistant 的用法（经典的 docker 容器），请参见 [这里](https://github.com/alexbelgium/hassio-addons/blob/master/birdnet-pi/README_standalone.md)_

---

[birdnet-pi](https://github.com/Nachtzuster/BirdNET-Pi) 是一个用于持续鸟类监测和识别的 AI 解决方案，最初由 @mcguirepr89 在 github 上开发 (https://github.com/mcguirepr89/BirdNET-Pi)，其工作的延续者是 @Nachtzuster 和其他开发人员，在一个活跃的分支上进行开发 (https://github.com/Nachtzuster/BirdNET-Pi)

该附加组件的特点 :
- 由 [linuxserver](https://github.com/linuxserver/docker-baseimage-debian) 提供的强大基础镜像
- 受益于 https://github.com/gdraheim/docker-systemctl-replacement 的工作 docker 系统
- 使用 HA pulseaudio 服务器
- 使用 HA tmpfs 将临时文件存储在内存中，避免磁盘磨损
- 将所有配置文件暴露到 /config，以便于持久性和便捷访问
- 允许修改存储鸟鸣的地点（最好是外部硬盘）
- 支持 ingress，允许安全的远程访问而不暴露端口

## 配置

---

安装后，首次启动附加组件
Webui 可以通过两种方式找到 :
- 从 HA 进入（无需密码，但某些功能无法使用）
- 直接访问 <http://homeassistant:port>，port 为鸟鸣配置中的定义端口。当要求输入密码时，用户名为 `birdnet`，密码为在 birdnet.con 中可以定义的密码（默认为空）。这与附加组件选项中的密码不同，后者是用来访问网页终端的密码。

网页终端访问 : 用户名 `pi`，密码 : 按附加组件选项中定义的。

你将需要一个麦克风 : 要么使用连接到 HA 的麦克风，要么使用 rstp 摄像头的音频流。

选项可以通过三种方式配置 :

- 附加组件选项

```yaml
BIRDSONGS_FOLDER: 存储鸟鸣文件的文件夹 # 如果想避免分析繁忙，应该是一个 SSD
MQTT_DISABLED : 如果为 true，则禁用自动 mqtt 发布。仅在有本地经纪人可用时有效
LIVESTREAM_BOOT_ENABLED: 从启动开始直播，或者从设置开始
PROCESSED_FOLDER_ENABLED : 如果启用，您需要在 birdnet.conf（或 birdnet 的设置中）设置将在 tmpfs 内的临时文件夹 "/tmp/Processed" 中保存的最后 n 个 wav 文件的数量（以避免磁盘磨损），以便于将来检索。此数量可以从附加组件选项进行调整
TZ: Etc/UTC 指定要使用的时区，请参见 https://en.wikipedia.org/wiki/List_of_tz_database_time_zones#List
pi_password: 设置用户密码以访问网页终端
localdisks: sda1 #输入要挂载的驱动器的硬件名称，用逗号分隔，或其标签。例如 sda1, sdb1, MYNAS...
networkdisks: "//SERVER/SHARE" # 可选，要挂载的 smb 服务器列表，用逗号分隔
cifsusername: "用户名" # 可选，所有 smb 共享的 smb 用户名
cifspassword: "密码" # 可选，smb 密码
cifsdomain: "域" # 可选，允许为 smb 共享设置域
```

- Config.yaml
可以使用位于 /config/db21ed7f_birdnet-pi/config.yaml 中的 config.yaml 文件配置附加变量，使用 Filebrowser 附加组件。

- Config_env.yaml
可以在其中配置其他环境变量

## 安装

---

安装此附加组件非常简单，与安装任何其他附加组件没有不同。

1. 将我的附加组件库添加到您的家庭助理实例（在 supervisord 附加商店右上角，或点击下方按钮，如果你已配置了我的 HA）
   [![打开您的 Home Assistant 实例，并显示附加组件库对话框，特定库 URL 自动填写。](https://my.home-assistant.io/badges/supervisor_add_addon_repository.svg)](https://my.home-assistant.io/redirect/supervisor_add_addon_repository/?repository_url=https%3A%2F%2Fgithub.com%2Falexbelgium%2Fhassio-addons)
2. 安装此附加组件。
3. 点击 `保存` 按钮保存您的配置。
4. 根据您的偏好设置附加组件选项
5. 启动附加组件。
6. 检查附加组件的日志，查看一切是否顺利。
7. 打开 webUI 并调整软件选项

## 与 HA 的集成

---
### Apprise

您可以使用 apprise 发送 mqtt 通知，然后在 HomeAssistant 中对这些通知进行操作
更多信息 : https://wander.ingstar.com/projects/birdnetpi.html

### 自动 mqtt

如果 mqtt 已安装，附加组件将自动更新每个检测到的物种的 birdnet 主题

## 使用 ssl

---

选项 1 : 安装 let's encrypt 附加组件，生成证书。默认情况下，它们是 certfile.pem 和 keyfile.pem，存储在 /ssl 中。只需从附加组件选项启用 ssl，它将正常工作。

选项 2 : 启用端口 80，将您的 BirdNET-Pi URL 定义为 https。证书将由 caddy 自动生成。

## 改进检测

---

### 增益卡

使用终端选项中的 alsamixer，确保音量足够高但又不太高（不要进入红色部分）
https://github.com/mcguirepr89/BirdNET-Pi/wiki/Adjusting-your-sound-card

### 铁氧体

添加铁氧体珠在我的情况下导致了更大的噪声

### Aux到usb适配器

根据我的测试，只有使用 KT0210（如 Ugreen 的适配器）才能正常工作。我无法让基于 ALC 的适配器被检测到。

### 麦克风比较

推荐的麦克风（[完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/39)）：
- Clippy EM272 (https://www.veldshop.nl/en/smart-clippy-em272z1-mono-omni-microphone.html) + ugreen aux to usb 连接器 : 最佳灵敏度与领夹技术
- Boya By-LM40 : 最佳质量/价格
- Hyperx Quadcast : 最佳灵敏度与心形技术

结论：使用 Dahua 的麦克风足够好，EM272 最佳，但 Boya by-lm40 是一个非常好的折中选择，因为 birndet 模型分析了 0-15000Hz 范围

![image](https://github.com/alexbelgium/hassio-addons/assets/44178713/df992b79-7171-4f73-b0c0-55eb4256cd5b)

### 降噪 ([完整讨论在这里](https://github.com/mcguirepr89/BirdNET-Pi/discussions/597))

降噪在严谨的研究者中受到批评。然而，它似乎确实显著提高了检测质量！在 HA 中实现它的方法：
- 使用 Portainer 附加组件，进入 hassio_audio 容器，并修改文件 /etc/pulse/system.pa，添加行 `load-module module-echo-cancel`
- 进入终端附加组件，输入 `ha audio restart`
- 在附加选项中选择消除回声的设备作为输入设备

### 高通

应避免使用，因为模型使用了整个 0-15khz 范围。

## 常见问题

尚未提供

## 支持

在 github 上创建一个问题

---

![插图](https://raw.githubusercontent.com/tphakala/birdnet-pi/main/doc/birdnet-pi-dashboard.webp)